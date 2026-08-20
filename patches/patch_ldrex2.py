#!/usr/bin/env python3
"""LDREX/STREX -> LDR/STR + 성공 플래그 보정 패치 (ARM & Thumb-2, objdump 파싱 기반)

- ARM LDREX  Rd, [Rn]     -> LDR  Rd, [Rn]        (word & 0xF0FFF000) | 0x05000000
- ARM STREX  Rd, Rt, [Rn] -> STR  Rt, [Rn]        (word & 0xF0FF0000) | 0x05000000 | ((word & 0xF) << 12)
- Thumb-2 LDREX Rt, [Rn]  -> LDR.W Rt, [Rn]       hw1=(hw1&0x0FFF)|0xF000, hw2=hw2&0xF000
- Thumb-2 STREX Rd,Rt,[Rn]-> STR.W Rt, [Rn]       hw1=(hw1&0x0FFF)|0xF000, hw2=hw2&0xF000

STREX 성공 플래그 보정: STREX 다음 명령어가 "CMP Rd, #0"이면
- ARM:  MOV Rd, #0   (0xE3A00000 | (Rd << 12))
- Thumb: MOVS Rd, #0 (0x2000 | (Rd << 8))
단일 스레드 실행에서는 STREX가 항상 성공하므로 의미가 보존된다.
"""
import re
import struct
import subprocess
import sys

REG_MAP = {
    "r0": 0, "r1": 1, "r2": 2, "r3": 3, "r4": 4, "r5": 5,
    "r6": 6, "r7": 7, "r8": 8, "r9": 9, "r10": 10, "r11": 11,
    "r12": 12, "ip": 12, "sp": 13, "lr": 14, "pc": 15,
}

COND_SUFFIX = ("eq", "ne", "cs", "cc", "mi", "pl", "vs", "vc",
               "hi", "ls", "ge", "lt", "gt", "le", "al")


def get_text_section(path):
    out = subprocess.check_output(["readelf", "-S", path], text=True, stderr=subprocess.DEVNULL)
    for line in out.splitlines():
        if ".text" in line and "PROGBITS" in line:
            parts = line.split()
            # "[", "5]", ".text", "PROGBITS", "Addr", "Off", "Size", ...
            return int(parts[4], 16), int(parts[5], 16), int(parts[6], 16)
    return None


def parse_objdump(path):
    """objdump -d 출력 파싱 -> [(addr, opcode, operands, hexbytes), ...]"""
    out = subprocess.check_output(
        ["arm-linux-gnueabi-objdump", "-d", path], text=True, stderr=subprocess.DEVNULL)
    insns = []
    # Thumb-2 32비트: "e851 0f00" (4자 + 공백 + 4자) / ARM 32비트: "e192cf9f" (8자) / Thumb 16비트: "002a" (4자)
    line_re = re.compile(
        r"^\s*([0-9a-f]+):\s+([0-9a-f]{4}(?:\s[0-9a-f]{4})*|[0-9a-f]{8})\s+(\S+)(?:\s+(.*))?$")
    for line in out.splitlines():
        m = line_re.match(line)
        if m:
            addr = int(m.group(1), 16)
            hexbytes = m.group(2).strip()
            opcode = m.group(3)
            operands = (m.group(4) or "").strip()
            insns.append((addr, opcode, operands, hexbytes))
    return insns


def base_opcode(opcode):
    """strexeq -> strex, ldrex -> ldrex"""
    for suf in COND_SUFFIX:
        if opcode.endswith(suf) and len(opcode) > len(suf):
            return opcode[: -len(suf)]
    return opcode


def parse_ldrex_operands(operands):
    """'r0, [r1]' / 'r12, [r2]' -> (Rt, Rn)"""
    m = re.match(r"(\w+),\s*\[(\w+)", operands)
    if not m:
        return None
    return REG_MAP.get(m.group(1)), REG_MAP.get(m.group(2))


def parse_strex_operands(operands):
    """'r2, ip, [r1]' -> (Rd, Rt, Rn)"""
    m = re.match(r"(\w+),\s*(\w+),\s*\[(\w+)", operands)
    if not m:
        return None
    return REG_MAP.get(m.group(1)), REG_MAP.get(m.group(2)), REG_MAP.get(m.group(3))


def is_thumb16(hexbytes):
    return len(hexbytes.replace(" ", "")) == 4


