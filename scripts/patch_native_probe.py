#!/usr/bin/env python3
"""
Cycle B/C: libLauncher.so 네이티브 계측 패치 (v7 — imgslot 슬롯 번호 실측)
- Cycle B 결과 반영: draw_Menu 로거 제외 (0x11af8 Java 콜백 경로와 충돌 → SIGBUS)
- imgslot(0x5de2c) 로거: r0(슬롯 인덱스)을 __android_log_print 4번째 인자로 전달
  fmt = "imgslot:%d" → 로그에서 슬롯 번호 실측
- 로거 배치: 0x732dc~ (제로 블록) / 문자열: 0x74858~
"""
import struct

SRC = '/root/darkblade-mod/src/lib/armeabi-v7a/libLauncher.so'
data = bytearray(open(SRC, 'rb').read())

GOT_LOGPRINT = 0x1bb998
MSG_TAG = 0x74858

# (주소, 메시지, 2번째 halfword, 원래 push, 로거 위치, fmt_슬롯_모드)
TARGETS = [
    (0x16660, 'DBG:draw0(0x16660)',    0x465F, 0xB5F0, 0x732dc, False),
    (0x40020, 'DBG:resload(0x40020)',  0x465F, 0xB5F0, 0x7331c, False),
    (0x5de2c, 'imgslot st:%d',        0x4657, 0xB5F0, 0x7335c, True),
    (0x5f320, 'DBG:creatImg(0x5f320)', 0x465F, 0xB5F0, 0x7339c, False),
]

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
    assert all(r <= 7 for r in (rd, rn, rm))
    return struct.pack('<H', 0x1800 | (rm << 6) | (rn << 3) | rd)

# --- 1. 문자열 주소 ---
str_off = MSG_TAG
msg_addrs = {}
str_off += len('HERMES_DBG') + 1
while str_off % 4 != 0:
    str_off += 1
for addr, msg, _, _, _, _ in TARGETS:
    msg_addrs[addr] = str_off
    str_off += len(msg) + 1
    while str_off % 4 != 0:
        str_off += 1
MT_FMT_ADDR = str_off          # mainTimer용 "st:%d" 문자열 주소
str_off += len('st:%d') + 1
while str_off % 4 != 0:
    str_off += 1
print('문자열: tag=0x%05x, end=0x%05x, mt_fmt=0x%05x' % (MSG_TAG, str_off, MT_FMT_ADDR))

# --- 2. 로거 코드 ---
loggers = {}
for addr, msg, second_hw, orig_push, L, slot_mode in TARGETS:
    b_off = 0x30 if slot_mode else 0x28
    lit_start = b_off + 4
    code = bytearray()
    code += struct.pack('<HH', 0xE92D, 0x401F)      # 0x00 push.w {r0-r3, r4, lr}
    code += struct.pack('<H', 0x2004)               # 0x04 movs r0, #4
    pc_adr = (L + 0x0A) & ~3
    imm8 = (L + lit_start - pc_adr) // 4
    assert 0 <= imm8 <= 255
    code += struct.pack('<H', 0xA400 | imm8)        # 0x06 adr r4, lit_start
    code += struct.pack('<HH', 0xF8D4, 0x1000)      # 0x08 ldr.w r1, [r4]
    code += enc_add_reg(1, 1, 4)                    # 0x0C add r1, r1, r4
    code += struct.pack('<HH', 0xF8D4, 0x2004)      # 0x0E ldr.w r2, [r4, #4]
    code += enc_add_reg(2, 2, 4)                    # 0x12 add r2, r2, r4
    code += struct.pack('<HH', 0xF8D4, 0x3008)      # 0x14 ldr.w r3, [r4, #8]
    code += enc_add_reg(3, 3, 4)                    # 0x18 add r3, r3, r4
    if slot_mode:
        # 0x1A ldr.w r12, [r3] → r12 = __android_log_print
        code += struct.pack('<HH', 0xF8D3, 0xC000)
        # 0x1E ldr.w r3, [sp, #0] → r3 = 슬롯 포인터 (원래 r0)
        code += struct.pack('<HH', 0xF8DD, 0x3000)
        # 0x22 ldrb.w r3, [r3, #0x21] → r3 = 슬롯 상태 바이트
        code += struct.pack('<HH', 0xF8D3, 0x3021)
        # 0x26 blx r12
        code += struct.pack('<H', 0x47E0)
        # 0x28 pop.w
        code += struct.pack('<HH', 0xE8BD, 0x401F)
        # 0x2C push / 0x2E mov / 0x30 b.w
        code += struct.pack('<H', orig_push)
        code += struct.pack('<H', second_hw)
    else:
        code += struct.pack('<HH', 0xF8D3, 0x3000)  # 0x1A ldr.w r3, [r3]
        code += struct.pack('<H', 0x4798)           # 0x1E blx r3
        code += struct.pack('<HH', 0xE8BD, 0x401F)  # 0x20 pop.w
        code += struct.pack('<H', orig_push)        # 0x24 push
        code += struct.pack('<H', second_hw)        # 0x26 mov
    code += enc_b_t2(L + b_off, addr + 4)           # b.w 함수+4
    while (L + len(code)) % 4 != 0:
        code += b'\x00'
    lit1_off = len(code)
    code += struct.pack('<i', MSG_TAG - (L + lit1_off))
    code += struct.pack('<i', msg_addrs[addr] - (L + lit1_off))
    code += struct.pack('<i', GOT_LOGPRINT - (L + lit1_off))
    while len(code) < 0x40:
        code += b'\x00'
    loggers[addr] = (L, code)

