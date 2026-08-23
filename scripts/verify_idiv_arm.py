#!/usr/bin/env python3
"""Cycle I: __aeabi_idiv 대체 ARM 루틴 인코딩 검증 (0x76c00) + 진입 로그(0x74b72)"""
from capstone import *

# --- ARM 나눗셈 루틴 @0x76c00 ---
WORDS = [
    0xE92D0030,  # 0x00 push {r4, r5}
    0xE0202001,  # 0x04 eor r2, r0, r1  (부호)
    0xE3510000,  # 0x08 cmp r1, #0
    0x0A000015,  # 0x0C beq .zero (0x74bda)
    0xE3500000,  # 0x10 cmp r0, #0
    0xB2600000,  # 0x14 rsblt r0, r0, #0
    0xE3510000,  # 0x18 cmp r1, #0
    0xB2611000,  # 0x1C rsblt r1, r1, #0
    0xE3A03000,  # 0x20 mov r3, #0  (quotient)
    0xE3A04000,  # 0x24 mov r4, #0  (remainder)
    0xE3A05020,  # 0x28 mov r5, #32 (counter)
    0xE1A00080,  # 0x2C lsl r0, r0, #1  (.loop: C = dividend bit31)
    0xE0A44004,  # 0x30 adc r4, r4, r4  (remainder = (r4<<1)+C)
    0xE1540001,  # 0x34 cmp r4, r1
    0x20444001,  # 0x38 subhs r4, r4, r1
    0xE1A03083,  # 0x3C lsl r3, r3, #1  (shift 먼저!)
    0x23833001,  # 0x40 orrhs r3, r3, #1 (그다음 OR)
    0xE2555001,  # 0x44 subs r5, r5, #1
    0x1AFFFFF7,  # 0x48 bne .loop (0x74b9e)
    0xE1A00003,  # 0x4C mov r0, r3  (quotient 반환)
    0xE3520000,  # 0x50 cmp r2, #0
    0x4A000001,  # 0x54 bmi .neg (0x74bd2)
    0xE8BD0030,  # 0x58 pop {r4, r5}
    0xE12FFF1E,  # 0x5C bx lr
    0xE2600000,  # 0x60 rsb r0, r0, #0  (.neg)
    0xEAFFFFFB,  # 0x64 b .popret (0x74bca)
    0xE3A00000,  # 0x68 mov r0, #0  (.zero — divisor==0)
    0xEAFFFFF9,  # 0x6C b .popret (0x74bca)
]
BASE = 0x74b72
data = b''.join(w.to_bytes(4, 'little') for w in WORDS)

md = Cs(CS_ARCH_ARM, CS_MODE_ARM)
md.detail = True
print(f'=== ARM 루틴 @0x{BASE:05x} ({len(data)}B) ===')
ok = True
for ins in md.disasm(data, BASE):
    print(f'  0x{ins.address:05x}: {ins.bytes.hex():10} {ins.mnemonic:8} {ins.op_str}')
    # 분기 타깃 검증
    if ins.mnemonic.startswith('b') and not ins.mnemonic.startswith('bl'):
        if ins.mnemonic == 'bx':
            continue
        t = int(ins.op_str.replace('#', ''), 16)
        exp = {0x74b7e: 0x74bda, 0x74bba: 0x74b9e, 0x74bc6: 0x74bd2, 0x74bd6: 0x74bca, 0x74bde: 0x74bca}.get(ins.address)
        if exp is not None and t != exp:
            print(f'    ❌ 분기 타깃 오류: 기대 0x{exp:x}, 실제 0x{t:x}')
            ok = False

