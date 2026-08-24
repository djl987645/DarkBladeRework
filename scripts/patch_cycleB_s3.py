#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Cycle B (S3) — 네이티브 계측: 실행 경로 실측
타깃: mainTimer(0xbd28) / draw_Menu(0x32564) / 상태0(0x16660) / 리소스 로드(0x40020) / img_slot(0x5de2c)
방식: 함수 시작 4B → b.w 스텁. 스텁에서 __android_log_print(GOT 0x1bb998 경유) 호출 후 원래 4B 실행 + 복귀.
- mainTimer/draw_Menu: 카운터(첫 진입 1회만 로그, 폭주 방지)
- state0/resload/slot: 매 호출 로그 (호출 횟수 = 카운트로 분석)
문자열: 0x1bb704~ (vaddr 0x1bc704~), 카운터: 0x1bb750/0x1bb754
스텁: 0x732da~0x733e4 (빈 영역)
"""
import struct, hashlib

path = 'src/lib/armeabi-v7a/libLauncher.so'
data = bytearray(open(path, 'rb').read())
print(f'입력 md5: {hashlib.md5(data).hexdigest()}')

# ===== 파일 확장 (LOAD 5에 문자열/카운터 공간 추가: 0x1e6c98 → 0x1e6d00) =====
TARGET_SIZE = 0x1e6d00
if len(data) < TARGET_SIZE:
    data.extend(b'\x00' * (TARGET_SIZE - len(data)))
    print(f'파일 확장: 0x{len(data):x} → 0x{TARGET_SIZE:x}')

GOT_VADDR = 0x1bb998          # __android_log_print R_ARM_JUMP_SLOT (vaddr)
GOT_OFF   = GOT_VADDR - 0x1000  # 파일 오프셋

# ===== 문자열 배치 (LOAD 5 확장 영역: offset 0x1e6c98, vaddr = offset+0xA7000) =====
STR_OFF = 0x1e6c98
NEW_DELTA = 0xA7000
msgs = {
    'mainTimer': b'DBG mainTimer\x00',
    'draw_Menu': b'DBG draw_Menu\x00',
    'state0':    b'DBG state0\x00',
    'resload':   b'DBG resload\x00',
    'slot':      b'DBG slot\x00',
}
tag = b'HERMES\x00'
tag_vaddr = STR_OFF + NEW_DELTA
msg_vaddrs = {}
cur = STR_OFF + len(tag)
for name, m in msgs.items():
    msg_vaddrs[name] = cur + NEW_DELTA
    assert all(b == 0 for b in data[cur:cur + len(m)]), f'문자열 영역 충돌: {name} @0x{cur:x}'
    cur += len(m)
# 카운터 영역 (LOAD 5 확장: 0x1e6ce0, 0x1e6ce4)
for coff in (0x1e6ce0, 0x1e6ce4):
    assert data[coff:coff+4] == b'\x00' * 4, f'카운터 영역 충돌 @0x{coff:x}'

# ===== 인코딩 함수 =====
def enc_bw(addr, target):
    """Thumb-2 b.w (4B)"""
    off = target - (addr + 4)
    if off < 0:
        off = (1 << 32) + off
    S  = (off >> 24) & 1
    I1 = (off >> 23) & 1
    I2 = (off >> 22) & 1
    J1 = (~(I1 ^ S)) & 1
    J2 = (~(I2 ^ S)) & 1
    imm10 = (off >> 12) & 0x3FF
    imm11 = (off >> 1) & 0x7FF
    h1 = (0b11110 << 11) | (S << 10) | imm10
    h2 = (0b10 << 14) | (J1 << 13) | (1 << 12) | (J2 << 11) | imm11
    return struct.pack('<HH', h1, h2)

def enc_ldr_pc(rt, pc_addr, lit_addr):
    """16비트 ldr rt, [pc, #imm] — 리터럴 위치 lit_addr"""
    pc = (pc_addr + 4) & ~3
    imm = lit_addr - pc
    assert 0 <= imm <= 1020 and imm % 4 == 0, f'ldr pc imm 범위: {imm}'
    return struct.pack('<H', 0x4800 | (rt << 8) | (imm >> 2))

def enc_add_pc(rn):
    return struct.pack('<H', 0x4478 | rn)

def rel_lit(target_vaddr, add_pc_addr):
    """add rX, pc 후 절대 주소가 되도록 리터럴 값 = target - align(add주소+4,4)"""
    pc = (add_pc_addr + 4) & ~3
    v = (target_vaddr - pc) & 0xFFFFFFFF
    return struct.pack('<I', v)

# ===== 스텁 생성 =====
# (주소, 이름, 카운터 여부, 원본 크기)
# 모든 함수: 16비트 push(2B) 시작 + 두 번째 명령은 PC-relative(ldr rX,[pc,#imm])
# → 스텁에서 원본 2B(push)만 실행, 복귀 faddr+2 (PC-relative가 원본 주소 기준으로 실행되게)
FUNCS = [
    (0x32564, 'draw_Menu', False, 2),
    (0x16660, 'state0',    False, 2),
    (0x40020, 'resload',   False, 2),
    (0x5de2c, 'slot',      False, 2),
]
STUB_BASE = 0x732dc  # 4의 배수 정렬 (리터럴 ldr pc-relative 요구)
STUB_SIZES = {True: 64, False: 48}  # 카운터 O: 64B, 카운터 X: 48B
counters = {0xbd28: 0x1e6ce0, 0x32564: 0x1e6ce4}

for idx, (faddr, name, use_cnt, orig_sz) in enumerate(FUNCS):
    S = STUB_BASE + sum(STUB_SIZES[FUNCS[j][2]] for j in range(idx))
    # 정확한 위치 계산 (순서대로 배치)
    stub = bytearray()

    # 원래 함수 시작 4B
    orig4 = bytes(data[faddr:faddr+4])
    orig_n = bytes(data[faddr:faddr+orig_sz])
    print(f'  0x{faddr:x} ({name}) 원본 4B: {orig4.hex()}')

    if use_cnt:
        # push {r0-r5,r12,lr}
        stub += bytes.fromhex('2de93f50')
        add_addrs = []
        # 카운터 체크
        c_off = counters[faddr]
        c_vaddr = c_off + NEW_DELTA
        a = S + len(stub); stub += enc_ldr_pc(4, a, S + 48)   # ldr r4, [pc,#..]
        a = S + len(stub); stub += enc_add_pc(4); add_addrs.append(a)  # add r4, pc
        a = S + len(stub); stub += struct.pack('<H', 0x6825)  # ldr r5, [r4]  (r4=카운터 주소, r5=값)
        a = S + len(stub); stub += struct.pack('<H', 0x2D00)  # cmp r5, #0
        a = S + len(stub); stub += struct.pack('<H', 0xD10A)  # bne +20 → skip (pop 위치 0x73300, r5!=0이면 로그 생략)
        a = S + len(stub); stub += struct.pack('<H', 0x2501)  # movs r5, #1
        a = S + len(stub); stub += struct.pack('<H', 0x6025)  # str r5, [r4]  (r4=주소 그대로, 카운터=1)
        a = S + len(stub); stub += struct.pack('<H', 0x2003)  # movs r0, #3
        # tag
        a = S + len(stub); stub += enc_ldr_pc(1, a, S + 52)
        a = S + len(stub); stub += enc_add_pc(1); add_addrs.append(a)
        # msg
        a = S + len(stub); stub += enc_ldr_pc(2, a, S + 56)
        a = S + len(stub); stub += enc_add_pc(2); add_addrs.append(a)
        # GOT
        a = S + len(stub); stub += enc_ldr_pc(3, a, S + 60)
        a = S + len(stub); stub += enc_add_pc(3); add_addrs.append(a)
        a = S + len(stub); stub += struct.pack('<H', 0x681B)  # ldr r3, [r3]
        a = S + len(stub); stub += struct.pack('<H', 0x4798)  # blx r3
        # pop {r0-r5,r12,lr} (skip 목적지)
        stub += bytes.fromhex('bde83f50')
        # 원래 명령(orig_sz) + 패딩 + b.w (복귀 faddr+orig_sz)
        stub += orig_n
        stub += b'\x00' * (4 - orig_sz)
        a = S + len(stub); stub += enc_bw(a, faddr + orig_sz)
        # 리터럴 4개
        stub += rel_lit(c_vaddr, add_addrs[0])     # 카운터
        stub += rel_lit(tag_vaddr, add_addrs[1])   # tag
        stub += rel_lit(msg_vaddrs[name], add_addrs[2])  # msg
        stub += rel_lit(GOT_VADDR, add_addrs[3])   # GOT
    else:
        stub += bytes.fromhex('2de90f50')   # push {r0-r3,r12,lr}
        a = S + len(stub); stub += struct.pack('<H', 0x2003)  # movs r0, #3
        a = S + len(stub); stub += enc_ldr_pc(1, a, S + 36)   # tag (리터럴 4의 배수 정렬)
        a = S + len(stub); stub += enc_add_pc(1)
        a = S + len(stub); stub += enc_ldr_pc(2, a, S + 40)   # msg
        a = S + len(stub); stub += enc_add_pc(2)
        a = S + len(stub); stub += enc_ldr_pc(3, a, S + 44)   # GOT
        a = S + len(stub); stub += enc_add_pc(3)
        a = S + len(stub); stub += struct.pack('<H', 0x681B)  # ldr r3, [r3]
        a = S + len(stub); stub += struct.pack('<H', 0x4798)  # blx r3
        stub += bytes.fromhex('bde80f50')   # pop {r0-r3,r12,lr}
        stub += orig_n
        stub += b'\x00' * (4 - orig_sz)
        a = S + len(stub); stub += enc_bw(a, faddr + orig_sz)
        stub += b'\x00\x00'                 # 패딩 (S+34~35)
        stub += rel_lit(tag_vaddr, S + 8)
        stub += rel_lit(msg_vaddrs[name], S + 12)
        stub += rel_lit(GOT_VADDR, S + 16)

    # 스텁 배치 (빈 영역 확인)
    assert all(b == 0 for b in data[S:S+len(stub)]), f'스텁 영역 충돌 @0x{S:x}'
    data[S:S+len(stub)] = stub
    # 함수 시작에 b.w
    data[faddr:faddr+4] = enc_bw(faddr, S)
    print(f'  0x{faddr:x} → b.w 0x{S:x} (스텁 {len(stub)}B)')

# ===== 문자열 기록 =====
data[STR_OFF:STR_OFF+len(tag)] = tag
cur = STR_OFF + len(tag)
for name, m in msgs.items():
    data[cur:cur+len(m)] = m
    cur += len(m)

# ===== LOAD 5 (프로그램 헤더 인덱스 5) p_filesz/p_memsz 확장: 0xc98 → 0xd00 =====
e_phoff = struct.unpack('<I', data[28:32])[0]
ph5 = e_phoff + 5 * 32
old_fsz = struct.unpack('<I', data[ph5+16:ph5+20])[0]
assert old_fsz == 0xc98, f'LOAD 5 p_filesz 기대 0xc98, 실제 0x{old_fsz:x}'
data[ph5+16:ph5+20] = struct.pack('<I', 0xd00)
data[ph5+20:ph5+24] = struct.pack('<I', 0xd00)
print('LOAD 5 확장: p_filesz/p_memsz 0xc98 → 0xd00')

open(path, 'wb').write(data)
print(f'출력 md5: {hashlib.md5(data).hexdigest()}')
print('완료')
