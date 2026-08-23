import struct
d=open('docs/libLauncher_original.so','rb').read()

# 1. bl 0x2da30 타깃 찾기 (Thumb-2 BL: F000-F7FF 패턴)
def enc_bl_decode(a):
    h1, h2 = struct.unpack('<HH', d[a:a+4])
    if (h1 & 0xF800) == 0xF000 and (h2 & 0xD000) == 0xD000:
        S = (h1 >> 10) & 1
        imm10 = h1 & 0x3FF
        J1 = (h2 >> 13) & 1
        J2 = (h2 >> 11) & 1
        imm11 = h2 & 0x7FF
        I1 = J1 ^ (1 - S)
        I2 = J2 ^ (1 - S)
        imm32 = (S << 24) | (I1 << 23) | (I2 << 22) | (imm10 << 12) | (imm11 << 1)
        if S: imm32 -= (1 << 25)
        pc = a + 4
        return pc + imm32
    return None

targets = {}
for a in range(0x2ac8, 0x70f6c-4, 2):
    t = enc_bl_decode(a)
    if t is not None and t in (0x2da30, 0x2e0d0, 0x2e090, 0x2e0c8, 0x2dfd4, 0x2dc02):
        targets.setdefault(t, []).append(a)
for t, hits in targets.items():
    print('bl 0x%05x: %s' % (t, [hex(h) for h in hits]))

# 2. "케이스 핸들러 테이블" 후보: movw/movt로 0x2e090 근처 만드는 코드
print()
print('=== movw/movt 0x2e0xx / 0x2da30 근처 ===')
for a in range(0x2ac8, 0x70f6c-4, 2):
    h1, h2 = struct.unpack('<HH', d[a:a+4])
    if (h1 & 0xFBF0) == 0xF240 or (h1 & 0xFBF0) == 0xF2C0:
        imm4 = (h1 >> 4) & 0xF
        i = (h1 >> 10) & 1
        imm3 = (h2 >> 12) & 0x7
        imm8 = h2 & 0xFF
        imm16 = (imm4 << 12) | (i << 11) | (imm3 << 8) | imm8
        if imm16 in (0x2e090, 0x2e0d0, 0x2da30, 0x2e000, 0x2e0c8):
            print('0x%05x: %s #0x%x' % (a, 'movw' if (h1 & 0xFBF0) == 0xF240 else 'movt', imm16))
