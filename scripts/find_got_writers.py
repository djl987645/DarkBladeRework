#!/usr/bin/env python3
"""[0x1BBA8C] (__aeabi_idiv GOT)에 쓰는 코드 찾기 — 게임의 함수 포인터 오염원 추적"""
from capstone import *

data = open('/root/darkblade-mod/docs/libLauncher_original.so', 'rb').read()
md = Cs(CS_ARCH_ARM, CS_MODE_THUMB)
md.skipdata = True
md.detail = True

hits = []
for ins in md.disasm(data[0x2ac8:0x1ba608], 0x2ac8):
    if ins.mnemonic == 'str' and '#0x184' in ins.op_str:
        hits.append(('str+0x184', ins.address, ins.op_str))
    elif ins.mnemonic.startswith('ldr') and ins.op_str.startswith('[pc'):
        try:
            off = int(ins.op_str.split('#')[1].rstrip(']'), 16)
            pc = ins.address + 4
            lit_addr = (pc + off) & 0xFFFFFFFC
            if 0x2ac8 <= lit_addr < 0x1ba608:
                val = int.from_bytes(data[lit_addr:lit_addr + 4], 'little')
                if val == 0x184 or val == 0x1bba8c or (0x1bb900 <= val <= 0x1bbb00):
                    hits.append(('lit-0x%x' % val, ins.address, ins.op_str))
        except Exception:
            pass

print('히트 %d건:' % len(hits))
for h in hits[:30]:
    print('  0x%05x: %s  %s' % (h[1], h[0], h[2]))
