#!/usr/bin/env python3
# 리터럴 풀 0x2e090~0x2e0cc 각 슬롯을 읽는 코드 위치 전수 스캔 (Thumb ldr literal)
# 목적: 0x2e0c8을 b.w 트램펄린으로 덮을 때, 같은 값을 읽는 다른 코드가 깨지는지 확인
import struct, sys
sys.path.insert(0, '/root/darkblade-mod/scripts')
from capstone import *

SRC = '/root/darkblade-mod/docs/libLauncher_original.so'
data = open(SRC, 'rb').read()

# 리터럴 슬롯 정의
slots = {}
for i, addr in enumerate(range(0x2e090, 0x2e0d0, 4)):
    val = struct.unpack_from('<I', data, addr)[0]
    slots[addr] = val
    print(f'리터럴 0x{addr:06x}: 0x{val:08x} ({val if val < 0x7fffffff else val - 0x100000000})')

# ldr literal 읽는 위치 찾기: Thumb 2B ldr rX,[pc,#imm8*4]
# 인코딩: 01001 Rt imm8 (0x4800 | Rt<<8 | imm8)
md = Cs(CS_ARCH_ARM, CS_MODE_THUMB)
md.detail = True

# 0x2d000~0x2f400 범위에서 모든 ldr literal 찾기
readers = {a: [] for a in slots}
for insn in md.disasm(data[0x2d000:0x2f500], 0x2d000):
    if insn.mnemonic == 'ldr' and '.w' not in insn.mnemonic:
        # op_str이 '[pc, #imm]' 형태인지
        ops = insn.op_str
        if '[pc' in ops:
            # 대상 주소 계산
            try:
                import re
                m = re.search(r'\[pc, #0x([0-9a-f]+)\]', ops)
                if m:
                    imm = int(m.group(1), 16)
                    target = (insn.address + 4) & ~3
                    target += imm
                    if target in slots:
                        readers[target].append((hex(insn.address), insn.op_str))
            except Exception:
                pass

for a, r in readers.items():
    if r:
        print(f'0x{a:06x} (0x{slots[a]:08x}) 읽는 곳: {r}')
    else:
        print(f'0x{a:06x} (0x{slots[a]:08x}) 읽는 곳: 없음')
