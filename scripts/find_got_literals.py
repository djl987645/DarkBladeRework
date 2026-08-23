#!/usr/bin/env python3
"""GOT 주소(0x1bb908/0x1bba8c/0x1bb998 등)를 리터럴로 쓰는 코드 + 0x74bb9 류 주소 소스 찾기"""
from capstone import *

data = open('/root/darkblade-mod/docs/libLauncher_original.so', 'rb').read()
md = Cs(CS_ARCH_ARM, CS_MODE_THUMB)
md.skipdata = True
md.detail = True

TARGETS = {0x1bb908, 0x1bba8c, 0x1bb998, 0x1bb934, 0x1bb668}
hits = []
for ins in md.disasm(data[0x2ac8:0x1ba608], 0x2ac8):
    if ins.mnemonic.startswith('ldr') and ins.op_str.startswith('[pc'):
        try:
            off = int(ins.op_str.split('#')[1].rstrip(']'), 16)
            pc = ins.address + 4
            lit_addr = (pc + off) & 0xFFFFFFFC
            if 0x2ac8 <= lit_addr < 0x1ba608:
                val = int.from_bytes(data[lit_addr:lit_addr + 4], 'little')
                if val in TARGETS or (0x1bb900 <= val <= 0x1bbb00):
                    hits.append((ins.address, val, ins.op_str))
        except Exception:
            pass

print('GOT 주소 리터럴 로드 %d건:' % len(hits))
for a, val, ops in hits:
    print('  0x%05x: [0x%x] %s' % (a, val, ops))
