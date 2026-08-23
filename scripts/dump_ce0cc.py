import struct
from capstone import Cs, CS_ARCH_ARM, CS_MODE_THUMB
d=open('docs/libLauncher_original.so','rb').read()
md=Cs(CS_ARCH_ARM, CS_MODE_THUMB); md.detail=True

A = 0xCE0CC  # 테이블베이스 (this - 0xBBD48)
this = A + 0xBBD48  # 0x189C14
print('테이블베이스 A = 0x%05x, this = 0x%05x' % (A, this))
print()
print('=== 테이블 엔트리 0~63 ===')
for i in range(64):
    v = struct.unpack('<i', d[A+i*4:A+i*4+4])[0]
    tt = (A + v) & 0xffffffff
    tag = ''
    if tt == 0x2e0c8: tag = ' ★★★ 리터럴 풀!'
    elif 0x2ac8 <= tt <= 0x70f6c: tag = ' (.text)'
    elif 0x70f6c <= tt <= 0x1b55bc: tag = ' (.rodata)'
    print('  [%2d] %+d (0x%08x) → 0x%05x%s' % (i, v, v&0xffffffff, tt, tag))
print()
print('=== this(0x189C14) 주변 덤프 32B ===')
for i in range(8):
    v = struct.unpack('<I', d[this+i*4:this+i*4+4])[0]
    print('  0x%05x: 0x%08x' % (this+i*4, v))
print()
print('=== A(0xCE0CC) 주변 덤프 32B ===')
for i in range(8):
    v = struct.unpack('<I', d[A+i*4:A+i*4+4])[0]
    print('  0x%05x: 0x%08x' % (A+i*4, v))
