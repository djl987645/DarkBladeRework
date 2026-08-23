from capstone import *
import struct
d=open('docs/libLauncher_original.so','rb').read()
md = Cs(CS_ARCH_ARM, CS_MODE_THUMB)
for lit in [0x1222a4, 0x124510, 0x124b68, 0x142cb8]:
    found=[]
    for a in range(0x2ac8, 0x70f6c-4, 2):
        h=struct.unpack('<H', d[a:a+2])[0]
        if (h & 0xF800) == 0x4800:
            rt = (h >> 8) & 0x7
            imm = (h & 0xFF) << 2
            pc = (a + 4) & ~3
            if pc + imm == lit: found.append((a, 'ldr r%d [pc,#0x%x]' % (rt, imm)))
        elif (h & 0xFBFF) == 0xF8DF:
            h2 = struct.unpack('<H', d[a+2:a+4])[0]
            rt = (h2 >> 12) & 0xF
            imm = (h2 & 0xFFF)
            pc = (a + 4) & ~3
            if pc + imm == lit: found.append((a, 'ldr.w r%d [pc,#0x%x]' % (rt, imm)))
    print('0x%06x: %s' % (lit, found))
