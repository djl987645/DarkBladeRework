#!/usr/bin/env python3
"""0x2e0c4 / 0x2e0b8 / 0x2e0bc 리터럴 사용처 확인 (패치 안전성 검증)"""
from capstone import *

SO = "docs/libLauncher_original.so"
with open(SO, "rb") as f:
    d = f.read()

targets = {
    0x2e0c4: "0x2e0c4 (0x7d1/+2001)",
    0x2e0b8: "0x2e0b8 (0x14ba/+5306)",
    0x2e0bc: "0x2e0bc (0x14aa/+5290)",
    0x2e0c0: "0x2e0c0 (0x1388/+5000)",
    0x2e090: "0x2e090 (0x210/+528)",
    0x2e094: "0x2e094 (0xffffff)",
    0x2e098: "0x2e098 (0x1a0/+416)",
}
readers = {k: [] for k in targets}

# Thumb 16비트 ldr (0x4800~0x4FFF) + Thumb-2 ldr.w (0xF8DF)
for i in range(0, 0x70f6c - 4, 2):
    hw = int.from_bytes(d[i:i+2], "little")
    if 0x4800 <= hw <= 0x4FFF:
        imm = (hw & 0xFF) * 4
        addr = ((i + 4) & ~3) + imm
        for t in targets:
            if addr == t:
                readers[t].append(i)
    hw0 = int.from_bytes(d[i:i+2], "little")
    if (hw0 & 0xFBFF) == 0xF8DF:
        hw1 = int.from_bytes(d[i+2:i+4], "little")
        imm12 = hw1 & 0xFFF
        addr = ((i + 4) & ~3) + imm12
        for t in targets:
            if addr == t:
                readers[t].append((i, "ldr.w"))

for t, name in targets.items():
    hits = readers[t]
    print(f"{name}: {len(hits)}건")
    for h in hits:
        if isinstance(h, tuple):
            print(f"  0x{h[0]:06x} {h[1]}")
        else:
            print(f"  0x{h:06x} ldr16")

# 0x2e0c4를 읽는 곳이 있다면 그 주변 디스어셈블
if readers[0x2e0c4]:
    print("\n=== 0x2e0c4 읽는 곳 주변 ===")
    md = Cs(CS_ARCH_ARM, CS_MODE_THUMB)
    md.skipdata = True
    for h in readers[0x2e0c4]:
        off = h[0] if isinstance(h, tuple) else h
        start = off - 8
        for insn in md.disasm(d[start:start+24], start):
            print(f"0x{insn.address:06x}: {insn.mnemonic:8s} {insn.op_str}")
        print()
