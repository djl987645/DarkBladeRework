#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
C-3 계측 v3 — initCanvas getter 복원 + [0x1BBB88]/[0x1BCB8C] 런타임 값 로그
목적: getter 패치 회귀 재발 방지(크래시) + fillRect/XGraphics 경로 검은 화면 원인 규명

[Part 1] initCanvas(0x3f20) getter 복원 — 커밋본 9920d3e(=설치본 e20d4786, 실기 검증) 기준
  - 0x3f42: 0xbc→0x90  (movs r1,#0x90  = GetStaticFieldID 슬롯 144)
  - 0x3f46: 0x49→0x89  (lsls r1,r1,#2)
  - 0x3f56: 0xc8→0x97  (movs r3,#0x97  = GetStaticLongField 슬롯 151)
  - 0x3f58: 0x5b→0x9b  (lsls r3,r3,#2)
  - 0x3f60: 0x51→0x41  (mov r1,r8 = jclass 전달)
  - 0x3f80: d858ebff→d467ebff (리터럴 풀 — 문자열 오프셋)
  - 0x3f84: 545bebff→e967ebff (리터럴 풀)
  - 0x711f8: "mNativeCanvas\0..." → "sFrameBuffer\0" (16B)
  - 0x720dc: "com/beyond/AppThread\0J\0\0\0" (23B)

[Part 2] C-3 계측 — 0x40020(리소스 로드) 리턴 시 로그
  - 0x400e6: pop {r4-r7,pc} → b.w 0x72884 (리턴 시점 계측 진입)
  - 0x400a4: bge 0x400e8 → nop (외부 루프 진입 차단 — b.w와의 충돌 방지)
  - 0x72884~0x728a1 (30B): 계측
    push {r4-r7,lr} | mov r5,r0 | movs r0,#3 | ldr r1,[pc,#28] | add r1,pc
    adds r2,r1,#2 | ldr r3,[pc,#24] | add r3,pc | ldr.w r4,[r3,#0x1004]
    ldr r3,[r3] | blx 0x27a4(__android_log_print) | mov r0,r5 | pop {r4-r7,pc}
  - 0x728a8/0x728ac: 리터럴 (0x14A26A=tag, 0x1496F4=[0x1bbb88])
  - 0x1bb6f8 (vaddr 0x1bc6f8): tag "H\0", fmt "%x %x %x\0"
입력: patch_native_probe.py 적용 후 src/lib/armeabi-v7a/libLauncher.so
"""
import struct, hashlib

path = 'src/lib/armeabi-v7a/libLauncher.so'
data = bytearray(open(path, 'rb').read())
print(f'입력 md5: {hashlib.md5(data).hexdigest()}')

# ===== Part 1: initCanvas getter 복원 =====
data[0x3f42] = 0x90   # movs r1, #0x90 (GetStaticFieldID 슬롯 144)
data[0x3f46] = 0x89   # lsls r1, r1, #2
data[0x3f56] = 0x97   # movs r3, #0x97 (GetStaticLongField 슬롯 151)
data[0x3f58] = 0x9b   # lsls r3, r3, #2
data[0x3f60] = 0x41   # mov r1, r8 (jclass)
data[0x3f80:0x3f84] = bytes.fromhex('d467ebff')
data[0x3f84:0x3f88] = bytes.fromhex('e967ebff')
data[0x711f8:0x711f8+16] = b'sFrameBuffer\x00\x00\x00\x00'
data[0x720dc:0x720dc+25] = b'com/beyond/AppThread\x00J\x00\x00\x00'
print('  [패치] initCanvas(0x3f20) getter 복원: 0x3f42/0x3f46/0x3f56/0x3f58/0x3f60 + 리터럴 2곳 + 문자열 2곳')

# ===== Part 2: C-3 계측 =====
# 1. 0x400e6 → b.w 0x72884 (리턴 시점 계측 진입)
data[0x400e6:0x400ea] = bytes.fromhex('32f0cdcf')
print('  [패치] 0x400e6: b.w 0x72884')

# 2. 0x400a4: bge 0x400e8 → nop (외부 루프 진입 차단)
data[0x400a4:0x400a6] = bytes.fromhex('00bf')
print('  [패치] 0x400a4: nop (외부 루프 진입 차단)')

# 3. 계측 @0x72884~0x728a1 (30B)
instr = bytes.fromhex('f0b505460320074979448a1c064b7b44d3f804f51b688ff783ff2846f0bd')
assert len(instr) == 30
data[0x72884:0x72884 + len(instr)] = instr
print('  [패치] 계측 @0x72884~0x728a1')

# 4. 리터럴 @0x728a8 / 0x728ac
data[0x728a8:0x728ac] = struct.pack('<I', 0x14A26A)  # tag: 0x1bc6f8 - 0x7288e
data[0x728ac:0x728b0] = struct.pack('<I', 0x1496F4)  # [0x1bbb88]: 0x1bbb88 - 0x72894
print('  [패치] 리터럴 @0x728a8/0x728ac')

# 5. 문자열 @0x1bb6f8 (vaddr 0x1bc6f8) — 12B
data[0x1bb6f8:0x1bb704] = b'H\x00%x %x %x\x00\x00'
print('  [패치] 문자열 "H" + "%x %x %x" @0x1bc6f8')

open(path, 'wb').write(data)
print(f'출력 md5: {hashlib.md5(data).hexdigest()}')
print('완료')
