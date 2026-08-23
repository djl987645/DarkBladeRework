from capstone import *
from capstone.arm import *
import struct

d = open('docs/libLauncher_original.so','rb').read()
md = Cs(CS_ARCH_ARM, CS_MODE_THUMB)
md.detail = True

# 0x760a0 영역 정밀 디스어셈블
print("=== 0x76080~0x760f0 (원본) ===")
for ins in md.disasm(d[0x76080:0x760f0], 0x76080):
    print(f"  0x{ins.address:05x}: {ins.bytes.hex():10} {ins.mnemonic} {ins.op_str}")
