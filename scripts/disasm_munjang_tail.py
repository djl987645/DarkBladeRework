import struct
from capstone import *
from capstone.arm import *

d = open('docs/libLauncher_original.so','rb').read()
start = 0x2dc90
end   = 0x2e0d0
md = Cs(CS_ARCH_ARM, CS_MODE_THUMB)
md.detail = True

code = d[start:end]
for ins in md.disasm(code, start):
    print(f"{hex(ins.address)}: {ins.mnemonic} {ins.op_str}")
