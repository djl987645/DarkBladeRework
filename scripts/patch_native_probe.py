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
    (0x16660, 'DBG:draw0(0x16660)',    0x465F, 0xB5F0, 0x732dc, False, False),
    (0x40020, 'DBG:resload(0x40020)',  0x465F, 0xB5F0, 0x7331c, False, False),
    (0x5de2c, 'imgslot st:%d',        0x4657, 0xB5F0, 0x7335c, True,  False),
    (0x5f320, 'DBG:creatImg(0x5f320)', 0x465F, 0xB5F0, 0x7339c, False, False),
    (0x61066, 'imgret:%d',            0x1C28, 0x1C04, 0x74a58, True,  True),
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
for addr, msg, _, _, _, _, _ in TARGETS:
    msg_addrs[addr] = str_off
    str_off += len(msg) + 1
    while str_off % 4 != 0:
        str_off += 1
MT_FMT_ADDR = str_off          # mainTimer용 "st:%d" 문자열 주소
str_off += len('st:%d') + 1
while str_off % 4 != 0:
    str_off += 1
RC_FMT_ADDR = str_off          # resChain용 "rcst:%d" 문자열 주소
str_off += len('rcst:%d') + 1
while str_off % 4 != 0:
    str_off += 1
OBJ_FMT_ADDR = str_off         # mainTimer용 "obj:%x" (객체 포인터) 문자열 주소
str_off += len('obj:%x') + 1
while str_off % 4 != 0:
    str_off += 1
print('문자열: tag=0x%05x, end=0x%05x, mt_fmt=0x%05x, rc_fmt=0x%05x, obj_fmt=0x%05x' % (MSG_TAG, str_off, MT_FMT_ADDR, RC_FMT_ADDR, OBJ_FMT_ADDR))

# --- 2. 로거 코드 ---
loggers = {}
for addr, msg, second_hw, orig_push, L, slot_mode, raw_r0 in TARGETS:
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
        # 0x1E ldr.w r3, [sp, #0] → r3 = 원래 r0
        code += struct.pack('<HH', 0xF8DD, 0x3000)
        if raw_r0:
            # 0x22 nop ×2 — r0 값 자체를 로그 (imgret)
            code += struct.pack('<HH', 0xBF00, 0xBF00)
        else:
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
STATE_OBJ = 0x23ccb0      # 상태 객체 직접 주소 (vaddr, R_ARM_RELATIVE addend — mTimer 0x23ccf8 근처)
STATE_SLOT = 0x1bbaf0     # [0x1bbaf0] = 상태 객체 ptr 슬롯 — 매 틱 복구 (포팅 레이어가 __android_log_print 주소로 덮음)
V7_MAINTIMER = 0x1afbd4   # [0xbeb8] — r7 = V7 + pc(0xbd34) = 0x1bb908
MT_LIT = 0x4C             # 리터럴 풀 위치
code = bytearray()
code += struct.pack('<HH', 0xE92D, 0x407F)      # 0x00 push.w {r0-r6, lr}
code += struct.pack('<H', 0x2004)               # 0x04 movs r0, #4
pc_adr = (MT_L + 0x0A) & ~3
imm8 = (MT_L + MT_LIT - pc_adr) // 4
assert 0 <= imm8 <= 255
code += struct.pack('<H', 0xA400 | imm8)        # 0x06 adr r4, 리터럴
code += struct.pack('<HH', 0xF8D4, 0x1000)      # 0x08 ldr.w r1, [r4] = tag
code += enc_add_reg(1, 1, 4)
code += struct.pack('<HH', 0xF8D4, 0x2004)      # 0x0E ldr.w r2, [r4, #4] = fmt
code += enc_add_reg(2, 2, 4)
code += struct.pack('<HH', 0xF8D4, 0x3008)      # 0x14 ldr.w r3, [r4, #8] = got
code += enc_add_reg(3, 3, 4)
code += struct.pack('<HH', 0xF8D3, 0xC000)      # 0x1A ldr.w r12, [r3] = 함수 (r3은 값 전달용)
code += struct.pack('<HH', 0xF8D4, 0x500C)      # 0x1E ldr.w r5, [r4, #12] = 객체 주소 오프셋
code += enc_add_reg(5, 5, 4)                    # 0x22 r5 = B+0x23ccb0
code += struct.pack('<HH', 0xF8D4, 0x6014)      # 0x24 ldr.w r6, [r4, #20] = 슬롯 주소 오프셋
code += enc_add_reg(6, 6, 4)                    # 0x28 r6 = B+0x1bbaf0
code += struct.pack('<H', 0x6035)               # 0x2A str r5, [r6] — 슬롯 복구!
code += struct.pack('<H', 0x2601)               # 0x2C movs r6, #1
code += struct.pack('<H', 0x602E)               # 0x2E str r6, [r5] — [obj+0]=1 (게임 상태)
code += struct.pack('<H', 0x2624)               # 0x30 movs r6, #0x24
code += struct.pack('<H', 0x612E)               # 0x32 str r6, [r5, #4] — [obj+4]=0x24 (리소스 상태)
code += struct.pack('<HH', 0xF8D5, 0x5000)      # 0x34 ldr.w r5, [r5] — 상태값
code += struct.pack('<H', 0x462B)               # 0x38 mov r3, r5 — 값 전달
code += struct.pack('<H', 0x47E0)               # 0x3A blx r12
code += struct.pack('<HH', 0xF8D4, 0x7010)      # 0x3C ldr.w r7, [r4, #16] = V7
code += struct.pack('<HH', 0xE8BD, 0x407F)      # 0x40 pop.w {r0-r6, lr}
code += struct.pack('<H', 0xB5F0)               # 0x44 push {r4-r7, lr} (원래)
code += enc_b_t2(MT_L + 0x46, MT_ADDR + 4)      # 0x46 b.w 0xbd2c
while (MT_L + len(code)) % 4 != 0:
    code += b'\x00'
