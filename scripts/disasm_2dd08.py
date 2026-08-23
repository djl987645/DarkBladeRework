import struct
from capstone import Cs, CS_ARCH_ARM, CS_MODE_THUMB
d=open('docs/libLauncher_original.so','rb').read()
md=Cs(CS_ARCH_ARM, CS_MODE_THUMB); md.detail=True

print('=== 0x2dcc0 ~ 0x2de00 (리터럴 풀 사용처 주변) ===')
out=[]
for i in md.disasm(d[0x2dcc0:0x2de00], 0x2dcc0):
    # ldr [pc] 타깃 계산
    note=''
    if i.mnemonic=='ldr' and 'pc' in i.op_str and '[' in i.op_str:
        # ldr rX, [pc, #imm]
        import re
        m=re.search(r'\[pc, #(0x[0-9a-f]+)\]', i.op_str)
        if m:
            imm=int(m.group(1),16)
            tgt=((i.address+4)&~3)+imm
            note='  <- [0x%05x]' % tgt
    out.append('0x%05x: %-14s %-16s%s' % (i.address, i.mnemonic, i.op_str, note))
print('\n'.join(out))
print()
print('=== 0x2de00 ~ 0x2dfd0 ===')
out=[]
for i in md.disasm(d[0x2de00:0x2dfd0], 0x2de00):
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
