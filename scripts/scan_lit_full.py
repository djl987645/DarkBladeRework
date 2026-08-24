#!/usr/bin/env python3
# 전체 .so 범위에서 0x2e0c4/0x2e0c8/0x2e0cc 리터럴을 읽는 모든 코드 스캔
# - Thumb-1 ldr literal (01001 Rt imm8)
# - Thumb-2 ldr.w literal (0xF8DF 0xXimm12)
import struct

SRC = '/root/darkblade-mod/docs/libLauncher_original.so'
data = open(SRC, 'rb').read()
TARGETS = [0x2e0c4, 0x2e0c8, 0x2e0cc]

hits = {t: [] for t in TARGETS}

# Thumb-1 ldr literal
for addr in range(0x1000, len(data) - 2, 2):
    hw = struct.unpack_from('<H', data, addr)[0]
    if (hw & 0xF800) == 0x4800:
        rt = (hw >> 8) & 0x7
        imm8 = hw & 0xFF
        pc = (addr + 4) & ~3
        target = pc + imm8 * 4
        if target in TARGETS:
            hits[target].append((hex(addr), f'ldr r{rt},[pc,#0x{imm8*4:x}]'))

# Thumb-2 ldr.w literal: 0xF8DF imm12 (Rt = bits 15:12 of second halfword)
for addr in range(0x1000, len(data) - 4, 2):
    hw1 = struct.unpack_from('<H', data, addr)[0]
    hw2 = struct.unpack_from('<H', data, addr + 2)[0]
    if hw1 == 0xF8DF:
        rt = (hw2 >> 12) & 0xF
        imm12 = hw2 & 0xFFF
        pc = (addr + 4) & ~3
        target = pc + imm12
        if target in TARGETS:
            hits[target].append((hex(addr), f'ldr.w r{rt},[pc,#0x{imm12:x}]'))

# movw/movt 상수도 확인 (0xfff45f48를 movw/movt로 만들 수 있음)
for t in TARGETS:
    if hits[t]:
        print(f'0x{t:06x} 읽는 곳: {hits[t]}')
    else:
        print(f'0x{t:06x} 읽는 곳: 없음 (전체 범위 확정)')
