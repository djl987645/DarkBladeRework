#!/usr/bin/env python3
# 0x2e000~0x2e090 영역(케이스 13 처리부 추정)으로 점프/분기하는 곳 전수 스캔
# - Thumb-1 B (11100 imm11)
# - Thumb-2 B.W / BL (0xF000 0xD000/0x9000 계열)
# - 리터럴 풀 ldr (pc 상대)로 0x2e000~0x2e090을 가리키는 경우
# - BLX/BX 레지스터 간접은 추적 불가 (무시)
import struct

SRC = '/root/darkblade-mod/docs/libLauncher_original.so'
data = open(SRC, 'rb').read()

RANGE_LO, RANGE_HI = 0x2e000, 0x2e090
hits = []

def in_range(t):
    return RANGE_LO <= t < RANGE_HI

# Thumb-1 B / BLX 등 2B 명령
for addr in range(0x1000, min(len(data)-2, 0x3f500), 2):
    hw = struct.unpack_from('<H', data, addr)[0]
    # Thumb-1 B: 11100 imm11
    if (hw & 0xF800) == 0xE000:
        imm11 = hw & 0x7FF
        if imm11 & 0x400: imm11 -= 0x800
        t = addr + 4 + imm11*2
        if in_range(t):
            hits.append((hex(addr), f'b {hex(t)}', f'hw={hw:04x}'))
    # CBZ/CBNZ: 1011 0x1 imm5 i (0xB100~0xBF00)
    if (hw & 0xF500) == 0xB100:
        i = (hw >> 9) & 1
        imm5 = (hw >> 3) & 0x1F
        t = addr + 4 + ((i << 6) | imm5) * 2
        if in_range(t):
            hits.append((hex(addr), f'cbz/cbnz {hex(t)}', f'hw={hw:04x}'))

# Thumb-2 B.W / BL (4B)
for addr in range(0x1000, min(len(data)-4, 0x3f500), 2):
    hw1 = struct.unpack_from('<H', data, addr)[0]
    hw2 = struct.unpack_from('<H', data, addr+2)[0]
    if (hw1 & 0xF800) == 0xF000:
        if (hw2 & 0xD000) == 0xD000:  # BL
            S = (hw1 >> 10) & 1; imm10 = hw1 & 0x3FF
            J1 = (hw2 >> 13) & 1; J2 = (hw2 >> 11) & 1; imm11 = hw2 & 0x7FF
            I1 = J1 ^ (1-S); I2 = J2 ^ (1-S)
            imm = (S<<24)|(I1<<23)|(I2<<22)|(imm10<<12)|(imm11<<1)
            if imm & 0x1000000: imm -= 0x2000000
            t = addr + 4 + imm
            if in_range(t):
                hits.append((hex(addr), f'bl {hex(t)}', f'hw={hw1:04x} {hw2:04x}'))
        elif (hw2 & 0xD000) == 0x9000:  # B.W
            S = (hw1 >> 10) & 1; imm10 = hw1 & 0x3FF
            J1 = (hw2 >> 13) & 1; J2 = (hw2 >> 11) & 1; imm11 = hw2 & 0x7FF
            I1 = J1 ^ (1-S); I2 = J2 ^ (1-S)
            imm = (S<<24)|(I1<<23)|(I2<<22)|(imm10<<12)|(imm11<<1)
            if imm & 0x1000000: imm -= 0x2000000
            t = addr + 4 + imm
            if in_range(t):
                hits.append((hex(addr), f'b.w {hex(t)}', f'hw={hw1:04x} {hw2:04x}'))

# ldr literal로 0x2e000~0x2e090을 가리키는 경우 (함수 포인터 테이블?)
for addr in range(0x1000, min(len(data)-2, 0x3f500), 2):
    hw = struct.unpack_from('<H', data, addr)[0]
    if (hw & 0xF800) == 0x4800:
        rt = (hw >> 8) & 7
        imm8 = hw & 0xFF
        t = ((addr + 4) & ~3) + imm8*4
        if in_range(t):
            hits.append((hex(addr), f'ldr r{rt} ← {hex(t)} (리터럴!)', f'hw={hw:04x}'))

print(f'0x2e000~0x2e090 점프/참조: {len(hits)}건')
for h in hits:
    print(f'  {h[0]}: {h[1]}  [{h[2]}]')
