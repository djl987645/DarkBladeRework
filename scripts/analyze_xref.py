#!/usr/bin/env python3
"""
전체 구조 분석 Phase 2 (v3): capstone skipdata 전체 디스어셈블 + XREF
- .text 전체를 skipdata 모드로 정밀 디스어셈블 (리터럴 풀은 db로 건너뜀)
- ldr literal/adr/bl/blx/movw/movt 전수 수집 (op_str '#' 처리)
- .rodata 문자열 참조 → 함수 매핑
"""
import struct, re
from collections import defaultdict, Counter
from capstone import *

SRC = '/root/darkblade-mod/docs/libLauncher_original.so'
data = open(SRC, 'rb').read()

TEXT_S, TEXT_E = 0x2ac8, 0x70f6c
RO_S, RO_E = 0x70f6c, 0x1c55bc
DATA_RO_S, DATA_RO_E = 0x1bb614, 0x1bb820
DATA_S, DATA_E = 0x1bbb90, 0x1bc824

# --- 전체 .text skipdata 디스어셈블 ---
md = Cs(CS_ARCH_ARM, CS_MODE_THUMB)
md.skipdata = True
md.skipdata_setup = ('db', None, None)

insns = []
for ins in md.disasm(data[TEXT_S:TEXT_E], TEXT_S):
    insns.append(ins)
print(f'디스어셈블 명령어: {len(insns)}')

def parse_hex(s):
    s = s.strip().lstrip('#').strip()
    if s.startswith('0x'):
        return int(s, 16)
    m = re.match(r'0x([0-9a-f]+)', s)
    return int(m.group(1), 16) if m else None

# --- 명령어 수집 ---
bl_edges = defaultdict(set)     # caller_func -> {target}
lit_refs = []                   # (pc, target)
mov_state = {}                  # pc -> {reg: imm16}  (movw/movt 쌍)
mov_pairs = []                  # (pc, reg, value)

for ins in insns:
    m = ins.mnemonic
    op = ins.op_str
    if m in ('bl', 'blx'):
        t = parse_hex(op.split(',')[0])
        if t is not None:
            bl_edges[ins.address].add(t & ~1)
    elif m == 'ldr' and '[pc' in op:
        mm = re.search(r'\[pc(?:, #(0x[0-9a-f]+))?\]', op)
        if mm:
            imm = int(mm.group(1), 16) if mm.group(1) else 0
            t = ((ins.address + 4) & ~3) + imm
            lit_refs.append((ins.address, t))
    elif m == 'adr':
        mm = re.search(r'0x([0-9a-f]+)', op)
        if mm:
            lit_refs.append((ins.address, int(mm.group(1), 16)))
    elif m == 'movw':
        mm = re.match(r'r(\d+), #(0x[0-9a-f]+)', op)
        if mm:
            mov_state.setdefault(ins.address, {})[int(mm.group(1))] = int(mm.group(2), 16)
    elif m == 'movt':
        mm = re.match(r'r(\d+), #(0x[0-9a-f]+)', op)
        if mm:
            rd = int(mm.group(1))
            lo = int(mm.group(2), 16) << 16
            # 직전 movw 찾기 (같은 함수, 같은 레지스터)
            for prev in sorted(mov_state.keys(), reverse=True):
                if prev < ins.address and rd in mov_state[prev]:
                    val = mov_state[prev][rd] | lo
                    mov_pairs.append((prev, rd, val))
                    break

print(f'BL/BLX: {sum(len(v) for v in bl_edges.values())}건')
print(f'리터럴 참조: {len(lit_refs)}건')
print(f'movw/movt 쌍: {len(mov_pairs)}건')

# --- 함수 매핑 로드 ---
funcs = []
with open('/tmp/functions_full.txt') as f:
    for line in f:
        m2 = re.match(r'0x([0-9a-f]+)\s+0x([0-9a-f]+)\s+(\d+)\s+(\S+)\s+(\d+)', line)
        if m2:
            s = int(m2.group(1), 16)
            e = int(m2.group(2), 16)
            if s < TEXT_E:
                funcs.append((s, min(e, TEXT_E)))
print(f'함수 목록: {len(funcs)}')

def find_func(addr):
    for s, e in funcs:
        if s <= addr < e:
            return s
    return None

# --- 문자열 추출 (진짜 문자열만: ASCII 가독 + UTF-8 한글) ---
def is_ascii_str(b):
    return 0x20 <= b <= 0x7E

