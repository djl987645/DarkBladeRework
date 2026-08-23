#!/usr/bin/env python3
"""0x2e0c8 / 0x2e0cc 리터럴을 읽는 ldr [pc, #imm] 전수 스캔 (Thumb + Thumb-2)"""
from capstone import *
import sys

SO = "docs/libLauncher_original.so"
with open(SO, "rb") as f:
    d = f.read()

# Thumb 리터럴 ldr: 0x4800~0x4FFF (ldr rX, [pc, #imm8*4])
targets = {0x2e0c8: "0x2e0c8", 0x2e0cc: "0x2e0cc", 0x2e0b0: "0x2e0b0(테이블베이스 델타)"}
readers = {k: [] for k in targets}
th2_readers = []

# 1) Thumb 16비트 ldr (0x4800~0x4FFF)
for i in range(0, 0x70f6c - 4, 2):
    hw = int.from_bytes(d[i:i+2], "little")
    if 0x4800 <= hw <= 0x4FFF:
        rt = (hw >> 8) & 0x7
        imm = (hw & 0xFF) * 4
        addr = ((i + 4) & ~3) + imm
        for t, name in targets.items():
            if addr == t:
                readers[t].append(i)

# 2) Thumb-2 ldr.w rX, [pc, #imm12]: 0xF8DF 0x0xxx
for i in range(0, 0x70f6c - 4, 2):
    hw0 = int.from_bytes(d[i:i+2], "little")
    hw1 = int.from_bytes(d[i+2:i+4], "little")
    if (hw0 & 0xFBFF) == 0xF8DF:
        rt = (hw1 >> 8) & 0xF
        imm12 = hw1 & 0xFFF
        addr = ((i + 4) & ~3) + imm12
        for t, name in targets.items():
            if addr == t:
                readers[t].append((i, "ldr.w"))

# 3) movw/movt로 0x2e0c8/0x2e0cc 구성?
print("=== 리터럴 0x2e0c8/0x2e0cc/0x2e0b0 읽는 곳 ===")
for t, name in targets.items():
    hits = readers[t]
    print(f"{name}: {len(hits)}건")
    for h in hits:
        if isinstance(h, tuple):
            print(f"  0x{h[0]:06x} {h[1]}")
        else:
            print(f"  0x{h:06x} ldr(16bit)")

# 4) 각 읽는 곳 주변 디스어셈블 (문맥)
print("\n=== 0x2e078 주변 (0x2e060~0x2e090) ===")
md = Cs(CS_ARCH_ARM, CS_MODE_THUMB)
md.skipdata = True
for insn in md.disasm(d[0x2e060:0x2e090], 0x2e060):
    print(f"0x{insn.address:06x}: {insn.mnemonic:8s} {insn.op_str}")

# 5) 0x2e0c8 ~ 0x2e0d0 리터럴 풀 재확인
print("\n=== 0x2e0c0 ~ 0x2e0d4 덤프 ===")
for off in range(0x2e0c0, 0x2e0d4, 4):
    v = int.from_bytes(d[off:off+4], "little")
    print(f"0x{off:06x}: 0x{v:08x}")
