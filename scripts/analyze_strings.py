#!/usr/bin/env python3
"""
전체 구조 분석 Phase 2: 문자열 추출 + XREF (참조 코드 → 함수 매핑)
- .rodata(0x70f6c~0x1c55bc)에서 ASCII/UTF-8 문자열 추출
- ldr literal / adr 패턴으로 참조 코드 탐색 (raw 스캔)
- 문자열 → 함수 매핑 저장 (/tmp/strings_xref.txt)
"""
import struct

SRC = '/root/darkblade-mod/docs/libLauncher_original.so'
data = open(SRC, 'rb').read()

TEXT_S, TEXT_E = 0x2ac8, 0x70f6c
RO_S, RO_E = 0x70f6c, 0x1c55bc

# --- 1. 문자열 추출 (.rodata) ---
def printable(b):
    return (0x20 <= b <= 0x7E) or (b >= 0x80)  # ASCII + UTF-8 멀티바이트

strings = []  # (addr, text)
i = RO_S
while i < RO_E:
    if printable(data[i]) and data[i] != 0:
        j = i
        while j < RO_E and printable(data[j]) and data[j] != 0:
            j += 1
        raw = data[i:j]
        try:
            s = raw.decode('utf-8', errors='replace')
        except:
            s = raw.hex()
        # 의미 있는 문자열만 (길이 >= 3, 공백/특수문자 다수 제외)
        if len(raw) >= 3:
            strings.append((i, s))
        i = j
    else:
        i += 1
print(f'문자열 후보: {len(strings)}')

# --- 2. ldr/adr 리터럴 참조 스캔 (.text) ---
# 16비트 ldr Rd,[pc,#imm]: 0x4800|(Rd<<8)|imm8 → addr = ((pc+4)&~3) + imm8*4
# 16비트 adr Rd,label:     0xA000|(Rd<<8)|imm8 → addr = ((pc+4)&~3) + imm8*4
# 32비트 ldr.w Rt,[pc,#imm]: hw1=0xF8DF, hw2=(Rt<<12)|imm12 → addr = ((pc+4)&~3) + imm12
lit_refs = []  # (pc, target)
a = TEXT_S
while a < TEXT_E - 1:
    hw = struct.unpack_from('<H', data, a)[0]
    if 0x4800 <= hw <= 0x4FFF:
        rd = (hw >> 8) & 0x7
        imm8 = hw & 0xFF
        t = ((a + 4) & ~3) + imm8 * 4
        lit_refs.append((a, t))
        a += 2
    elif 0xA000 <= hw <= 0xAFFF:
        rd = (hw >> 8) & 0x7
        imm8 = hw & 0xFF
        t = ((a + 4) & ~3) + imm8 * 4
        lit_refs.append((a, t))
        a += 2
    elif hw == 0xF8DF and a + 4 <= TEXT_E:
        hw2 = struct.unpack_from('<H', data, a + 2)[0]
        imm12 = hw2 & 0xFFF
        t = ((a + 4) & ~3) + imm12
        lit_refs.append((a, t))
        a += 4
    elif (hw & 0xF800) == 0xF000:
        # 32비트 명령 (BL 등) — 건너뜀 (오탐 방지)
        a += 4
    else:
        a += 2
print(f'리터럴 참조: {len(lit_refs)}')

# --- 3. 문자열 주소 → 참조 코드 매핑 ---
str_map = {}
for pc, t in lit_refs:
    if RO_S <= t < RO_E:
        str_map.setdefault(t, []).append(pc)

# 문자열 → 참조 함수 매핑 (functions_full.txt 로드)
import re
funcs = []
with open('/tmp/functions_full.txt') as f:
    for line in f:
        m = re.match(r'0x([0-9a-f]+) 0x([0-9a-f]+)', line)
        if m:
            funcs.append((int(m.group(1), 16), int(m.group(2), 16)))

def find_func(addr):
    for s, e in funcs:
        if s <= addr < e:
            return s, e
    return None, None

# 문자열별 참조 함수 요약
out = []
for addr, text in strings:
    refs = str_map.get(addr, [])
    funcs_ref = set()
    for pc in refs:
        fs, fe = find_func(pc)
        if fs:
            funcs_ref.add(fs)
    if refs:
        out.append((addr, text, len(refs), sorted(funcs_ref)))

print(f'참조되는 문자열: {len(out)}개')
with open('/tmp/strings_xref.txt', 'w') as f:
    f.write(f'# 문자열 XREF (참조 {len(out)}개, 전체 문자열 {len(strings)}개)\n')
    f.write('# addr    refs  text\n')
    for addr, text, nref, funcs_ref in out:
        fref = ','.join(f'0x{x:05x}' for x in funcs_ref[:8])
        f.write(f'0x{addr:05x} {nref:3d} {fref:40s} {text[:80]}\n')
print('저장: /tmp/strings_xref.txt')

# 상위 참조 문자열 TOP 40
out.sort(key=lambda x: -x[2])
print('\n=== TOP 40 참조 문자열 ===')
for addr, text, nref, funcs_ref in out[:40]:
    print(f'0x{addr:05x} [{nref}] {text[:70]}')

# --- 4. .data.rel.ro / .data 포인터 분석 (vtable 등) ---
print('\n=== .data.rel.ro (0x1bb614~0x1bb820) ===')
for addr in range(0x1bb614, 0x1bb820, 4):
    v = struct.unpack_from('<I', data, addr)[0]
    if TEXT_S <= v < TEXT_E:
        fs, fe = find_func(v)
        print(f'0x{addr:05x}: 0x{v:05x} [코드 함수 {fs and f"0x{fs:05x}"}]')
print('\n=== .data (0x1bbb90~0x1bc824) 코드 포인터 ===')
n = 0
for addr in range(0x1bbb90, 0x1bc824, 4):
    v = struct.unpack_from('<I', data, addr)[0]
    if TEXT_S <= v < TEXT_E:
        fs, fe = find_func(v)
        print(f'0x{addr:05x}: 0x{v:05x} [함수 0x{fs:05x}]')
        n += 1
print(f'.data 코드 포인터: {n}개')