lit1_off = len(code)
code += struct.pack('<i', MSG_TAG - (MT_L + lit1_off))            # lit1 tag
code += struct.pack('<i', MT_FMT - (MT_L + lit1_off))             # lit2 fmt
code += struct.pack('<i', GOT_LOGPRINT - (MT_L + lit1_off))       # lit3 got
code += struct.pack('<i', STATE_OBJ - (MT_L + lit1_off))          # lit4 상태객체
code += struct.pack('<i', V7_MAINTIMER)                           # lit5 V7
code += struct.pack('<i', STATE_SLOT - (MT_L + lit1_off))         # lit6 슬롯 주소
while len(code) < 0x64:
    code += b'\x00'
loggers[MT_ADDR] = (MT_L, code)
print(f'mainTimer 로거 @0x{MT_L:05x}, 상태객체 0x{STATE_OBJ:05x}, V7=0x{V7_MAINTIMER:08x}')

# --- 2c. resChain(0x4b658) 로거 — 상태값 실측 ([0x1bbaac] → obj+4, 리소스 로드 상태 36~60) ---
RC_ADDR = 0x4b658
RC_L = 0x74a00
RC_FMT = RC_FMT_ADDR        # 문자열 "rcst:%d"
RC_STATE_OBJ = 0x23ccb0     # 상태 객체 직접 주소 (vaddr) — 슬롯 경유 없음, +4 = 리소스 상태
V7_RESCHAIN = 0x0017029c    # [0x4b9c4] — resChain r7 (0x4b668 add r7,pc → 0x1bb908)
code = bytearray()
code += struct.pack('<HH', 0xE92D, 0x40BF)      # 0x00 push.w {r0-r5, r7, lr} — r7 보존!
code += struct.pack('<H', 0x2004)               # 0x04 movs r0, #4
pc_adr = (RC_L + 0x0A) & ~3
imm8 = (RC_L + 0x44 - pc_adr) // 4   # 리터럴 @0x44
assert 0 <= imm8 <= 255
code += struct.pack('<H', 0xA400 | imm8)        # 0x06 adr r4, 리터럴
code += struct.pack('<HH', 0xF8D4, 0x1000)      # 0x08 ldr.w r1, [r4] = tag
code += enc_add_reg(1, 1, 4)
code += struct.pack('<HH', 0xF8D4, 0x2004)      # 0x0E ldr.w r2, [r4, #4] = fmt
code += enc_add_reg(2, 2, 4)
code += struct.pack('<HH', 0xF8D4, 0x3008)      # 0x14 ldr.w r3, [r4, #8] = got
code += enc_add_reg(3, 3, 4)
code += struct.pack('<HH', 0xF8D3, 0xC000)      # 0x1A ldr.w r12, [r3] = 함수 (r3은 값 전달용)
code += struct.pack('<HH', 0xF8D4, 0x500C)      # 0x1E ldr.w r5, [r4, #12] = 상태객체 주소
code += enc_add_reg(5, 5, 4)
code += struct.pack('<HH', 0xBF00, 0xBF00)      # 0x26 nop ×2 — 슬롯 경유 없이 직접 접근
code += struct.pack('<H', 0x2D00)               # 0x2A cmp r5, #0
code += struct.pack('<H', 0xD001)               # 0x2C beq +2
code += struct.pack('<HH', 0xF8D5, 0x5004)      # 0x2E ldr.w r5, [r5, #4] = 상태값
code += struct.pack('<H', 0x462B)               # 0x32 mov r3, r5 — 값 전달
code += struct.pack('<H', 0x47E0)               # 0x34 blx r12
code += struct.pack('<HH', 0xF8D4, 0x7010)      # 0x36 ldr.w r7, [r4, #16] = V7
code += struct.pack('<HH', 0xE8BD, 0x40BF)      # 0x3A pop.w {r0-r5, r7, lr} — r7 복원!
code += struct.pack('<H', 0xB5F0)               # 0x3E push {r4-r7, lr} (원래)
code += enc_b_t2(RC_L + 0x40, RC_ADDR + 4)      # 0x40 b.w 0x4b65c
while (RC_L + len(code)) % 4 != 0:
    code += b'\x00'
