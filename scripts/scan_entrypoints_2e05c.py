#!/usr/bin/env python3
"""0x2e05c~0x2e08e 블록 진입점 스캔: 이 범위로 점프/블하는 모든 코드"""
from capstone import *

SO = "docs/libLauncher_original.so"
with open(SO, "rb") as f:
    d = f.read()

RANGE_LO, RANGE_HI = 0x2e05c, 0x2e090
targets = set()

# 모든 BL/B (Thumb + Thumb-2) 타깃 수집
md = Cs(CS_ARCH_ARM, CS_MODE_THUMB)
md.skipdata = True

# 1) Thumb-2 BL/B.W: 0xF000~0xF7FF + hw1 (11xx for BL, 10xx for B.W)
for i in range(0, RANGE_HI, 2):
    hw0 = int.from_bytes(d[i:i+2], "little")
    if 0xF000 <= hw0 <= 0xF7FF:
        hw1 = int.from_bytes(d[i+2:i+4], "little")
        if (hw1 & 0xD000) == 0xD000:  # BL/BLX
            s = (hw0 >> 10) & 1; imm10 = hw0 & 0x3FF
            j1 = (hw1 >> 13) & 1; j2 = (hw1 >> 11) & 1; imm11 = hw1 & 0x7FF
            i1 = (~(j1 ^ s)) & 1; i2 = (~(j2 ^ s)) & 1
            imm = (s << 24) | (i1 << 23) | (i2 << 22) | (imm10 << 12) | (imm11 << 1)
            if imm & (1 << 25): imm -= (1 << 26)
            t = (i + 4 + imm) & 0xFFFFFFFF
            if RANGE_LO <= t < RANGE_HI:
                targets.add((i, "bl", t))
        elif (hw1 & 0xD000) == 0x8000:  # B.W
            s = (hw0 >> 10) & 1; imm10 = hw0 & 0x3FF
            j1 = (hw1 >> 13) & 1; j2 = (hw1 >> 11) & 1; imm11 = hw1 & 0x7FF
            i1 = (~(j1 ^ s)) & 1; i2 = (~(j2 ^ s)) & 1
            imm = (s << 24) | (i1 << 23) | (i2 << 22) | (imm10 << 12) | (imm11 << 1)
            if imm & (1 << 25): imm -= (1 << 26)
            t = (i + 4 + imm) & 0xFFFFFFFF
            if RANGE_LO <= t < RANGE_HI:
                targets.add((i, "b.w", t))

# 2) Thumb 16비트 B: 0xE000~0xE7FF (cond), 0xE7FF~0xE7FF? unconditional b = 0xE000~0xE7FF
for i in range(0, RANGE_HI, 2):
    hw = int.from_bytes(d[i:i+2], "little")
    if 0xE000 <= hw <= 0xE7FF:
        imm8 = hw & 0xFF
        if hw & 0x0800: imm8 -= 0x100
        t = (i + 4 + imm8 * 2) & 0xFFFFFFFF
        if RANGE_LO <= t < RANGE_HI:
            targets.add((i, "b", t))

# 3) 0x2e05c~0x2e090 블록 디스어셈블
print("=== 0x2e040~0x2e090 디스어셈블 ===")
for insn in md.disasm(d[0x2e040:0x2e090], 0x2e040):
    print(f"0x{insn.address:06x}: {insn.mnemonic:8s} {insn.op_str}")

print(f"\n=== {hex(RANGE_LO)}~{hex(RANGE_HI)}로 점프/블하는 곳: {len(targets)}건 ===")
for t in sorted(targets):
    print(f"  0x{t[0]:06x}: {t[1]} → 0x{t[2]:06x}")
