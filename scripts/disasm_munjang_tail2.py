import struct
from capstone import *
from capstone.arm import *

d = open('docs/libLauncher_original.so','rb').read()

# 리터럴 풀 raw 값 (0x2dcb0 ~ 0x2dcd0)
print("=== 리터럴 풀 raw (0x2dcb0~0x2dcd0) ===")
for off in range(0x2dcb0, 0x2dcd0, 4):
    v = struct.unpack('<I', d[off:off+4])[0]
    print(f"{hex(off)}: {hex(v)}")

# 0x2dcd0 이후 코드
print("\n=== 코드 (0x2dcd0~0x2e0d0) ===")
md = Cs(CS_ARCH_ARM, CS_MODE_THUMB)
md.detail = True
for ins in md.disasm(d[0x2dcd0:0x2e0d0], 0x2dcd0):
    print(f"{hex(ins.address)}: {ins.mnemonic} {ins.op_str}")