# --- 진입 로그 시퀀스 @0x74b72 ---
LOG_WORDS = [
    0xE92D500F,  # 0x00 push {r0-r3, r12, lr}
    0xE3A00004,  # 0x04 mov r0, #4
    0xE59F1020,  # 0x08 ldr r1, [pc, #0x20]  (lit1 @0x76730)
    0xE59F2020,  # 0x0c ldr r2, [pc, #0x20]  (lit2 @0x76734)
    0xE59F3020,  # 0x10 ldr r3, [pc, #0x20]  (lit3 @0x76738)
    0xE08F1001,  # 0x14 add r1, pc, r1
    0xE08F2002,  # 0x18 add r2, pc, r2
    0xE08F3003,  # 0x1c add r3, pc, r3
    0xE5933000,  # 0x20 ldr r3, [r3]
    0xE12FFF33,  # 0x24 blx r3
    0xE8BD500F,  # 0x28 pop {r0-r3, r12, lr}
    0xEA000133,  # 0x2c b 0x76c00
]
LOG_BASE = 0x74b72
log_data = b''.join(w.to_bytes(4, 'little') for w in LOG_WORDS)
print(f'\n=== 진입 로그 @0x{LOG_BASE:05x} ===')
for ins in md.disasm(log_data, LOG_BASE):
    print(f'  0x{ins.address:05x}: {ins.bytes.hex():10} {ins.mnemonic:8} {ins.op_str}')
    if ins.mnemonic == 'b' and ins.address == 0x7672c:
        t = int(ins.op_str.replace('#', ''), 16)
        if t != 0x76c00:
            print(f'    ❌ b 타깃 오류: 기대 0x76c00, 실제 0x{t:x}')
            ok = False

# --- 0x2a88 패치 검증 ---
print('\n=== 0x2a88 패치 (b 0x74b72) ===')
for ins in md.disasm(b'\x38\xc8\x01\xea', 0x2a88):
    print(f'  0x{ins.address:05x}: {ins.bytes.hex():10} {ins.mnemonic} {ins.op_str}')
    if ins.mnemonic == 'b' and int(ins.op_str.replace('#', ''), 16) != 0x74b72:
        ok = False
        print('    ❌ 0x2a88 b 타깃 오류')

# --- 리터럴 계산 검증 (add별 pc+8 기준) ---
for name, v, addpc in [('tag', 0x74858, 0x7671c), ('fmt', 0x76740, 0x76720), ('got', 0x1bb998, 0x76724)]:
    lit = (v - addpc) & 0xFFFFFFFF
    calc = (addpc + lit) & 0xFFFFFFFF
    st = '✅' if calc == v else '❌'
    print(f'  {st} {name} lit=0x{lit:08x} → add 결과 0x{calc:08x} (기대 0x{v:08x}, add pc=0x{addpc:08x})')

# --- 시뮬레이션 ---
def sim_idiv(dividend, divisor):
    r0, r1 = dividend, divisor
    r2 = (r0 ^ r1) & 0xFFFFFFFF
    if r1 == 0:
        return 0
    if r0 & 0x80000000:
        r0 = (-r0) & 0xFFFFFFFF
    if r1 & 0x80000000:
        r1 = (-r1) & 0xFFFFFFFF
    r3, r4 = 0, 0
    for _ in range(32):
        carry = (r0 >> 31) & 1
        r0 = (r0 << 1) & 0xFFFFFFFF
        r4 = ((r4 << 1) | carry) & 0xFFFFFFFF
        if r4 >= r1:
            r4 -= r1
            r3 = ((r3 << 1) | 1) & 0xFFFFFFFF
        else:
            r3 = (r3 << 1) & 0xFFFFFFFF
    if r2 & 0x80000000:
        r3 = (-r3) & 0xFFFFFFFF
    return r3

def c_trunc_div(d, v):
    if v == 0:
        return 0
    q = abs(d) // abs(v)
    if (d < 0) != (v < 0):
        q = -q
    return q & 0xFFFFFFFF

tests = [(7, 2), (100, 7), (-7, 2), (7, -2), (-7, -2), (0x80000000, 2), (1, 1), (12345, 3), (0, 5), (-12345, 7), (0x7fffffff, 3), (0x80000000, 0xffffffff)]
allok = True
print('\n=== 시뮬레이션 (C truncation 대조) ===')
for d, v in tests:
    sim = sim_idiv(d, v)
    ref = c_trunc_div(d, v)
    # -2^31/-1 = 오버플로우: ARM wrap 0x80000000, C UB — sim 기준 수용
    if d == 0x80000000 and v == 0xFFFFFFFF:
        ref = 0x80000000
    isok = sim == ref
    allok &= isok
    print(f'  {"✅" if isok else "❌"} {d-0x100000000 if d&0x80000000 else d}/{v-0x100000000 if v&0x80000000 else v} = sim:0x{sim:08x} ref:0x{ref:08x}')
print(f'\n전체: {"✅ 전부 일치" if allok else "❌ 불일치 있음"} (분기: {"✅" if ok else "❌"})')
