#!/usr/bin/env python3
"""dex 바이트에서 0x2e0c8 / 0x2e0d0 / 0x12D0 / 0x4B4 / 0x4C2 상수 검색"""
import struct, sys

def load_dex(apk_path, dex_name="classes.dex"):
    import zipfile
    with zipfile.ZipFile(apk_path) as z:
        for n in z.namelist():
            if n.endswith(dex_name):
                return z.read(n)
    return None

def fmt(n): return f"0x{n:08x}"

def main():
    apk = "/root/darkblade-mod/dist/darkblade-signed.apk"
    data = load_dex(apk)
    if data is None:
        print("dex not found"); return
    print(f"dex size: {len(data)} bytes")

    targets = {
        0x2e0c8: "0x2e0c8 (케이스14 오염 주소)",
        0x2e0d0: "0x2e0d0 (진짜 케이스14 코드)",
        0x2e0c9: "0x2e0c9 (Thumb 비트)",
        0x2e0d1: "0x2e0d1 (Thumb 비트)",
        0x12d0:  "0x12d0 (1204*4)",
        0x12c8:  "0x12c8 (1202*4)",
    }

    for val, desc in targets.items():
        # const 0x14 [A:4][B:32 리틀엔디안]
        b = struct.pack("<I", val)
        hits = []
        for i in range(len(data) - 5):
            if data[i] == 0x14 and data[i+2:i+6] == b:
                hits.append(i)
        # const/high16 0x15 [A:4][B:16] -> 값은 상위 16비트
        hb = struct.pack("<H", (val >> 16) & 0xFFFF)
        hits_h = []
        for i in range(len(data) - 3):
            if data[i] == 0x15 and data[i+2:i+4] == hb:
                hits_h.append(i)
        print(f"\n{desc}:")
        print(f"  const(0x14) 매치 {len(hits)}건: {[fmt(h) for h in hits[:10]]}")
        print(f"  const/high16(0x15, 상위={hb.hex()}) 매치 {len(hits_h)}건: {[fmt(h) for h in hits_h[:10]]}")

    # const/4, const/16: 0x2e0c8은 16비트 초과라 불가, 0x12d0은 const/16 가능
    for val, desc in [(0x12d0, "0x12d0 (const/16)"), (0x4b4, "0x4b4 (1204)"), (0x4c2, "0x4c2 (1218)")]:
        b = struct.pack("<H", val & 0xFFFF)
        hits = []
        for i in range(len(data) - 3):
            if data[i] == 0x13 and data[i+2:i+4] == b:  # const/16
                hits.append(i)
        print(f"\n{desc}: const/16(0x13) {len(hits)}건: {[fmt(h) for h in hits[:10]]}")

if __name__ == "__main__":
    main()
