#!/usr/bin/env python3
"""blx 0x2a80 호출부 전수 조사 + 주변 코드 분석 (왜 초기화가 멈추는지)"""
from capstone import *

data = open('/root/darkblade-mod/docs/libLauncher_original.so', 'rb').read()
md = Cs(CS_ARCH_ARM, CS_MODE_THUMB)
md.skipdata = True
md.detail = True

calls = []
for ins in md.disasm(data[0x2ac8:0x1ba608], 0x2ac8):
    if ins.mnemonic == 'blx' and '0x2a80' in ins.op_str:
        calls.append(ins.address)
    elif ins.mnemonic == 'bl' and '0x2a80' in ins.op_str:
        calls.append(ins.address)

print('0x2a80 호출부 %d건:' % len(calls))
for a in calls:
    print('  0x%05x' % a)

# 각 호출부 주변 20바이트 디스어셈블 (호출 방식/문맥)
print('\n=== 호출부 주변 ===')
for a in calls[:15]:
    print(f'\n--- 0x{a:05x} 주변 ---')
    start = a - 0x10
    for ins in md.disasm(data[start:a + 0x10], start):
        mark = ' >>>' if ins.address == a else ''
        print(f'  0x{ins.address:05x}: {ins.bytes.hex():10} {ins.mnemonic:8} {ins.op_str}{mark}')
