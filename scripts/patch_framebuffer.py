#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
patch_framebuffer.py — initCanvas 프레임버퍼 주입 패치
======================================================
목적: Android 9(Samsung)에서 Canvas.mNativeCanvasWrapper 필드가 없어
initCanvas가 항상 0을 저장 → XGraphics 픽셀 함수가 null 프레임버퍼로 조기 종료(검은 화면).

해법: initCanvas가 GetStaticLongField(AppThread.sFrameBuffer)로
자바가 설정한 픽셀 버퍼 주소(DirectByteBuffer.address)를 읽어 [0x1BCB88]에 저장.

변경 내용 (KTF 원본 기준):
  1. 0x3f42: 0xbc → 0x90, 0x3f46: lsls #1→#2 (슬롯 144 = GetStaticFieldID)
  2. 0x3f56: 0xc8 → 0x97, 0x3f58: lsls #1→#2 (슬롯 151 = GetStaticLongField)
  3. 0x3f60: 0x4661(mov r1,sl) → 0x4641(mov r1,r8) — GetStatic*는 jclass 필요
  4. [0x3f80]: 0xffeb58d8(클래스 0x711E0) → 0xffeb67d4(0x720DC "com/beyond/AppThread")
  5. [0x3f84]: 0xffeb5b54("I" 0x7145C) → 0xffeb67e9(0x720F1 "J")
  6. [0x3f88]: 0xffeb58f0(필드 0x711F8) 유지 — "sFrameBuffer"로 교체
  7. 0x711F8: "mNativeCanvas\0" → "sFrameBuffer\0"
  8. 0x720DC~0x720F0: "com/beyond/AppThread\0" (21B)
  9. 0x720F1: 'J'
  10. [0x5758]: 0x1280 → 0x1284 — 0x5748 함수 저장 대상 변경
      [0x1BB908+0x1280]=[0x1BCB88] (LCD 객체) → [0x1BB908+0x1284]=[0x1BCB8C] (SkBitmap1)
      [0x1BCB88]=NULL 유지 → BH_fbFlushLcdWithFrameBuffer 조기종료 (vtable 콜백 크래시 차단)
      [0x1BCB8C]=DirectByteBuffer → 게임이 A+0x200에 직접 렌더링 (방안 C-2)

JNIEnv 슬롯 (ART 실측 교차검증):
  GetFieldID=94(0x178), GetIntField=100(0x190) — KTF 원본+abort 메시지로 확정
  GetStaticMethodID=113(0x1C4) — "no static method" 에러로 확인
  CallStaticByteMethod=120(0x1E0) — "CallStaticByteMethod" 에러로 확인
  GetStaticFieldID=144(0x240), GetStaticLongField=151(0x25C) — 표준 jni.h 순서

