import struct
d=open('docs/libLauncher_original.so','rb').read()
base = 0x152008  # this-0xBBD48 (this=0x20DD50)
print('=== 0x152008 테이블 검증 ===')
for i in [13,14,15,16,17,18,1216,1217,1218,1219,1220]:
    off = base + i*4
    v = struct.unpack('<i', d[off:off+4])[0]
    h = (base + v) & 0xFFFFFFFF
    print('idx %d: [0x%05x] = %+09d (0x%08x) -> 0x%05x' % (i, off, v, v & 0xFFFFFFFF, h))
print()
print('기대값: idx14 -> 0x2e0c8, idx1218 -> 0x2f398')
print('0x2e0c8 - 0x152008 = %+d (0x%08x)' % (0x2e0c8-base, (0x2e0c8-base)&0xFFFFFFFF))
print('0x2f398 - 0x152008 = %+d (0x%08x)' % (0x2f398-base, (0x2f398-base)&0xFFFFFFFF))
print()
print('=== 0x152008 주변 128B 덤프 (컨텍스트 확인) ===')
for a in range(base-64, base+192, 16):
    b = d[a:a+16]
    words = ' '.join('%08x' % struct.unpack('<I', b[i:i+4])[0] for i in range(0, 16, 4))
    print('0x%05x: %s' % (a, words))
