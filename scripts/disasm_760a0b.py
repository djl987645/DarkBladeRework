from capstone import *
from capstone.arm import *
import struct

d = open('docs/libLauncher_original.so','rb').read()
md = Cs(CS_ARCH_ARM, CS_MODE_THUMB)
md.detail = True

# 0x760a0부터 디스어셈블 (skipdata로 데이터 구간 점프)
print("=== 0x760a0~0x76120 (skipdata) ===")
md.skipdata = True
md.skipdata_setup = ('db', None, None)
for ins in md.disasm(d[0x760a0:0x76120], 0x760a0):
    print(f"  0x{ins.address:05x}: {ins.bytes.hex():10} {ins.mnemonic} {ins.op_str}")
