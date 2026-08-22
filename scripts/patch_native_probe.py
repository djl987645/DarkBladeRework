#!/usr/bin/env python3
"""
Cycle B: libLauncher.so 네이티브 계측 패치 (v6 — 제로 블록 전용 배치)
- v5 실패: 로거 5개(0x732dc~0x7342C) + 문자열(0x7342C~0x734AC)이
  .rodata 실데이터(0x73400~: CP949 메뉴 문자열 + 16비트 테이블)를 파괴 → SIGBUS
- 해결: 로거/문자열을 검증된 제로 블록에만 배치
  - 로거2~5 (일반, 0x40): 0x732dc~0x7339c (원본 제로 확인)
  - 로거1 (draw_Menu, 0x50): 0x746c4~0x74714 (제로 블록 0x746c3~0x74754)
  - 문자열 (~112B): 0x74858~ (제로 블록 0x74857~0x748f8)
"""
import struct

SRC = '/root/darkblade-mod/src/lib/armeabi-v7a/libLauncher.so'
data = bytearray(open(SRC, 'rb').read())

GOT_LOGPRINT = 0x1bb998

# (주소, 메시지, 2번째 halfword(일반), 리터럴풀 타깃(draw_Menu만), 원래 push, 로거 위치, 슬롯)
TARGETS = [
    (0x16660, 'DBG:draw0(0x16660)',     0x465F, None,    0xB5F0, 0x732dc, 0x40),
    (0x40020, 'DBG:resload(0x40020)',   0x465F, None,    0xB5F0, 0x7331c, 0x40),
    (0x5de2c, 'DBG:imgslot(0x5de2c)',   0x4657, None,    0xB5F0, 0x7335c, 0x40),
    (0x5f320, 'DBG:creatImg(0x5f320)',  0x465F, None,    0xB5F0, 0x7339c, 0x40),
    (0x32564, 'DBG:draw_Menu(0x32564)', None,    0x32678, 0xB530, 0x746c4, 0x50),
]
# 문자열: 0x74858 (제로 블록 0x74857~0x748f8)
MSG_TAG = 0x74858

def enc_b_t2(addr, target):
    pc = addr + 4
    imm32 = target - pc
    if imm32 < 0:
        imm32 += (1 << 25)
    S = (imm32 >> 24) & 1
    I1 = (imm32 >> 23) & 1
    I2 = (imm32 >> 22) & 1
    imm10 = (imm32 >> 12) & 0x3FF
    imm11 = (imm32 >> 1) & 0x7FF
    J1 = (I1 ^ (1 - S)) & 1
    J2 = (I2 ^ (1 - S)) & 1
    h1 = 0xF000 | (S << 10) | imm10
    h2 = 0x9000 | (J1 << 13) | (1 << 12) | (J2 << 11) | imm11
    return struct.pack('<HH', h1, h2)

def enc_add_reg(rd, rn, rm):
    """Thumb-1 ADD(reg) T1 (r0-r7): 0001100 Rm Rn Rd"""
    assert all(r <= 7 for r in (rd, rn, rm))
    return struct.pack('<H', 0x1800 | (rm << 6) | (rn << 3) | rd)

# --- 1. 문자열 주소 선계산 ---
str_off = MSG_TAG
msg_addrs = {}
str_off += len('HERMES_DBG') + 1
while str_off % 4 != 0:
    str_off += 1
for addr, msg, _, _, _, _, _ in TARGETS:
    msg_addrs[addr] = str_off
    str_off += len(msg) + 1
    while str_off % 4 != 0:
        str_off += 1
print('문자열: tag=0x%05x, msg1=0x%05x, end=0x%05x' %
      (MSG_TAG, msg_addrs[TARGETS[0][0]], str_off))

