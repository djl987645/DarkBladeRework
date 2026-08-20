#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
libcutils.so 원자 함수 패치 버그 수정
원인: LDREX/STREX → LDR/STR 패치 시 'cmp rX,#0'이 'mov rX,#0'으로 잘못 변환됨.
      mov는 Z 플래그를 세팅하지 않아 bne가 항상 점프 → 무한 루프 (utime 130틱/s, pc 0x34d4 고정)
수정: mov rX,#0 (0xE3A0X000) → cmp rX,#0 (0xE35X0000)  [Z=1 세팅 → bne 통과]
"""
import struct, sys

# 패치 지점 (파일 오프셋 = vaddr, .text @0x338c)
# 함수별: (오프셋, 기존 mov 인코딩, 새 cmp 인코딩)
PATCHES = [
    (0x349c, 0xE3A03000, 0xE3530000),  # android_atomic_acquire_cas: mov r3,#0 → cmp r3,#0
    (0x34c0, 0xE3A02000, 0xE3520000),  # android_atomic_add:         mov r2,#0 → cmp r2,#0
    (0x34dc, 0xE3A02000, 0xE3520000),  # android_atomic_inc:         mov r2,#0 → cmp r2,#0
    (0x34fc, 0xE3A01000, 0xE3510000),  # android_atomic_dec:         mov r1,#0 → cmp r1,#0
    (0x3518, 0xE3A02000, 0xE3520000),  # android_atomic_and:         mov r2,#0 → cmp r2,#0
    (0x3534, 0xE3A02000, 0xE3520000),  # android_atomic_or:          mov r2,#0 → cmp r2,#0
]

def patch_file(path):
    with open(path, 'rb') as f:
        data = bytearray(f.read())
    applied = 0
    for off, old, new in PATCHES:
        cur = struct.unpack_from('<I', data, off)[0]
        if cur != old:
            print(f"  [SKIP] {path} @0x{off:x}: 기대 {old:#010x} != 실제 {cur:#010x}")
            continue
        struct.pack_into('<I', data, off, new)
        applied += 1
    with open(path, 'wb') as f:
        f.write(data)
    print(f"  [OK] {path}: {applied}/{len(PATCHES)} 패치 적용")
    return applied

def verify(path):
    with open(path, 'rb') as f:
        data = f.read()
    ok = True
    for off, old, new in PATCHES:
        cur = struct.unpack_from('<I', data, off)[0]
        if cur != new:
            ok = False
            print(f"  [FAIL] {path} @0x{off:x}: {cur:#010x} (기대 {new:#010x})")
    return ok

if __name__ == '__main__':
    targets = sys.argv[1:] or [
        '/root/apk-work/KTF_dec/lib/armeabi/libcutils.so',
        '/root/apk-work/KTF_dec/lib/armeabi-v7a/libcutils.so',
    ]
    total = 0
    for t in targets:
        total += patch_file(t)
        verify(t)
    print(f"\n총 {total}건 패치 완료")
