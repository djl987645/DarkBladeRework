#!/usr/bin/env python3
# 0x2e438 리터럴 풀($d) 덤프 + 이 풀을 읽는 코드 전수 확인 → 빈 슬롯 탐색
import struct

SRC = '/root/darkblade-mod/docs/libLauncher_original.so'
data = open(SRC, 'rb').read()

# 0x2e438~0x2e474 ($d 마커 구간) 리터럴 덤프
print('=== 0x2e430~0x2e478 덤프 ===')
for addr in range(0x2e430, 0x2e478, 4):
    val = struct.unpack_from('<I', data, addr)[0]
    print(f'0x{addr:06x}: 0x{val:08x} ({val if val < 0x7fffffff else val - 0x100000000})')

# 이 풀을 읽는 코드 (Thumb-1 ldr literal + ldr.w)
SLOTS = list(range(0x2e438, 0x2e478, 4))
hits = {t: [] for t in SLOTS}
for addr in range(0x1000, len(data) - 2, 2):
    hw = struct.unpack_from('<H', data, addr)[0]
    if (hw & 0xF800) == 0x4800:
        rt = (hw >> 8) & 0x7
        imm8 = hw & 0xFF
        pc = (addr + 4) & ~3
        target = pc + imm8 * 4
        if target in hits:
            hits[target].append((hex(addr), f'ldr r{rt},[pc,#0x{imm8*4:x}]'))
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

print('\n=== 읽는 코드 ===')
for t in SLOTS:
    if hits[t]:
        print(f'0x{t:06x} (0x{struct.unpack_from("<I",data,t)[0]:08x}) ← {hits[t]}')
    else:
        print(f'0x{t:06x} (0x{struct.unpack_from("<I",data,t)[0]:08x}) ← 읽는 곳 없음 [빈 슬롯 후보!]')
