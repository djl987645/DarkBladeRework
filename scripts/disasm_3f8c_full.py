from capstone import *
import struct
d=open('docs/libLauncher_original.so','rb').read()
md = Cs(CS_ARCH_ARM, CS_MODE_THUMB)
md.detail = True
print('=== 0x3f8c 함수 전체 (0x3f8c~0x4060) ===')
for ins in md.disasm(d[0x3f8c:0x4060], 0x3f8c):
    print('0x%05x: %-12s %s %s' % (ins.address, ins.bytes.hex(), ins.mnemonic, ins.op_str))
