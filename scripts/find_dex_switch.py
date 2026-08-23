#!/usr/bin/env python3
"""dex에서 0x2f398 / 0x730a4 등 추가 상수 + packed/sparse-switch payload 파싱"""
import struct, zipfile

def load_dex(apk_path):
    with zipfile.ZipFile(apk_path) as z:
        for n in z.namelist():
            if n.endswith(".dex"):
                return z.read(n)
    return None

def fmt(n): return f"0x{n:08x}"

def main():
    apk = "/root/darkblade-mod/dist/darkblade-signed.apk"
    data = load_dex(apk)
    print(f"dex size: {len(data)}")

    targets = {
        0x2f398: "0x2f398 (케이스1218 핸들러=재귀 bl)",
        0x2da30: "0x2da30 (draw_MunjangStore 시작)",
        0x730a4: "0x730a4 (lr-1 SIGILL 주소)",
        0x730a5: "0x730a5 (lr)",
        0x750a0: "0x750a0 (ALPHA_L)",
        0x760a5: "0x760a5 (16:21 lr)",
        0x750a5: "0x750a5 (17:20 lr)",
        0x4c2:   "0x4c2 (1218)",
        0x4b4:   "0x4b4 (1204)",
    }
    for val, desc in targets.items():
        b = struct.pack("<I", val)
        hits = []
        for i in range(len(data) - 5):
            if data[i] == 0x14 and data[i+2:i+6] == b:
                hits.append(i)
        # const/16
        hb = struct.pack("<H", val & 0xFFFF)
        hits16 = []
        for i in range(len(data) - 3):
            if data[i] == 0x13 and data[i+2:i+4] == hb:
                hits16.append(i)
        # const/high16
        hhb = struct.pack("<H", (val >> 16) & 0xFFFF)
        hitsh = []
        for i in range(len(data) - 3):
            if data[i] == 0x15 and data[i+2:i+4] == hhb:
                hitsh.append(i)
        print(f"\n{desc}:")
        print(f"  const(0x14) {len(hits)}건: {[fmt(h) for h in hits[:8]]}")
        print(f"  const/16(0x13) {len(hits16)}건: {[fmt(h) for h in hits16[:8]]}")
        print(f"  const/high16(0x15) {len(hitsh)}건: {[fmt(h) for h in hitsh[:8]]}")

    # packed-switch(0x2B) / sparse-switch(0x2C) 명령어 위치 + 페이로드
    print("\n=== switch 명령어 ===")
    packed_insns = []
    sparse_insns = []
    for i in range(len(data) - 1):
        op = data[i]
        if op == 0x2B:  # packed-switch
            packed_insns.append(i)
        elif op == 0x2C:  # sparse-switch
            sparse_insns.append(i)
    print(f"packed-switch 명령어 {len(packed_insns)}건")
    print(f"sparse-switch 명령어 {len(sparse_insns)}건")

    # packed-switch 페이로드 구조: 0x0100 [size:16] [first_key:32] [targets: size*32]
    # 명령어는 3 code unit: op | AA | BBBB (payload 오프셋)
    print("\n=== packed-switch 페이로드 (타깃이 0x2e000~0x2f400 범위인 것) ===")
    for insn_off in packed_insns[:200]:
        # BBBB = payload offset (code unit 기준, 2바이트 단위)
        if insn_off + 4 > len(data): continue
        bbbb = struct.unpack_from("<H", data, insn_off + 2)[0]
        payload_off = insn_off + 2 * bbbb  # code unit * 2 = byte offset
        if payload_off + 8 > len(data): continue
        ident, size = struct.unpack_from("<HH", data, payload_off)
        if ident != 0x0100: continue
        first_key = struct.unpack_from("<i", data, payload_off + 4)[0]
        targets = []
        for t in range(size):
            off = struct.unpack_from("<i", data, payload_off + 8 + t*4)[0]
            targets.append((first_key + t, off))
        # 타깃 절대 주소(insn_off 기준 상대) = insn_off + off*2
        interesting = [(k, insn_off + o*2) for k, o in targets if 0x2d000 <= (insn_off + o*2) <= 0x2f800]
        if interesting or (first_key <= 1218 <= first_key + size) or (first_key <= 14 <= first_key + size):
            print(f"  insn@0x{insn_off:06x} payload@0x{payload_off:06x} first_key={first_key} size={size}")
            for k, o in targets[:20]:
                abs_off = insn_off + o*2
                mark = ""
                if abs_off == 0x2e0c8: mark = " <<< 0x2e0c8!"
                if abs_off == 0x2e0d0: mark = " <<< 0x2e0d0!"
                if abs_off == 0x2f398: mark = " <<< 0x2f398!"
                print(f"    case {k}: rel={o} abs=0x{abs_off:06x}{mark}")

if __name__ == "__main__":
    main()
