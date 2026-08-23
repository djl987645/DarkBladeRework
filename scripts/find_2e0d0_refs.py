import struct
from capstone import Cs, CS_ARCH_ARM, CS_MODE_THUMB
d=open('docs/libLauncher_original.so','rb').read()
md=Cs(CS_ARCH_ARM, CS_MODE_THUMB); md.detail=True

# 1) bl 0x2ad4 (GetMethodID 호출부) 찾기 — 전체 .text 스캔
print('=== bl 0x2ad4 호출부 ===')
for a in range(0x2ac8, 0x70f6c, 2):
    h = struct.unpack('<H', d[a:a+2])[0]
    if (h & 0xF800) == 0xF000:  # Thumb-2 BL 첫 halfword
        h2 = struct.unpack('<H', d[a+2:a+4])[0]
        if (h2 & 0xD000) == 0xD000:
            S = (h >> 10) & 1; imm10 = h & 0x3FF
            J1 = (h2 >> 13) & 1; J2 = (h2 >> 11) & 1; imm11 = h2 & 0x7FF
            I1 = J1 ^ (1 - S); I2 = J2 ^ (1 - S)
            imm32 = (S << 24) | (I1 << 23) | (I2 << 22) | (imm10 << 12) | (imm11 << 1)
            if imm32 & (1 << 24): imm32 -= (1 << 25)
            tgt = (a + 4 + imm32) & 0xFFFFFFFF
            if tgt == 0x2ad4:
                print('0x%05x: bl 0x2ad4' % a)

# 2) 블 0x2E0D0 찾기
print()
print('=== bl/b 0x2E0D0 타깃 ===')
for a in range(0x2ac8, 0x70f6c, 2):
    h = struct.unpack('<H', d[a:a+2])[0]
    if (h & 0xF800) == 0xF000:
        h2 = struct.unpack('<H', d[a+2:a+4])[0]
        if (h2 & 0xD000) == 0xD000:
            S = (h >> 10) & 1; imm10 = h & 0x3FF
            J1 = (h2 >> 13) & 1; J2 = (h2 >> 11) & 1; imm11 = h2 & 0x7FF
            I1 = J1 ^ (1 - S); I2 = J2 ^ (1 - S)
            imm32 = (S << 24) | (I1 << 23) | (I2 << 22) | (imm10 << 12) | (imm11 << 1)
            if imm32 & (1 << 24): imm32 -= (1 << 25)
            tgt = (a + 4 + imm32) & 0xFFFFFFFF
            if tgt == 0x2e0d0:
                print('0x%05x: bl/b 0x2e0d0' % a)

# 3) movw/movt로 0x2E0D0 구성하는 코드 찾기
print()
print('=== movw/movt #0x2E0D0 ===')
for a in range(0x2ac8, 0x70f6c, 2):
    h = struct.unpack('<H', d[a:a+2])[0]
    if (h & 0xFBF0) == 0xF240:  # movw
        h2 = struct.unpack('<H', d[a+2:a+4])[0]
        imm4 = (h >> 4) & 0xF; i = (h >> 10) & 1
        imm3 = (h2 >> 12) & 7; imm8 = h2 & 0xFF
        val = (imm4 << 12) | (i << 11) | (imm3 << 8) | imm8
        if val == 0x2e0d0 or val == 0x2e0c8:
            print('0x%05x: movw r%d, #0x%x' % (a, (h2 >> 8) & 0xF, val))
    if (h & 0xFBF0) == 0xF2C0:  # movt
        h2 = struct.unpack('<H', d[a+2:a+4])[0]
        imm4 = (h >> 4) & 0xF; i = (h >> 10) & 1
        imm3 = (h2 >> 12) & 7; imm8 = h2 & 0xFF
        val = (imm4 << 12) | (i << 11) | (imm3 << 8) | imm8
        if val == 0x2e0d0 or val == 0x2e0c8:
            print('0x%05x: movt r%d, #0x%x' % (a, (h2 >> 8) & 0xF, val))

# 4) 리터럴 0x2E0D0/0x2E0C8 참조 (ldr [pc])
print()
print('=== 리터럴 풀에서 0x2e0d0/0x2e0c8 값 스캔 ===')
for a in range(0x2ac8, 0x70f6c, 4):
    v = struct.unpack('<I', d[a:a+4])[0]
    if v == 0x2e0d0 or v == 0x2e0c8 or v == 0x2e0d1:
        print('0x%05x: 값 0x%08x' % (a, v))