# --- 2b. mainTimer(0xbd28) 로거 — 상태값 실측 (슬롯 0x50, 제로 블록 0x746c4) ---
MT_ADDR = 0xbd28
MT_L = 0x746c4
MT_FMT = MT_FMT_ADDR        # 문자열 "st:%d"
STATE_OBJ = 0x1bcaf0      # [0x1bcaf0] = 객체 ptr, +4 = 상태값
V7_MAINTIMER = 0x1afbd4   # [0xbeb8] — r7 = V7 + pc(0xbd34) = 0x1bb908
code = bytearray()
code += struct.pack('<HH', 0xE92D, 0x403F)      # 0x00 push.w {r0-r3, r4, r5, lr}
code += struct.pack('<H', 0x2004)               # 0x04 movs r0, #4
pc_adr = (MT_L + 0x0A) & ~3
imm8 = (MT_L + 0x40 - pc_adr) // 4   # 리터럴 @0x40 (b.w 0x3C~0x3F)
assert 0 <= imm8 <= 255
code += struct.pack('<H', 0xA400 | imm8)        # 0x06 adr r4, 0x3E (리터럴)
code += struct.pack('<HH', 0xF8D4, 0x1000)      # 0x08 ldr.w r1, [r4]
code += enc_add_reg(1, 1, 4)                    # tag
code += struct.pack('<HH', 0xF8D4, 0x2004)      # 0x0E ldr.w r2, [r4, #4]
code += enc_add_reg(2, 2, 4)                    # fmt
code += struct.pack('<HH', 0xF8D4, 0x3008)      # 0x14 ldr.w r3, [r4, #8]
code += enc_add_reg(3, 3, 4)                    # got
code += struct.pack('<HH', 0xF8D3, 0x3000)      # 0x1A ldr.w r3, [r3] = 함수
code += struct.pack('<HH', 0xF8D4, 0x500C)      # 0x1E ldr.w r5, [r4, #12]
code += enc_add_reg(5, 5, 4)                    # 0x22 r5 = base+0x1bcaf0
code += struct.pack('<HH', 0xF8D5, 0x5000)      # 0x26 ldr.w r5, [r5] = 객체 ptr
code += struct.pack('<H', 0x2D00)               # 0x2A cmp r5, #0
code += struct.pack('<H', 0xD001)               # 0x2C beq +2 (객체 0이면 skip — r5=0 로그)
code += struct.pack('<HH', 0xF8D5, 0x5004)      # 0x2E ldr.w r5, [r5, #4] = 상태값
code += struct.pack('<H', 0x4798)               # 0x32 blx r3
code += struct.pack('<HH', 0xF8D4, 0x7010)      # 0x34 ldr.w r7, [r4, #16] = V7
code += struct.pack('<HH', 0xE8BD, 0x403F)      # 0x38 pop.w
code += struct.pack('<H', 0xB5F0)               # 0x3C push {r4-r7, lr} (원래)
code += enc_b_t2(MT_L + 0x3C, MT_ADDR + 4)      # 0x3C b.w 0xbd2c (실제 레이아웃: b.w @0x3C)
while (MT_L + len(code)) % 4 != 0:
    code += b'\x00'
lit1_off = len(code)
code += struct.pack('<i', MSG_TAG - (MT_L + lit1_off))            # lit1 tag
code += struct.pack('<i', MT_FMT - (MT_L + lit1_off))             # lit2 fmt
code += struct.pack('<i', GOT_LOGPRINT - (MT_L + lit1_off))       # lit3 got
code += struct.pack('<i', STATE_OBJ - (MT_L + lit1_off))          # lit4 상태객체 (r5 #12)
code += struct.pack('<i', V7_MAINTIMER)                           # lit5 V7 (r7 #16)
while len(code) < 0x58:
    code += b'\x00'
loggers[MT_ADDR] = (MT_L, code)
print(f'mainTimer 로거 @0x{MT_L:05x}, 상태객체 0x{STATE_OBJ:05x}, V7=0x{V7_MAINTIMER:08x}')

# --- 3. 기록 ---
for addr, (L, code) in loggers.items():
    orig = bytes(data[L:L+4])
    z = b'\x00' * 4
    print(f'로거 0x{L:05x}: 원본 {orig.hex()} → {"제로OK" if orig == z else "⚠️제로아님!"}')
    data[L:L+len(code)] = code
data[MSG_TAG:MSG_TAG+len('HERMES_DBG')+1] = b'HERMES_DBG\x00'
for addr, msg, _, _, _, _ in TARGETS:
    b = (msg + '\x00').encode('ascii')
    data[msg_addrs[addr]:msg_addrs[addr]+len(b)] = b
b = b'st:%d\x00'
data[MT_FMT_ADDR:MT_FMT_ADDR+len(b)] = b

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
for addr, (L, _) in loggers.items():
    if addr != 0x5de2c:
        continue
    print(f'\n=== imgslot 로거 (0x{L:05x}) ===')
    for ins in md.disasm(bytes(data[L:L+0x30]), L):
        print(f'  0x{ins.address:05x}: {ins.bytes.hex():10} {ins.mnemonic} {ins.op_str}')
