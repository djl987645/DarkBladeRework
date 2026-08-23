import struct
from capstone import Cs, CS_ARCH_ARM, CS_MODE_THUMB
d=open('docs/libLauncher_original.so','rb').read()
md=Cs(CS_ARCH_ARM, CS_MODE_THUMB); md.detail=True

print('=== 0x55880 ~ 0x558e0 덤프 (this-0xBA0B8 = 0x55898) ===')
for a in range(0x55880, 0x558e0, 16):
    b = d[a:a+16]
    words = ' '.join('%08x' % struct.unpack('<I', b[i:i+4])[0] for i in range(0, 16, 4))
    print('0x%05x: %s' % (a, words))
print()
print('=== 0x51560 디스어셈블 (실질 함수) ===')
out=[]
for i in md.disasm(d[0x51560:0x516e4], 0x51560):
    out.append('0x%05x: %-12s %s' % (i.address, i.mnemonic, i.op_str))
print('\n'.join(out))
print()
print('=== 0x516d4 래퍼 재확인 ===')
out=[]
for i in md.disasm(d[0x516d4:0x51720], 0x516d4):
    out.append('0x%05x: %-12s %s' % (i.address, i.mnemonic, i.op_str))
print('\n'.join(out))
