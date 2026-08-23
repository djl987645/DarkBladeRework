import struct
from capstone import Cs, CS_ARCH_ARM, CS_MODE_THUMB
d=open('docs/libLauncher_original.so','rb').read()
md=Cs(CS_ARCH_ARM, CS_MODE_THUMB); md.detail=True

print('=== 0x2e0d0 ~ 0x2e160 ($t 코드) ===')
out=[]
for i in md.disasm(d[0x2e0d0:0x2e160], 0x2e0d0):
    note=''
    if i.mnemonic=='ldr' and 'pc' in i.op_str and '[' in i.op_str:
        import re
        m=re.search(r'\[pc, #(0x[0-9a-f]+)\]', i.op_str)
        if m:
            imm=int(m.group(1),16)
            tgt=((i.address+4)&~3)+imm
            note='  <- [0x%05x]' % tgt
    out.append('0x%05x: %-14s %-16s%s' % (i.address, i.mnemonic, i.op_str, note))
print('\n'.join(out))
print()
print('=== 0x2f360 ~ 0x2f3c0 (케이스 1218 = 0x2f398 주변) ===')
out=[]
for i in md.disasm(d[0x2f360:0x2f3c0], 0x2f360):
    out.append('0x%05x: %-14s %-16s' % (i.address, i.mnemonic, i.op_str))
print('\n'.join(out))
print()
print('=== 0x2e0c8 리터럴 값: 0xfff45f48 = -0xBA0B8 ===')
print('0x2e078: ldr r1,[pc] -> [0x2e0c8] -> r1 = this + 0xfff45f48')
print()
print('=== 리터럴 풀 0x2e090~0x2e0d0 16개 전수 (재확인) ===')
for a in range(0x2e090, 0x2e0d0, 4):
    v = struct.unpack('<I', d[a:a+4])[0]
    sv = v if v < 0x80000000 else v - 0x100000000
    print('0x%05x: 0x%08x (%+d)' % (a, v, sv))
