#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
patch_initcanvas.py — KTF 원본 initCanvas JNI 필드 조회 우회 패치
================================================================
목적: Java_com_beyond_AppThread_initCanvas(0x3f20)의 mNativeCanvas 조회 실패
(Android 9: Canvas.mNativeCanvas(int) 필드 제거)로 인한 CheckJNI abort 차단.

방법: Android 9에 존재하는 필드로 조회를 교체 (이전 설치본 ci2 실측 검증 방식)
  - 필드명: "mNativeCanvas"  @0x711F8 -> "mNativeCanvasWrapper" @0x720DC
  - 시그니처: "I"            @0x7145C -> "J"                   @0x720F1
  - GetIntField(JNIEnv 슬롯 100)  -> GetLongField(JNIEnv 슬롯 101)  (0x3f56: 0xc8->0xca)
  - 리터럴 풀 오프셋 교체: [0x3f84] 0xffeb5b54->0xffeb67e9, [0x3f88] 0xffeb58f0->0xffeb67d4

검증: 패치 후 0x3f56=0xca, [0x3f84]=0xffeb67e9, [0x3f88]=0xffeb67d4,
      0x720DC="mNativeCanvasWrapper", 0x720F1="J"
사용: python3 scripts/patch_initcanvas.py [원본.so] [출력.so]
"""
import sys

SRC = sys.argv[1] if len(sys.argv) > 1 else "docs/libLauncher_original.so"
DST = sys.argv[2] if len(sys.argv) > 2 else "src/lib/armeabi-v7a/libLauncher.so"

def main():
    data = bytearray(open(SRC, "rb").read())

    # 사전 검증 (원본 상태 확인)
    assert data[0x3f56] == 0xc8, f"0x3f56 예상 0xc8, 실제 0x{data[0x3f56]:02x}"
    assert int.from_bytes(data[0x3f84:0x3f88], "little") == 0xffeb5b54, "0x3f84 리터럴 불일치"
    assert int.from_bytes(data[0x3f88:0x3f8c], "little") == 0xffeb58f0, "0x3f88 리터럴 불일치"
    assert data[0x711f8:0x711f8+14] == b"mNativeCanvas\x00", "0x711f8 필드명 확인 실패"  # 13자+null, 4B 정렬 패딩
    assert data[0x7145c:0x7145d] == b"I", "0x7145c 시그니처 확인 실패"
    assert data[0x720dc:0x720f1] == b"\x00" * 21, "0x720dc~0x720f1 제로 구간 아님"  # 0x15 = 21B

    # 1) GetIntField -> GetLongField (JNIEnv 함수 슬롯 100 -> 101)
    data[0x3f56] = 0xca

    # 2) 리터럴 풀 오프셋 교체 (시그니처/필드명 문자열 포인터)
    data[0x3f84:0x3f88] = (0xffeb67e9).to_bytes(4, "little")
    data[0x3f88:0x3f8c] = (0xffeb67d4).to_bytes(4, "little")

    # 3) 문자열 추가 (21B 제로 블록: 0x720DC~0x720F0, 20자+null = 21B 정확히)
    data[0x720dc:0x720f1] = b"mNativeCanvasWrapper\x00"  # 20자+null = 21B
    data[0x720f1] = ord("J")  # 시그니처 "J" (0x720F2 기존 null 종결 유지)

    open(DST, "wb").write(data)

    # 사후 검증
    out = open(DST, "rb").read()
    assert out[0x3f56] == 0xca
    assert int.from_bytes(out[0x3f84:0x3f88], "little") == 0xffeb67e9
    assert int.from_bytes(out[0x3f88:0x3f8c], "little") == 0xffeb67d4
    assert out[0x720dc:0x720f1] == b"mNativeCanvasWrapper\x00"
    assert out[0x720f1:0x720f3] == b"J\x00"
    import hashlib
    print(f"패치 완료: {SRC} -> {DST}")
    print(f"  md5: {hashlib.md5(out).hexdigest()}")
    print(f"  변경: 0x3f56 c8->ca, 0x3f84 0xffeb5b54->0xffeb67e9, 0x3f88 0xffeb58f0->0xffeb67d4, "
          f"0x720DC 'mNativeCanvasWrapper', 0x720F1 'J'")

if __name__ == "__main__":
    main()
