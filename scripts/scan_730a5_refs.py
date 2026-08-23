#!/usr/bin/env python3
"""0x730a4/0x730a5/0x2f398/0x2da30이 .so에 리터럴/PC-상대 산술로 존재하는지 전수 스캔"""
import struct, subprocess

SO = "docs/libLauncher_original.so"
with open(SO, "rb") as f:
    d = f.read()
print(f"so size: {len(d)}")

targets = {
    0x730a4: "0x730a4 (lr-1 = ASCII 데이터)",
    0x730a5: "0x730a5 (lr = 호출 리턴 주소)",
    0x2f398: "0x2f398 (케이스1218 = bl 0x2da30)",
    0x2da30: "0x2da30 (draw_MunjangStore 시작)",
    0x2e0c8: "0x2e0c8 (JIT2 로거 설치)",
    0x2e0d0: "0x2e0d0 (진짜 케이스14 코드)",
    0x12d0:  "0x12d0 (1204*4)",
    0x1bb998:"0x1bb998 (GOT __android_log_print)",
}

print("\n=== 1) 32비트 리터럴 직접 매치 (정렬 무관) ===")
for val, desc in targets.items():
    b = struct.pack("<I", val)
    hits = []
    i = 0
    while True:
        i = d.find(b, i)
        if i < 0: break
        hits.append(i)
        i += 1
    print(f"{desc}: {len(hits)}건 {[hex(h) for h in hits[:10]]}")

print("\n=== 2) PC-상대 산술: add rX, pc, #imm (ARM 0xE28Fxxxx) ===")
# Thumb-2 add.w rX, pc, #imm = 0xF20F 0x0xxx 형태
th_hits = []
for i in range(0, len(d) - 3, 2):
    hw0 = struct.unpack_from("<H", d, i)[0]
    hw1 = struct.unpack_from("<H", d, i + 2)[0]
    if (hw0 & 0xF800) == 0xF000 and (hw0 & 0x0700) == 0x0200 and (hw0 & 0x0080) == 0x0080:
        # add.w (SP-relative 아님): F20F
        if (hw0 & 0xFF0F) == 0xF20F:
            rd = (hw1 >> 8) & 0xF
            imm3 = (hw0 >> 12) & 0x7
            imm8 = hw1 & 0xFF
            i2 = (hw1 >> 10) & 0x1
            i1 = (hw1 >> 9) & 0x1
            imm12 = (i1 << 11) | (i2 << 10) | (imm3 << 8) | imm8
            target = ((i + 4) & ~3) + imm12
            if 0x73080 <= target <= 0x73100 or target in (0x2e0c8, 0x2e0d0, 0x2f398, 0x2da30, 0x730a4, 0x730a5):
                th_hits.append((i, rd, imm12, target))
print(f"Thumb add.w pc 상대: {len(th_hits)}건")
for h in th_hits[:20]:
    print(f"  0x{h[0]:06x}: add.w r{h[1]}, pc, #0x{h[2]:x} -> 0x{h[3]:06x}")

print("\n=== 3) adr/adr.w (Thumb 0xA000~0xA7FF, T2 0xF2AF) ===")
adr_hits = []
for i in range(0, len(d) - 3, 2):
    hw0 = struct.unpack_from("<H", d, i)[0]
    if 0xA000 <= hw0 <= 0xA7FF:
        rd = (hw0 >> 8) & 0x7
        imm8 = hw0 & 0xFF
        target = ((i + 4) & ~3) + imm8 * 4
        if 0x73080 <= target <= 0x73100 or target in (0x2e0c8, 0x2e0d0, 0x2f398, 0x2da30, 0x730a4, 0x730a5):
            adr_hits.append((i, rd, imm8*4, target))
print(f"Thumb adr: {len(adr_hits)}건")
for h in adr_hits[:20]:
    print(f"  0x{h[0]:06x}: adr r{h[1]}, 0x{h[3]:06x}")

print("\n=== 4) bl 타깃 0x2da30 호출부 (draw_MunjangStore 콜러) ===")
calls = []
for i in range(0, len(d) - 3, 2):
    hw0 = struct.unpack_from("<H", d, i)[0]
    hw1 = struct.unpack_from("<H", d, i + 2)[0]
    if (hw0 & 0xF800) == 0xF000 and (hw1 & 0xD000) == 0xD000:
        # BL/BLX (Thumb-2): 11110 S imm10 | 11 J1 1 J2 imm11
        s = (hw0 >> 10) & 0x1
        imm10 = hw0 & 0x3FF
        j1 = (hw1 >> 13) & 0x1
        j2 = (hw1 >> 11) & 0x1
        imm11 = hw1 & 0x7FF
        i1 = ~(j1 ^ s) & 0x1
        i2 = ~(j2 ^ s) & 0x1
        imm = (s << 24) | (i1 << 23) | (i2 << 22) | (imm10 << 12) | (imm11 << 1)
        if imm & (1 << 25): imm -= (1 << 26)
        target = (i + 4 + imm) & 0xFFFFFFFF
        if target == 0x2da30:
            calls.append(i)
print(f"0x2da30 콜러: {len(calls)}건 {[hex(c) for c in calls]}")
