#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
C-3 계측 패치 v3 — 타겟 0x70eea (BL imm32 bit11=0 필수 제약 준수)
- 0x400e6 리턴 → BL 0x70eea (계측1)
- 0x400a4 BGE → BLT (r9<r6 → 0x400aa 내부루프 / r9>=r6 → 0x400a6 BL)
- 0x400a6~0x400a9 → BL 0x70f3c (새 외부 루프)
- 0x70eea~0x70f03: 계측1 (리턴 로그 + [base+0x189398]=1 강제 + pop {r4-r7,pc})
- 0x70f04~0x70f19: 계측2 (XGraphics+0x54 로그)
- 0x70f1c~0x70f33: 리터럴
- 0x70f3c~0x70f57: 새 외부 루프 (0x400e8~0x400fe 복사 + BL 0xb4c40/0x400a4)
입력: 현재 src/lib/armeabi-v7a/libLauncher.so (1badadd7, v1 패치 상태)
"""
import struct, hashlib

def bl_encode(frm, tgt):
    t = tgt | 1
    imm32 = t - (frm + 4)
    if imm32 < 0:
        imm32 += (1 << 25)
    S = (imm32 >> 24) & 1
    if imm32 & 0x800:
        raise ValueError(f'imm32 0x{imm32:x} bit11=1 (0x{frm:05x}→0x{tgt:05x})')
    imm10 = (imm32 >> 14) & 0x3FF
    I1 = (imm32 >> 13) & 1
    I2 = (imm32 >> 12) & 1
    imm11 = imm32 & 0x7FF
    J1 = I1 ^ (1 - S)
    J2 = I2 ^ (1 - S)
    v1 = 0xF000 | (S << 10) | imm10
    v2 = 0xD000 | (J1 << 13) | (J2 << 11) | imm11
    return v1, v2

path = 'src/lib/armeabi-v7a/libLauncher.so'
data = bytearray(open(path, 'rb').read())
print(f'입력 md5: {hashlib.md5(data).hexdigest()}')

# 1. 0x400e6 → BL 0x70eea
v1, v2 = bl_encode(0x400e6, 0x70eea)
data[0x400e6:0x400ea] = struct.pack('<HH', v1, v2)
print(f'  [패치] 0x400e6: BL 0x70eea = {v1:04x} {v2:04x}')

# 2. 0x400a6~0x400a9 → BL 0x70f3c
v1, v2 = bl_encode(0x400a6, 0x70f3c)
data[0x400a6:0x400aa] = struct.pack('<HH', v1, v2)
print(f'  [패치] 0x400a6: BL 0x70f3c = {v1:04x} {v2:04x}')

# 3. 계측1 @0x70eea~0x70f03 (26B)
instr1 = bytes.fromhex('b40f 1c03 2003 4b0c 4a0a f7ff e836 bc0f 4b0c 447b 2201 6340 bdf0'.replace(' ', ''))
assert len(instr1) == 26
data[0x70eea:0x70eea+len(instr1)] = instr1
print(f'  [패치] 계측1 @0x70eea~0x70f03')

# 4. 계측2 @0x70f04~0x70f19 (22B)
instr2 = bytes.fromhex('b40f 4d0a 447d 7b00 78ea 2003 4902 4a05 f7ff e836 bc0f'.replace(' ', ''))
assert len(instr2) == 22
data[0x70f04:0x70f04+len(instr2)] = instr2
print(f'  [패치] 계측2 @0x70f04~0x70f19')

# 5. 리터럴 @0x70f1c~0x70f33
data[0x70f1c:0x70f24] = b'HERMES\0\0'
data[0x70f24:0x70f28] = b'%x\0\0'
data[0x70f28:0x70f2c] = b'%x\0\0'
data[0x70f2c:0x70f30] = struct.pack('<I', 0x189398)
data[0x70f30:0x70f34] = struct.pack('<I', 0x268)
print('  [패치] 리터럴 @0x70f1c~0x70f33')

# 6. 새 외부 루프 @0x70f3c~0x70f57 (28B)
loop = bytes.fromhex('3501 9b05 9904 1c2a 9600 5858 2314 9301 9903 1c23'.replace(' ', ''))
v1, v2 = bl_encode(0x70f50, 0xb4c40)
loop += struct.pack('<HH', v1, v2)
print(f'  [패치] 0x70f50: BL 0xb4c40 = {v1:04x} {v2:04x}')
v1, v2 = bl_encode(0x70f54, 0x400a4)
loop += struct.pack('<HH', v1, v2)
print(f'  [패치] 0x70f54: BL 0x400a4 = {v1:04x} {v2:04x}')
data[0x70f3c:0x70f3c+len(loop)] = loop
print(f'  [패치] 새 외부 루프 @0x70f3c~0x70f57')

open(path, 'wb').write(data)
print(f'\n출력 md5: {hashlib.md5(data).hexdigest()}')
print('완료')