# --- 2. 로거 코드 생성 ---
loggers = {}
for addr, msg, second_hw, litpool, orig_push, L, slot in TARGETS:
    is_drawmenu = (litpool is not None)
    b_off = 0x2E if is_drawmenu else 0x28
    lit_start = b_off + 6 if is_drawmenu else b_off + 4
    pushw_mask = 0x402F if is_drawmenu else 0x401F
    code = bytearray()
    code += struct.pack('<HH', 0xE92D, pushw_mask)   # 0x00 push.w
    code += struct.pack('<H', 0x2004)                # 0x04 movs r0, #4
    pc_adr = (L + 0x0A) & ~3
    imm8 = (L + lit_start - pc_adr) // 4
    assert 0 <= imm8 <= 255
    code += struct.pack('<H', 0xA400 | imm8)         # 0x06 adr r4, lit_start
    code += struct.pack('<HH', 0xF8D4, 0x1000)       # 0x08 ldr.w r1, [r4]
    code += enc_add_reg(1, 1, 4)                     # 0x0C add r1, r1, r4
    code += struct.pack('<HH', 0xF8D4, 0x2004)       # 0x0E ldr.w r2, [r4, #4]
    code += enc_add_reg(2, 2, 4)                     # 0x12 add r2, r2, r4
    code += struct.pack('<HH', 0xF8D4, 0x3008)       # 0x14 ldr.w r3, [r4, #8]
    code += enc_add_reg(3, 3, 4)                     # 0x18 add r3, r3, r4
    code += struct.pack('<HH', 0xF8D3, 0x3000)       # 0x1A ldr.w r3, [r3]
    code += struct.pack('<H', 0x4798)                # 0x1E blx r3
    code += struct.pack('<HH', 0xE8BD, pushw_mask)   # 0x20 pop.w
    if is_drawmenu:
        code += struct.pack('<HH', 0xF8D4, 0xC00C)   # 0x24 ldr.w r12, [r4, #12] (lit4)
        code += struct.pack('<H', 0x4464)            # 0x28 add r4, r4, r12
        code += struct.pack('<HH', 0xF8D4, 0x4000)   # 0x2A ldr.w r4, [r4] (V)
    else:
        code += struct.pack('<H', orig_push)         # 0x24 원래 push
        code += struct.pack('<H', second_hw)         # 0x26 원래 mov
    code += enc_b_t2(L + b_off, addr + 4)            # b.w 함수+4
    while (L + len(code)) % 4 != 0:
        code += b'\x00'
    lit1_off = len(code)
    code += struct.pack('<i', MSG_TAG - (L + lit1_off))
    code += struct.pack('<i', msg_addrs[addr] - (L + lit1_off))
    code += struct.pack('<i', GOT_LOGPRINT - (L + lit1_off))
    if is_drawmenu:
        code += struct.pack('<i', litpool - (L + lit1_off))
    while len(code) < slot:
        code += b'\x00'
    loggers[addr] = (L, code)

# --- 3. 기록 + 제로 검증 ---
for addr, (L, code) in loggers.items():
    # 원본이 제로인지 확인 (로거 시작 4B)
    orig = bytes(data[L:L+4])
    z = b'\x00' * 4
    print(f'로거 0x{L:05x}: 원본 {orig.hex()} → {"제로OK" if orig == z else "⚠️제로아님!"}')
    data[L:L+len(code)] = code
data[MSG_TAG:MSG_TAG+len('HERMES_DBG')+1] = b'HERMES_DBG\x00'
for addr, msg, _, _, _, _, _ in TARGETS:
    b = (msg + '\x00').encode('ascii')
    data[msg_addrs[addr]:msg_addrs[addr]+len(b)] = b

# --- 4. 함수 첫 4B 패치 ---
for addr, (L, _) in loggers.items():
    patch = enc_b_t2(addr, L)
    print(f'패치 0x{addr:05x} → 0x{L:05x}: {bytes(data[addr:addr+4]).hex()} -> {patch.hex()}')
    data[addr:addr+4] = patch

open(SRC, 'wb').write(data)
print(f'저장: {SRC} ({len(data)}B)')

# --- 5. 검증 ---
from capstone import *
md = Cs(CS_ARCH_ARM, CS_MODE_THUMB)
md.detail = True
for addr, (L, _) in loggers.items():
    name = 'draw_Menu' if addr == 0x32564 else hex(addr)
    end = L + 0x34 if addr == 0x32564 else L + 0x2C
    print(f'\n=== 로거({name}) 0x{L:05x} ===')
    for ins in md.disasm(bytes(data[L:end]), L):
        print(f'  0x{ins.address:05x}: {ins.bytes.hex():10} {ins.mnemonic} {ins.op_str}')
