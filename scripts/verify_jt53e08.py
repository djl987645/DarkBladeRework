import struct
d=open('docs/libLauncher_original.so','rb').read()
base = 0x53E08  # this=0x10F950 가설 → 테이블베이스
print('=== 0x53E08 테이블: 테이블[i]+base -> 핸들러 (소오프셋) ===')
idxs = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,30,100,200,500,1000,1200,1210,1218,1220]
for i in idxs:
    off = base + i*4
    v = struct.unpack('<i', d[off:off+4])[0]
    h = (base + v) & 0xFFFFFFFF
    print('case %d: [0x%05x] = %+08x -> handler 0x%05x' % (i, off, v, h))
print()
print('0x2f398 - 0x53E08 = %+x' % (0x2f398-base))
print('0x2e0c8 - 0x53E08 = %+x' % (0x2e0c8-base))
print('0x2e0d0 - 0x53E08 = %+x  <- correct fn start' % (0x2e0d0-base))