사용법: python3 scripts/patch_framebuffer.py [원본.so] [출력.so]
"""
import sys, hashlib

def main():
    src = sys.argv[1] if len(sys.argv) > 1 else 'docs/libLauncher_original.so'
    dst = sys.argv[2] if len(sys.argv) > 2 else 'src/lib/armeabi-v7a/libLauncher.so'

    data = bytearray(open(src, 'rb').read())
    m = hashlib.md5(data).hexdigest()
    print(f'[입력] {src} md5={m}')
    assert m == '8b13af7ef123fe059bca7217f5ee6b8f', f'KTF 원본 아님: {m}'

    # --- 사전 assert (기대값) ---
    assert data[0x3f42] == 0xbc, f'0x3f42 기대 0xbc, 실제 0x{data[0x3f42]:02x}'
    assert data[0x3f46] == 0x49, f'0x3f46 기대 lsls#1(0x49), 실제 0x{data[0x3f46]:02x}'
    assert data[0x3f56] == 0xc8, f'0x3f56 기대 0xc8, 실제 0x{data[0x3f56]:02x}'
    assert data[0x3f58] == 0x5b, f'0x3f58 기대 lsls#1(0x5b), 실제 0x{data[0x3f58]:02x}'
    assert data[0x3f60:0x3f62] == b'\x51\x46', f'0x3f60 기대 mov r1,sl(0x4651), 실제 {data[0x3f60:0x3f62].hex()}'
    import struct
    assert struct.unpack_from('<I', data, 0x3f80)[0] == 0xffeb58d8, '0x3f80 리터럴 불일치'
    assert struct.unpack_from('<I', data, 0x3f84)[0] == 0xffeb5b54, '0x3f84 리터럴 불일치'
    assert struct.unpack_from('<I', data, 0x3f88)[0] == 0xffeb58f0, '0x3f88 리터럴 불일치'
    assert data[0x711f8:0x711f8+13] == b'mNativeCanvas', '0x711F8 문자열 불일치'
    assert data[0x720dc:0x720f1] == b'\x00' * 0x15, '0x720DC 제로 블록 아님'
    assert struct.unpack_from('<I', data, 0x5758)[0] == 0x1280, '0x5758 리터럴 불일치 (기대 0x1280)'
    # 0x58c20 (XGraphics 버퍼 getter) — 원본 어셈 assert
    assert struct.unpack_from('<H', data, 0x58c26)[0] == 0x2901, '0x58c26 기대 cmp r1,#1 (0x2901)'
    assert struct.unpack_from('<H', data, 0x58c28)[0] == 0xd003, '0x58c28 기대 beq (0xd003)'
    assert struct.unpack_from('<H', data, 0x58c2a)[0] == 0x4b05, '0x58c2a 기대 ldr r3,[pc] (0x4b05)'
    assert struct.unpack_from('<H', data, 0x58c2c)[0] == 0x58d3, '0x58c2c 기대 ldr r3,[r2,r3] (0x58d3)'
    assert struct.unpack_from('<H', data, 0x58c2e)[0] == 0x6d58, '0x58c2e 기대 ldr r0,[r3,#0x54] (0x6d58)'
    assert struct.unpack_from('<I', data, 0x58c40)[0] == 0x268, '0x58c40 리터럴 불일치 (기대 0x268)'

    # --- 패치 적용 ---
    # 1) GetFieldID(94) → GetStaticFieldID(144=0x240): movs #0x90 + lsls #2
    data[0x3f42] = 0x90
    data[0x3f46] = 0x89
    # 2) GetIntField(100) → GetStaticLongField(151=0x25C): movs #0x97 + lsls #2
    data[0x3f56] = 0x97
    data[0x3f58] = 0x9b
    # 2) mov r1, sl → mov r1, r8 (jclass 전달)
    data[0x3f60:0x3f62] = b'\x41\x46'
    # 3) 클래스명 리터럴: 0x711E0 → 0x720DC
    struct.pack_into('<I', data, 0x3f80, 0xffeb67d4)
    # 4) 시그니처 리터럴: "I"(0x7145C) → "J"(0x720F1)
    struct.pack_into('<I', data, 0x3f84, 0xffeb67e9)
    # 5) 필드명 리터럴 유지 (0xffeb58f0 → 0x711F8)
    # 6) 필드명 문자열: "mNativeCanvas" → "sFrameBuffer"
    data[0x711f8:0x711f8+14] = b'sFrameBuffer\x00\x00'
    # 7) 클래스명 문자열 (21B: 20자 + null)
    data[0x720dc:0x720f1] = b'com/beyond/AppThread\x00'
    # 8) 시그니처 'J'
    data[0x720f1] = ord('J')
    # 9) 0x5748 저장 대상: [0x1BCB88] → [0x1BCB8C] (리터럴 0x1280 → 0x1284)
    struct.pack_into('<I', data, 0x5758, 0x1284)

    # --- 사후 assert ---
    assert data[0x3f42] == 0x90
    assert data[0x3f46] == 0x89
    assert data[0x3f56] == 0x97
    assert data[0x3f58] == 0x9b
    assert data[0x3f60:0x3f62] == b'\x41\x46'
    assert struct.unpack_from('<I', data, 0x3f80)[0] == 0xffeb67d4
    assert struct.unpack_from('<I', data, 0x3f84)[0] == 0xffeb67e9
    assert struct.unpack_from('<I', data, 0x3f88)[0] == 0xffeb58f0
    assert bytes(data[0x711f8:0x711f8+14]) == b'sFrameBuffer\x00\x00'
    assert bytes(data[0x720dc:0x720f1]) == b'com/beyond/AppThread\x00'
    assert data[0x720f1] == ord('J')
    assert struct.unpack_from('<I', data, 0x5758)[0] == 0x1284, '0x5758 패치 실패'
    # 0x58c20 패치 사후 assert
    assert struct.unpack_from('<I', data, 0x5758)[0] == 0x1284, '0x5758 패치 실패'
    assert struct.unpack_from('<I', data, 0x5758)[0] == 0x1284, '0x5758 패치 실패 (기대 0x1284)'

    open(dst, 'wb').write(data)
    m2 = hashlib.md5(data).hexdigest()
    print(f'[출력] {dst} md5={m2}')
    print('✅ initCanvas 프레임버퍼 주입 패치 완료 (GetStaticLongField(AppThread.sFrameBuffer))')

if __name__ == '__main__':
    main()
