import struct
from capstone import Cs, CS_ARCH_ARM, CS_MODE_THUMB
d=open('docs/libLauncher_original.so','rb').read()
md=Cs(CS_ARCH_ARM, CS_MODE_THUMB); md.detail=True

# ArtMethod + 0x1C = entry_point! str rN, [rM, #0x1c] 또는 str.w 패턴 찾기
# Thumb str rN, [rM, #imm]: 0x6000~0x67FF (5비트 imm) → 0x1C = 28 = imm5! 0x601C~0x601F 패턴!
# str.w rN, [rM, #imm12]: 0xF8C0~0xF8CF
print('=== str rN, [rM, #0x1c] (Thumb 2B: 0x60xx) ===')
for a in range(0x2ac8, 0x70f6c, 2):
    h = struct.unpack('<H', d[a:a+2])[0]
    if (h & 0xF800) == 0x6000:
        imm5 = (h >> 6) & 0x1F
        if imm5 == 0x1C:
            rn = (h >> 3) & 0x7
            rt = h & 0x7
            print('0x%05x: str r%d, [r%d, #0x1c]' % (a, rt, rn))
print()
print('=== str.w rN, [rM, #0x1c] (Thumb-2) ===')
for a in range(0x2ac8, 0x70f6c, 2):
    h = struct.unpack('<H', d[a:a+2])[0]
    if (h & 0xFFF0) == 0xF8C0:  # str.w rt, [rn, #imm12]
        h2 = struct.unpack('<H', d[a+2:a+4])[0]
        imm12 = h2 & 0xFFF
        if imm12 == 0x1C:
            rn = h & 0xF
            rt = (h2 >> 12) & 0xF
            print('0x%05x: str.w r%d, [r%d, #0x1c]' % (a, rt, rn))
print()
# 0x1C = 28 → str rN, [rM, #28]! 근데 ArtMethod 구조는 64비트(ptr_sized_fields 4B x 2 = 8B)... 
# Android 9 ArtMethod: declaring_class(4) access_flags(4) dex_code_item_offset(4) dex_method_index(4) 
# ptr_sized_fields { declaring_class(4) dex_cache_resolved_methods(4) dex_cache_resolved_types(4) entry_point_from_quick(4) data(4) } = 0x1C!
# entry_point = 0x1C 확정!
# jmethodID 저장 패턴: 게임 코드가 GetMethodID 후 str r0, [rX, #off] 하는 곳!
print('=== GetMethodID(0x2ad4) 호출부 전체 (이미 0x03ade 확인, 다른 호출부 재확인) ===')
# 모든 bl 0x2ad4 (이미 0x03ade 하나) 
# 대신 jmethodID 사용처: FromReflectedMethod(0x3c) 호출 후 r0 사용!
print('=== JNIEnv[0x3c] (FromReflectedMethod) blx 호출부 ===')
for a in range(0x2ac8, 0x70f6c, 2):
    h = struct.unpack('<H', d[a:a+2])[0]
    if h == 0x1D0C:  # ldr r3, [r3, #0x3c]? 아님! ldr r3, [r1, #0x3c] = 0x5D0C!
        pass
    # ldr rN, [rM, #0x3c] 2B 패턴: 0x6800~0x6FFF imm5=0x1E
    if (h & 0xF800) == 0x6800:
        imm5 = (h >> 6) & 0x1F
        if imm5 == 0x1E:
            rn = (h >> 3) & 0x7
            rt = h & 0x7
            # 다음 2B가 blx r3 (0x47xx, xx=rn)?
            nxt = struct.unpack('<H', d[a+2:a+4])[0]
            if (nxt & 0xFF87) == 0x4700 and (nxt & 0x78) == (rt << 3):
                print('0x%05x: ldr r%d, [r%d, #0x3c]; blx r%d  (FromReflectedMethod!)' % (a, rt, rn, rt))
