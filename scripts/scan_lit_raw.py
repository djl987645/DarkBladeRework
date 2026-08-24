#!/usr/bin/env python3
# 0x2e0c8 리터럴을 읽는 Thumb-1 ldr literal (01001 Rt imm8) raw 패턴 전수 스캔
# target = Align(addr+4, 4) + imm8*4 == 0x2e0c8 인 명령 찾기
import struct

SRC = '/root/darkblade-mod/docs/libLauncher_original.so'
data = open(SRC, 'rb').read()
TARGET = 0x2e0c8

hits = []
for addr in range(0x2a00, 0x2f500, 2):
    hw = struct.unpack_from('<H', data, addr)[0]
    if (hw & 0xF800) == 0x4800:  # Thumb-1 ldr literal
        rt = (hw >> 8) & 0x7
        imm8 = hw & 0xFF
        pc = (addr + 4) & ~3
        target = pc + imm8 * 4
        if target == TARGET or target == 0x2e0cc:
            hits.append((hex(addr), hex(hw), rt, imm8, hex(target)))

print(f'0x2e0c8/0x2e0cc 읽는 ldr literal: {len(hits)}건')
for h in hits:
    print(f'  {h[0]}: halfword {h[1]} rt=r{h[2]} imm8=0x{h[3]:x} → {h[4]}')

# 0x2e070~0x2e090 raw 덤프
print('\n=== 0x2e070~0x2e090 raw halfwords ===')
for addr in range(0x2e070, 0x2e090, 2):
    hw = struct.unpack_from('<H', data, addr)[0]
    print(f'0x{addr:06x}: {hw:04x}')
