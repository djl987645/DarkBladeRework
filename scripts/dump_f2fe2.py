import struct
d=open('docs/libLauncher_original.so','rb').read()
a=0xf2fe2
print('=== 0xf2fe2 주변 256B 덤프 (halfword 단위) ===')
for off in range(a-128, a+128, 16):
    b = d[off:off+16]
    hws = ' '.join('%04x' % struct.unpack('<H', b[i:i+2])[0] for i in range(0, 16, 2))
    wds = ' '.join('%08x' % struct.unpack('<I', b[i:i+4])[0] for i in range(0, 16, 4))
    print('0x%05x: %s' % (off, hws))
print()
print('=== 4B 단위 ===')
for off in range(a-128, a+128, 16):
    b = d[off:off+16]
    wds = ' '.join('%08x' % struct.unpack('<I', b[i:i+4])[0] for i in range(0, 16, 4))
    print('0x%05x: %s' % (off, wds))
