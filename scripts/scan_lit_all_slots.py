#!/usr/bin/env python3
# 전체 .so 범위에서 리터럴 풀 0x2e090~0x2e0cc 전 슬롯을 읽는 코드 스캔 (raw 패턴)
# - Thumb-1 ldr literal (01001 Rt imm8)
# - Thumb-2 ldr.w literal (0xF8DF 0xXimm12)
import struct

SRC = '/root/darkblade-mod/docs/libLauncher_original.so'
data = open(SRC, 'rb').read()
SLOTS = list(range(0x2e090, 0x2e0d0, 4))

hits = {t: [] for t in SLOTS}

# Thumb-1 ldr literal
for addr in range(0x1000, len(data) - 2, 2):
    hw = struct.unpack_from('<H', data, addr)[0]
    if (hw & 0xF800) == 0x4800:
        rt = (hw >> 8) & 0x7
        imm8 = hw & 0xFF
        pc = (addr + 4) & ~3
        target = pc + imm8 * 4
        if target in hits:
            hits[target].append((hex(addr), f'ldr r{rt},[pc,#0x{imm8*4:x}]'))

# Thumb-2 ldr.w literal
for addr in range(0x1000, len(data) - 4, 2):
    hw1 = struct.unpack_from('<H', data, addr)[0]
    hw2 = struct.unpack_from('<H', data, addr + 2)[0]
    if hw1 == 0xF8DF:
        rt = (hw2 >> 12) & 0xF
        imm12 = hw2 & 0xFFF
        pc = (addr + 4) & ~3
        target = pc + imm12
        if target in hits:
            hits[target].append((hex(addr), f'ldr.w r{rt},[pc,#0x{imm12:x}]'))

for t in SLOTS:
    val = struct.unpack_from('<I', data, t)[0]
    if hits[t]:
        print(f'0x{t:06x} (0x{val:08x}) ← {hits[t]}')
    else:
        print(f'0x{t:06x} (0x{val:08x}) ← 읽는 곳 없음 [이전 가능!]')
