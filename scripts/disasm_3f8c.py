from capstone import *
import struct
d=open('docs/libLauncher_original.so','rb').read()
md = Cs(CS_ARCH_ARM, CS_MODE_THUMB)
print('=== 0x3f8c (pltStart가 호출) ===')
for ins in md.disasm(d[0x3f80:0x3fe0], 0x3f80):
    print('0x%05x: %-12s %s %s' % (ins.address, ins.bytes.hex(), ins.mnemonic, ins.op_str))
