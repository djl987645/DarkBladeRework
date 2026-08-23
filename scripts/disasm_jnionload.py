import struct
from capstone import Cs, CS_ARCH_ARM, CS_MODE_THUMB
d=open('docs/libLauncher_original.so','rb').read()
md=Cs(CS_ARCH_ARM, CS_MODE_THUMB); md.detail=True

print('=== JNI_OnLoad 0x2b00 주변 (0x2ac8~0x2c80) ===')
print('\n'.join('0x%05x: %-12s %s' % (i.address, i.mnemonic, i.op_str) for i in md.disasm(d[0x2ac8:0x2c80], 0x2ac8)))
print()
# 0x2b00 기준 ldr [pc] 참조들
print('=== 0x2ac8~0x2c80 ldr [pc] 참조 ===')
for a in range(0x2ac8, 0x2c80, 2):
    h = struct.unpack('<H', d[a:a+2])[0]
    if (h & 0xF800) == 0x4800:
        rn = (h >> 8) & 0x7
        off = (h & 0xFF) * 4
        tgt = ((a + 4) & ~3) + off
        print('0x%05x: ldr r%d,[pc,#0x%x] -> [0x%05x] = 0x%08x' % (a, rn, off, tgt, struct.unpack('<I', d[tgt:tgt+4])[0]))