def is_hangul_lead(b):
    return 0xE0 <= b <= 0xEF  # 3바이트 UTF-8 리드

def check_hangul(data, i):
    """i 위치가 유효한 UTF-8 3바이트 시퀀스면 길이 반환"""
    if i + 2 >= len(data):
        return 0
    b0 = data[i]
    b1, b2 = data[i+1], data[i+2]
    if 0xE0 <= b0 <= 0xEF and 0x80 <= b1 <= 0xBF and 0x80 <= b2 <= 0xBF:
        # 한글 범위 확인 (가~힣)
        v = ((b0 & 0x0F) << 12) | ((b1 & 0x3F) << 6) | (b2 & 0x3F)
        if 0xAC00 <= v <= 0xD7A3:
            return 3
    return 0

strings = {}
i = RO_S
while i < RO_E:
    if is_ascii_str(data[i]) and data[i] != 0:
        j = i
        while j < RO_E and is_ascii_str(data[j]) and data[j] != 0:
            j += 1
        if j - i >= 3:
            strings[i] = data[i:j]
        i = j
    elif is_hangul_lead(data[i]):
        n = check_hangul(data, i)
        if n:
            j = i
            while j < RO_E:
                if is_hangul_lead(data[j]):
                    nn = check_hangul(data, j)
                    if nn:
                        j += nn
                        continue
                if is_ascii_str(data[j]) and data[j] != 0:
                    j += 1
                    continue
                break
            if j - i >= 3:
                strings[i] = data[i:j]
            i = j
        else:
            i += 1
    else:
        i += 1
print(f'문자열: {len(strings)}')

# --- .rodata 참조 (2단계: 리터럴 풀 역참조) ---
str_refs = defaultdict(set)   # str_addr -> {func}
code_refs = Counter()         # 코드 주소 -> 참조 수 (함수 포인터)
data_refs = defaultdict(list) # 데이터 주소 -> [pc]

for pc, t in lit_refs:
    fs = find_func(pc)
    if TEXT_S <= t < TEXT_E:
        # 리터럴 풀 역참조: t 위치의 4B 값
        v = struct.unpack_from('<I', data, t)[0]
        if RO_S <= v < RO_E:
            str_refs[v].add(fs if fs else -1)
        elif TEXT_S <= v < TEXT_E:
            code_refs[v] += 1
        elif DATA_RO_S <= v < DATA_RO_E or DATA_S <= v < DATA_E:
            data_refs[v].append(pc)
    elif RO_S <= t < RO_E:
        str_refs[t].add(fs if fs else -1)
    elif DATA_RO_S <= t < DATA_RO_E or DATA_S <= t < DATA_E:
        data_refs[t].append(pc)

# movw/movt 문자열 참조 (없음 — ARMv5 순수 Thumb 확인용 유지)
for pc, rd, val in mov_pairs:
    if RO_S <= val < RO_E:
        fs = find_func(pc)
        str_refs[val].add(fs if fs else -1)

print(f'.rodata 참조 문자열: {len(str_refs)}')

# --- 출력 ---
out = []
for t, fset in str_refs.items():
    raw = strings.get(t)
    if raw is None:
        continue
    try:
        text = raw.decode('utf-8', errors='replace')
    except:
        text = raw.hex()
    out.append((t, text, fset))

out.sort(key=lambda x: -len(x[2]))
with open('/tmp/strings_xref.txt', 'w') as f:
    f.write(f'# 문자열 XREF v3 (참조 {len(out)}개 / 전체 {len(strings)}개)\n')
    for t, text, fset in out:
        fr = ','.join(f'0x{x:05x}' for x in sorted(fset) if x >= 0)
        f.write(f'0x{t:05x} {len(fset):3d} {fr:50s} {text[:80]}\n')
print('저장: /tmp/strings_xref.txt')

print('\n=== TOP 80 참조 문자열 ===')
for t, text, fset in out[:80]:
    fr = ','.join(f'0x{x:05x}' for x in sorted(fset)[:5] if x >= 0)
    print(f'0x{t:05x} [{len(fset):2d}] {text[:65]:65s} ← {fr}')

# --- 리터럴 풀이 참조하는 코드 (함수 포인터 테이블) ---
print('\n=== 리터럴로 참조되는 코드 주소 TOP 30 ===')
for t, c in code_refs.most_common(30):
    print(f'0x{t:05x}: {c}회')
