from capstone import *
import struct
d=open('docs/libLauncher_original.so','rb').read()
md = Cs(CS_ARCH_ARM, CS_MODE_THUMB)
print('=== JNI_OnLoad (0x2b00) ===')
for ins in md.disasm(d[0x2b00:0x2b30], 0x2b00):
    print('0x%05x: %-12s %s %s' % (ins.address, ins.bytes.hex(), ins.mnemonic, ins.op_str))
print('=== pltStart (0x2ac8) ===')
for ins in md.disasm(d[0x2ac8:0x2ae0], 0x2ac8):
    print('0x%05x: %-12s %s %s' % (ins.address, ins.bytes.hex(), ins.mnemonic, ins.op_str))
