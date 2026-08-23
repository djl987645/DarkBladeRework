from capstone import *
import struct
d=open('docs/libLauncher_original.so','rb').read()
md = Cs(CS_ARCH_ARM, CS_MODE_THUMB)
md.detail = True
print('=== 0x2f340~0x2f3d0 (bl 0x2da30 호출부) ===')
for ins in md.disasm(d[0x2f340:0x2f3d0], 0x2f340):
    print('0x%05x: %-12s %s %s' % (ins.address, ins.bytes.hex(), ins.mnemonic, ins.op_str))