def patch_file(path):
    sec = get_text_section(path)
    if sec is None:
        print(f"{path}: .text 섹션 없음")
        return 0, 0
    text_addr, text_off, _ = sec

    insns = parse_objdump(path)
    with open(path, "rb") as f:
        data = bytearray(f.read())

    def off(addr):
        return addr - text_addr + text_off

    patched_ld = 0
    patched_st = 0
    patched_cmp = 0
    i = 0
    while i < len(insns):
        addr, opcode, operands, hexbytes = insns[i]
        base = base_opcode(opcode)
        foff = off(addr)

        if base == "ldrex":
            if len(hexbytes.replace(" ", "")) == 8:  # 32-bit (ARM or Thumb-2)
                word = struct.unpack_from("<I", data, foff)[0]
                if (word & 0x0FF00FFF) == 0x01900F9F:
                    # ARM LDREX
                    new = (word & 0xF0FFF000) | 0x05000000
                    struct.pack_into("<I", data, foff, new)
                    print(f"  ARM  LDREX @0x{addr:08x}: 0x{word:08x} -> 0x{new:08x}")
                    patched_ld += 1
                else:
                    # Thumb-2 LDREX
                    hw1 = struct.unpack_from("<H", data, foff)[0]
                    hw2 = struct.unpack_from("<H", data, foff + 2)[0]
                    if (hw1 & 0xFFF0) == 0xE850:
                        nhw1 = (hw1 & 0x0FFF) | 0xF000
                        nhw2 = hw2 & 0xF000
                        struct.pack_into("<H", data, foff, nhw1)
                        struct.pack_into("<H", data, foff + 2, nhw2)
                        print(f"  T2   LDREX @0x{addr:08x}: {hw1:04x} {hw2:04x} -> {nhw1:04x} {nhw2:04x}")
                        patched_ld += 1
                    else:
                        print(f"  ?    LDREX @0x{addr:08x}: 알 수 없는 인코딩 (0x{word:08x})")

        elif base == "strex":
            par = parse_strex_operands(operands)
            if par is None:
                print(f"  ?    STREX @0x{addr:08x}: 피연산자 파싱 실패: '{operands}'")
                i += 1
                continue
            rd, rt, rn = par
            if len(hexbytes.replace(" ", "")) == 8:
                word = struct.unpack_from("<I", data, foff)[0]
                if (word & 0x0FF00FF0) == 0x01800F90:
                    # ARM STREX: Rt(3-0) -> 15-12, Rn 유지
                    new = (word & 0xF0FF0000) | 0x05000000 | ((word & 0xF) << 12)
                    struct.pack_into("<I", data, foff, new)
                    print(f"  ARM  STREX @0x{addr:08x}: 0x{word:08x} -> 0x{new:08x} (Rd=r{rd}, Rt=r{rt})")
                    patched_st += 1
                    # 다음 명령어 CMP Rd, #0 확인
                    nxt = None
                    if i + 1 < len(insns):
                        nxt = insns[i + 1]
                    if nxt and base_opcode(nxt[1]) == "cmp":
                        m2 = re.match(r"(\w+),\s*#0\b", nxt[2])
                        if m2 and REG_MAP.get(m2.group(1)) == rd:
                            nfoff = off(nxt[0])
                            nword = struct.unpack_from("<I", data, nfoff)[0]
                            # ARM CMP Rn, #imm: cond 0011 0101 Rn imm12 — Rn은 19-16!
                            if (nword & 0x0FF00000) == 0x03500000:
                                ncw = 0xE3A00000 | (rd << 12)
                                struct.pack_into("<I", data, nfoff, ncw)
                                print(f"      CMP 보정 @0x{nxt[0]:08x}: 0x{nword:08x} -> 0x{ncw:08x} (MOV r{rd}, #0)")
                                patched_cmp += 1
                                i += 1  # CMP는 이미 처리
                else:
                    # Thumb-2 STREX
                    hw1 = struct.unpack_from("<H", data, foff)[0]
                    hw2 = struct.unpack_from("<H", data, foff + 2)[0]
                    if (hw1 & 0xFFF0) == 0xE840:
                        nhw1 = (hw1 & 0x0FFF) | 0xF000
                        nhw2 = hw2 & 0xF000
                        struct.pack_into("<H", data, foff, nhw1)
                        struct.pack_into("<H", data, foff + 2, nhw2)
                        print(f"  T2   STREX @0x{addr:08x}: {hw1:04x} {hw2:04x} -> {nhw1:04x} {nhw2:04x} (Rd=r{rd}, Rt=r{rt})")
                        patched_st += 1
                        # 다음 명령어 CMP Rd, #0 (16비트 Thumb) 확인
                        nxt = None
                        if i + 1 < len(insns):
                            nxt = insns[i + 1]
                        if nxt and base_opcode(nxt[1]) == "cmp" and is_thumb16(nxt[3]):
                            m2 = re.match(r"(\w+),\s*#0\b", nxt[2])
                            if m2 and REG_MAP.get(m2.group(1)) == rd:
                                nfoff = off(nxt[0])
                                nhw = struct.unpack_from("<H", data, nfoff)[0]
                                if (nhw & 0xF800) == 0x2800 and (nhw & 0x00FF) == 0:
                                    ncw = 0x2000 | (rd << 8)
                                    struct.pack_into("<H", data, nfoff, ncw)
                                    print(f"      CMP 보정 @0x{nxt[0]:08x}: {nhw:04x} -> {ncw:04x} (MOVS r{rd}, #0)")
                                    patched_cmp += 1
                                    i += 1
                    else:
                        print(f"  ?    STREX @0x{addr:08x}: 알 수 없는 인코딩 (0x{word:08x})")
        i += 1

    with open(path, "wb") as f:
        f.write(data)
    return patched_ld, patched_st, patched_cmp


if __name__ == "__main__":
    t_ld = t_st = t_cmp = 0
    for p in sys.argv[1:]:
        ld, st, cmp_ = patch_file(p)
        print(f"{p}: LDREX->LDR {ld}개, STREX->STR {st}개, CMP 보정 {cmp_}개")
        t_ld += ld
        t_st += st
        t_cmp += cmp_
    print(f"총: LDREX {t_ld} / STREX {t_st} / CMP 보정 {t_cmp}")
