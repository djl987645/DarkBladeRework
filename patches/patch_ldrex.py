#!/usr/bin/env python3
"""LDREX/STREX -> LDR/STR 변환 패치 (ARM, 리틀엔디언)

LDREX Rd, [Rn]  (0xE19nRdF9F) -> LDR  Rd, [Rn]  (0xE59nRd000)
STREX Rd, Rt, [Rn] (0xE18nRtRdF9) -> STR Rt, [Rn]  (0xE58nRt000)

변환 규칙: word = (word & 0xF0FFF000) | 0x05000000
- 27-24 비트: 0001 -> 0101 (exclusive -> 일반 load/store)
- 11-0 비트: 0 (LDREX의 0xF9F / STREX의 Rd+0xF9 제거)
- 나머지 (cond, Rn, Rt) 유지
"""
import struct
import subprocess
import sys


def get_text_section(path):
    out = subprocess.check_output(["readelf", "-S", path], text=True, stderr=subprocess.DEVNULL)
    for line in out.splitlines():
        if ".text" in line and "PROGBITS" in line:
            parts = line.split()
            # [Nr] Name Type Address Off Size ES Flg Lk Inf Al
            # "[", "5]", ".text", "PROGBITS", "0000338c", "00338c", ...
            addr = int(parts[4], 16)
            off = int(parts[5], 16)
            size = int(parts[6], 16)
            return addr, off, size
    return None


def patch_file(path):
    sec = get_text_section(path)
    if sec is None:
        print(f"{path}: .text 섹션 없음, 건너뜀")
        return 0
    text_addr, text_off, text_size = sec

    with open(path, "rb") as f:
        data = bytearray(f.read())

    patched = 0
    for i in range(text_off, min(text_off + text_size, len(data) - 3), 4):
        word = struct.unpack_from("<I", data, i)[0]
        is_ldrex = (word & 0x0FF00FFF) == 0x01900F9F
        is_strex = (word & 0x0FF000F9) == 0x018000F9
        if is_ldrex or is_strex:
            new = (word & 0xF0FFF000) | 0x05000000
            struct.pack_into("<I", data, i, new)
            vaddr = text_addr + (i - text_off)
            kind = "LDREX" if is_ldrex else "STREX"
            print(f"  {path}: {kind} @0x{vaddr:08x}: 0x{word:08x} -> 0x{new:08x}")
            patched += 1

    with open(path, "wb") as f:
        f.write(data)
    return patched


if __name__ == "__main__":
    total = 0
    for p in sys.argv[1:]:
        n = patch_file(p)
        print(f"{p}: {n}개 패치")
        total += n
    print(f"총 {total}개")
