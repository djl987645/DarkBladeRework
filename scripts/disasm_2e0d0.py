from capstone import *
from capstone.arm import *
import struct

d = open('docs/libLauncher_original.so','rb').read()
md = Cs(CS_ARCH_ARM, CS_MODE_THUMB)
md.detail = True

# 0x2e0d0~0x2e140 디스어셈블 (리터럴 풀 경계 확인)
print("=== 0x2e0d0~0x2e140 ===")
for ins in md.disasm(d[0x2e0d0:0x2e140], 0x2e0d0):
    print(f"  0x{ins.address:05x}: {ins.bytes.hex():10} {ins.mnemonic} {ins.op_str}")
