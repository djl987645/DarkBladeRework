#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
libcutils.so 원자 함수 패치 최종 수정 (v2)
이전 패치의 실수: 'cmp rX,#0'은 rX 값을 0으로 만들지 않아
rX가 쓰레기값(예: 0xc4772990)이면 Z=0 → bne 무한 점프.
올바른 수정: 'movs rX,#0' (0xE3B0X000) — rX를 0으로 만들고 Z=1 세팅.
"""
import struct, sys

# (오프셋, 새 인코딩 movs rX,#0)
PATCHES = [
    (0x349c, 0xE3B03000),  # android_atomic_acquire_cas: movs r3,#0
    (0x34c0, 0xE3B02000),  # android_atomic_add:         movs r2,#0
    (0x34dc, 0xE3B02000),  # android_atomic_inc:         movs r2,#0
    (0x34fc, 0xE3B01000),  # android_atomic_dec:         movs r1,#0
    (0x3518, 0xE3B02000),  # android_atomic_and:         movs r2,#0
    (0x3534, 0xE3B02000),  # android_atomic_or:          movs r2,#0
]

def patch_file(path):
    with open(path, 'rb') as f:
        data = bytearray(f.read())
    applied = 0
    for off, new in PATCHES:
        cur = struct.unpack_from('<I', data, off)[0]
        # 이전 패치(cmp) 또는 최초 패치(mov) 또는 원본(cmp) 모두 대체 가능
        struct.pack_into('<I', data, off, new)
        applied += 1
    with open(path, 'wb') as f:
        f.write(data)
    print(f"  [OK] {path}: {applied}건 movs 패치")
    return applied

def verify(path):
    with open(path, 'rb') as f:
        data = f.read()
    ok = True
    for off, new in PATCHES:
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
    for t in targets:
        patch_file(t)
        verify(t)
    print("완료")
