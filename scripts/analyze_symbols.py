#!/usr/bin/env python3
"""전체 구조 분석 Phase 3: .symtab 파싱 → 함수/변수 이름 매핑"""
import re, json
from collections import defaultdict

data = open('/root/darkblade-mod/docs/libLauncher_original.so', 'rb').read()

funcs = []   # (addr, size, name)
objs = []    # (addr, size, name)
for line in open('/tmp/symtab_full.txt'):
    m = re.match(r'^\s*\d+: ([0-9a-f]+)\s+(\d+)\s+(FUNC|OBJECT)\s+\S+\s+\S+\s+(\S+)\s+(.+)$', line)
    if not m:
        continue
    addr = int(m.group(1), 16)
    size = int(m.group(2))
    typ = m.group(3)
    ndx = m.group(4)
    name = m.group(5).strip()
    if addr == 0 or name.startswith('$'):
        continue
    if ndx.isdigit() and int(ndx) == 7:
        if typ == 'FUNC':
            funcs.append((addr, size, name))
        else:
            objs.append((addr, size, name))

funcs.sort()
objs.sort()
print(f'정의 FUNC: {len(funcs)}, 정의 OBJECT(.text): {len(objs)}')

# 데이터 섹션 OBJECT도 수집
all_objs = []
for line in open('/tmp/symtab_full.txt'):
    m = re.match(r'^\s*\d+: ([0-9a-f]+)\s+(\d+)\s+OBJECT\s+\S+\s+\S+\s+(\S+)\s+(.+)$', line)
    if not m:
        continue
    addr = int(m.group(1), 16)
    size = int(m.group(2))
    ndx = m.group(3)
    name = m.group(4).strip()
    if addr == 0 or name.startswith('$'):
        continue
    if ndx.isdigit():
        all_objs.append((addr, size, name, int(ndx)))
print(f'전체 OBJECT: {len(all_objs)}')

# --- 핵심 주소 대조 ---
def lookup(addr):
    for f in funcs:
        if f[0] <= addr < f[0] + max(f[1], 1):
            return f
    return None

targets = [0x2e0e0, 0x5e130, 0x5de2c, 0x5f320, 0x40020, 0x16660, 0x32564, 0xbd28, 0xbef8,
           0xb9fc, 0x5d74c, 0x6384, 0x5f910, 0x613c4, 0x6140, 0x61a8, 0x3ade, 0x6de80,
           0x68ef4, 0x5deaa, 0x5f24c, 0x5e1c8, 0x2e0d0, 0x2b01, 0x2b19, 0x63fc, 0x5e35f]
print('\n=== 핵심 주소 심볼 ===')
for t in targets:
    h = lookup(t)
    if h:
        a, s, n = h
        print(f'0x{t:05x}: {n} (0x{a:05x} size={s})')
    else:
        print(f'0x{t:05x}: ???')

# --- 0x5e000~0x5e500 영역 (setAlpha 주변) 전체 ---
print('\n=== 0x5e000~0x5e800 영역 함수 ===')
for f in funcs:
    if 0x5e000 <= f[0] < 0x5e800:
        print(f'0x{f[0]:05x} ({f[1]:4d}B): {f[2]}')

# --- 이름 기반 모듈 그룹핑 ---
print('\n=== 이름 prefix 그룹 (TOP 30) ===')
prefix = defaultdict(int)
for a, s, n in funcs:
    # C++ mangled: _Z... -> demangle 시도 없이 prefix만
    p = re.match(r'([A-Za-z_]+)', n)
    if p:
        prefix[p.group(1)] += 1
for p, c in sorted(prefix.items(), key=lambda x: -x[1])[:30]:
    print(f'{p}: {c}')

# 결과 저장
with open('/tmp/func_symbols.json', 'w') as f:
    json.dump({'funcs': [{'addr': a, 'size': s, 'name': n} for a, s, n in funcs]}, f, ensure_ascii=False, indent=0)
print('\n저장: /tmp/func_symbols.json')
