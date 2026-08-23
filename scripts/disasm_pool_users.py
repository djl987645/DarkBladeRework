import struct, subprocess
d=open('docs/libLauncher_original.so','rb').read()

# 0x2e090~0x2e0cc 리터럴 풀 값들
pool = {0x2e090:0x210, 0x2e094:0xffffff, 0x2e098:0x1a0, 0x2e09c:0x1fc,
        0x2e0a0:0x280, 0x2e0a4:0xfff464b0, 0x2e0a8:0x2710, 0x2e0ac:0x1770,
        0x2e0b0:0xfff442b8, 0x2e0b4:0x14ac, 0x2e0b8:0x14ba, 0x2e0bc:0x14aa,
        0x2e0c0:0x1388, 0x2e0c4:0x7d1, 0x2e0c8:0xfff45f48, 0x2e0cc:0x1b58}

# ldr rN,[pc,#off] 역산: opcode H, off=(H&0xff)<<2, addr=((pc+4)&~3)+off
# 참조 맵 (find_ldr_2e090.py 결과)
refs = {
 0x2e090: [0x2dd08, 0x2dd8a, 0x2defa, 0x2e048, 0x2e078],
 0x2e0c8: [0x2e07a],
 0x2e0cc: [0x2e088],
 0x2e0b0: [0x2dfc8],
}

def disasm(addr, n):
    # capstone Thumb 디스어셈블
    from capstone import Cs, CS_ARCH_ARM, CS_MODE_THUMB
    md = Cs(CS_ARCH_ARM, CS_MODE_THUMB)
    md.detail = True
    code = d[addr:addr+n]
    out=[]
    for i in md.disasm(code, addr):
        out.append('0x%05x: %-12s %s' % (i.address, i.mnemonic, i.op_str))
    return out

print('=== 0x2dd08 주변 ===')
print('\n'.join(disasm(0x2dcf0, 0x30)))
print()
print('=== 0x2dd8a 주변 ===')
print('\n'.join(disasm(0x2dd70, 0x30)))
print()
print('=== 0x2defa 주변 ===')
print('\n'.join(disasm(0x2dee0, 0x30)))
print()
print('=== 0x2e048 주변 ===')
print('\n'.join(disasm(0x2e030, 0x30)))
print()
print('=== 0x2e078 주변 ===')
print('\n'.join(disasm(0x2e060, 0x30)))
print()
print('=== 0x2e088 주변 ===')
print('\n'.join(disasm(0x2e070, 0x28)))
print()
print('=== 0x2dfc8 주변 ===')
print('\n'.join(disasm(0x2dfb0, 0x30)))
