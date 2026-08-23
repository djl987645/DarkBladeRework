import struct
from capstone import Cs, CS_ARCH_ARM, CS_MODE_THUMB
d=open('docs/libLauncher_original.so','rb').read()
md=Cs(CS_ARCH_ARM, CS_MODE_THUMB); md.detail=True

def dis(addr, n):
    out=[]
    for i in md.disasm(d[addr:addr+n], addr):
        out.append('0x%05x: %-12s %s' % (i.address, i.mnemonic, i.op_str))
    return out

print('=== 0x516d4 함수 (0x51680~0x51780) ===')
print('\n'.join(dis(0x51680, 0x100)))
print()
# 0x516d4 주변 리터럴 풀 찾기: ldr rN,[pc,#off] 패턴
print('=== 0x51680~0x51780 ldr [pc] 참조 ===')
for a in range(0x51680, 0x51780, 2):
    h = struct.unpack('<H', d[a:a+2])[0]
    if (h & 0xF800) == 0x4800:  # ldr rN,[pc,#imm8]
        rn = (h >> 8) & 0x7
        off = (h & 0xFF) * 4
        tgt = ((a + 4) & ~3) + off
        print('0x%05x: ldr r%d,[pc,#0x%x] -> [0x%05x] = 0x%08x' % (a, rn, off, tgt, struct.unpack('<I', d[tgt:tgt+4])[0] if tgt < len(d) else 0))