lit1_off = len(code)
code += struct.pack('<i', MSG_TAG - (RC_L + lit1_off))            # lit1 tag
code += struct.pack('<i', RC_FMT - (RC_L + lit1_off))             # lit2 fmt
code += struct.pack('<i', GOT_LOGPRINT - (RC_L + lit1_off))       # lit3 got
code += struct.pack('<i', RC_STATE_OBJ - (RC_L + lit1_off))       # lit4 상태객체
code += struct.pack('<i', V7_RESCHAIN)                            # lit5 V7
while len(code) < 0x58:
    code += b'\x00'
loggers[RC_ADDR] = (RC_L, code)
print(f'resChain 로거 @0x{RC_L:05x}, 상태객체 0x{RC_STATE_OBJ:05x}, V7=0x{V7_RESCHAIN:08x}')

# --- 3. 기록 ---
for addr, (L, code) in loggers.items():
    orig = bytes(data[L:L+4])
    z = b'\x00' * 4
    print(f'로거 0x{L:05x}: 원본 {orig.hex()} → {"제로OK" if orig == z else "⚠️제로아님!"}')
    data[L:L+len(code)] = code
data[MSG_TAG:MSG_TAG+len('HERMES_DBG')+1] = b'HERMES_DBG\x00'
for addr, msg, _, _, _, _, _ in TARGETS:
    b = (msg + '\x00').encode('ascii')
    data[msg_addrs[addr]:msg_addrs[addr]+len(b)] = b
b = b'st:%d\x00'
data[MT_FMT_ADDR:MT_FMT_ADDR+len(b)] = b
b = b'rcst:%d\x00'
data[RC_FMT_ADDR:RC_FMT_ADDR+len(b)] = b
b = b'obj:%x\x00'
data[OBJ_FMT_ADDR:OBJ_FMT_ADDR+len(b)] = b

# --- 4. 함수 첫 4B 패치 ---
for addr, (L, _) in loggers.items():
    patch = enc_b_t2(addr, L)
    print(f'패치 0x{addr:05x} → 0x{L:05x}: {bytes(data[addr:addr+4]).hex()} -> {patch.hex()}')
    data[addr:addr+4] = patch

# --- 4b. Cycle F: MC_knlSetTimer(0x6828) 0x6840 beq 0x68d2 → nop ---
# [obj+0x14]==1(이미 무장)이면 0x68d2에서 -5("already working") 리턴 → 재예약 거부
# → POSIX 원샷 타이머 만료 후 재장전 없음 → 이벤트 300 중단 → mainTimer 1회 후 정지(데드락)
# nop 처리로 무장 상태여도 무조건 재예약하도록 강제
orig_nop = bytes(data[0x6840:0x6842])
data[0x6840:0x6842] = b'\x00\xbf'
print(f'패치 0x06840: {orig_nop.hex()} -> 00bf (MC_knlSetTimer 재예약 강제)')

# --- 4c. Cycle F: resChain(0x4b658) 상태 무시 — 0x4b67c~0x4b68e → b.w 0x4b690 ---
# 상태값 [obj+4]가 가비지(0xE95D0B19)라 디스패치(0x24~0x3c)에 못 미침 → 상태 0x24 핸들러(리소스 로드)로 강제
orig_disp = bytes(data[0x4b67c:0x4b690])
data[0x4b67c:0x4b680] = enc_b_t2(0x4b67c, 0x4b690)
for a in range(0x4b680, 0x4b690, 2):
    data[a:a+2] = b'\x00\xbf'
print(f'패치 0x4b67c: resChain 강제 디스패치 (→0x4b690 리소스 로드), 원본 {orig_disp.hex()}')

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
