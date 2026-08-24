#!/usr/bin/env python3
"""
전체 구조 분석 Phase 1 (v2): 함수 경계 탐지 + 호출 그래프 추출
- raw Thumb-2 디코더로 BL/BLX 전수 스캔 (capstone skipdata 정렬 문제 우회)
- push 프롤로그(16비트 push + 32비트 push.w) 위치
- BL 타겟 + 프롤로그 병합 → 함수 목록 → 호출 그래프
"""
import struct
from collections import defaultdict, Counter
import json, statistics

SRC = '/root/darkblade-mod/docs/libLauncher_original.so'
data = open(SRC, 'rb').read()
CODE_END = len(data)

# --- raw Thumb-2 BL/BLX 디코더 ---
def decode_bl(addr):
    """addr에 32비트 BL/BLX가 있으면 (target, is_bl) 반환, 아니면 None"""
    if addr + 4 > len(data):
        return None
    hw1, hw2 = struct.unpack_from('<HH', data, addr)
    if (hw1 & 0xF800) != 0xF000:
        return None
    S = (hw1 >> 10) & 1
    imm10 = hw1 & 0x3FF
    if (hw2 & 0xD000) == 0xD000:
        # BL: bit12=1
        J1 = (hw2 >> 13) & 1
        J2 = (hw2 >> 11) & 1
        imm11 = hw2 & 0x7FF
        I1 = J1 ^ S ^ 1  # I1 = NOT(J1 EOR S)
        I2 = J2 ^ S ^ 1
        imm32 = (S << 24) | (I1 << 23) | (I2 << 22) | (imm10 << 12) | (imm11 << 1)
        if S:
            imm32 -= (1 << 25)
        return addr + 4 + imm32, True
    elif (hw2 & 0xD000) == 0xC000:
        # BLX: bit12=0
        J1 = (hw2 >> 13) & 1
        J2 = (hw2 >> 11) & 1
        imm10L = (hw2 >> 1) & 0x3FF
        H = hw2 & 1
        I1 = J1 ^ S ^ 1
        I2 = J2 ^ S ^ 1
        imm32 = (S << 24) | (I1 << 23) | (I2 << 22) | (imm10 << 12) | (imm10L << 2) | (H << 1)
        if S:
            imm32 -= (1 << 25)
        return addr + 4 + imm32, False
    return None

# --- 16비트 BL도 확인 (ARMv5 Thumb BL은 없음 — 확인용) ---
bl_calls = defaultdict(list)  # caller -> [target]
bl_targets = defaultdict(list)  # target -> [caller]
n_bl = 0
n_blx = 0
addr = 0
while addr < CODE_END - 1:
    r = decode_bl(addr)
    if r:
        t, is_bl = r
        t_base = t & ~1
        # 타겟이 코드 영역 밖이면 오탐으로 간주 (데이터/문자열 구간)
        if 0x2ac8 <= t_base < CODE_END:
            bl_calls[addr].append(t_base)
            bl_targets[t_base].append(addr)
            if is_bl:
                n_bl += 1
            else:
                n_blx += 1
            addr += 4
            continue
    addr += 2

print(f'BL: {n_bl}건, BLX: {n_blx}건, 고유 타겟: {len(bl_targets)}')

# --- push 프롤로그 (16비트 push + 32비트 push.w E92D) ---
prologues = []
addr = 0
while addr < CODE_END - 1:
    hw = struct.unpack_from('<H', data, addr)[0]
    if 0xB400 <= hw <= 0xB5FF:
        prologues.append(addr)
        addr += 2
    elif hw == 0xE92D:
        prologues.append(addr)
        addr += 4
    else:
        addr += 2
print(f'push 프롤로그: {len(prologues)}')

# --- 함수 시작 후보 병합 ---
starts = set(bl_targets.keys()) | set(prologues)
starts = sorted(starts)
print(f'함수 시작 후보: {len(starts)}')

# --- 함수 경계 ---
funcs = []
for i, s in enumerate(starts):
    e = starts[i + 1] if i + 1 < len(starts) else CODE_END
    funcs.append((s, e))

# 함수별 호출
func_calls = []
for s, e in funcs:
    tgts = set()
    for addr in range(s, e):
        for t in bl_calls.get(addr, []):
            tgts.add(t)
    func_calls.append(tgts)

def prologue_kind(addr):
    if addr + 4 <= len(data):
        hw1, hw2 = struct.unpack_from('<HH', data, addr)
        if hw1 == 0xE92D:
            return f'push.w{{0x{hw2:04x}}}'
    if addr + 2 <= len(data):
        hw = struct.unpack_from('<H', data, addr)[0]
        if 0xB400 <= hw <= 0xB5FF:
            return f'push{{0x{hw:04x}}}'
    return 'no-push'

push_cnt = sum(1 for s, e in funcs if prologue_kind(s) != 'no-push')
bl_only = len(funcs) - push_cnt
print(f'push 프롤로그 함수: {push_cnt}, BL 타겟 전용: {bl_only}')

# --- 핫 타겟 ---
print('\n=== TOP 40 핫 타겟 (호출 수) ===')
hot = Counter()
for tgts in func_calls:
    for t in tgts:
        hot[t] += 1
for t, c in hot.most_common(40):
    size = ''
    for s, e in funcs:
        if s == t:
            size = f' size={e-s}'
            break
    mark = '[함수]' if t in starts else '[!미등록]'
    print(f'0x{t:05x}: {c}회 {mark}{size}')

# --- 함수 목록 저장 ---
with open('/tmp/functions_full.txt', 'w') as f:
    f.write(f'# 전체 함수 목록 ({len(funcs)}개)\n')
    f.write('# start  end    size  kind          call_cnt  targets\n')
    for i, (s, e) in enumerate(funcs):
        kind = prologue_kind(s)
        tgts = func_calls[i]
        t_str = ','.join(f'0x{t:05x}' for t in sorted(tgts)[:12])
        f.write(f'0x{s:05x} 0x{e:05x} {e-s:5d} {kind:13s} {len(tgts):4d}  {t_str}\n')
print('\n함수 목록 저장: /tmp/functions_full.txt')

cg = {}
for i, (s, e) in enumerate(funcs):
    cg[f'0x{s:05x}'] = sorted(f'0x{t:05x}' for t in func_calls[i])
with open('/tmp/callgraph.json', 'w') as f:
    json.dump(cg, f)
print('호출 그래프 저장: /tmp/callgraph.json')

sizes = [e - s for s, e in funcs]
print(f'함수 크기: min={min(sizes)} max={max(sizes)} median={int(statistics.median(sizes))} avg={int(statistics.mean(sizes))}')
print(f'대형 함수(>0x200): {sum(1 for x in sizes if x > 0x200)}개')
