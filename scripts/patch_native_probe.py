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
    (0x5f320, 'creatImg sl:%x',       0x465F, 0xB5F0, 0x7339c, True,  True),
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
IDIV_FMT_ADDR = str_off        # [0x1BBA8C] (__aeabi_idiv GOT) 값 로그용 "idiv:%x"
str_off += len('idiv:%x') + 1
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

# --- 2b. mainTimer(0xbd28) 로거 — 상태값 실측 + 슬롯 3개 복구 + r7 설정 (제로 블록 0x746c4) ---
# Cycle H 최종: [0x1bbaf0](상태객체)·[0x1bbab0](0x27A7C0)·[0x1bbaac](카나리 ptr, addend 0=B)
# 런타임 오염 → 매 틱 복구. [0xbeb8]은 .rodata 읽기 전용(복구 불가) → 로거가 직접
# r7 = 0x1afbd4 설정 후 0xbd2c로 복귀(0xbd2a는 0xbd28의 b.w 4B 중간 halfword — 점프 금지).
# pop.w {r0-r3, r5-r7, lr}: r4(리터럴 베이스) 유지 + r7 원래값 복원.
# [obj+4]=0x24은 0x606E (str r6,[r5,#4]; 0x612E=#0x10, 0x60CE/0x60DE=Rn 오류 — 모두 버그!)
MT_ADDR = 0xbd28
MT_L = 0x746c4
MT_FMT = MT_FMT_ADDR        # 문자열 "st:%d"
STATE_OBJ = 0x23ccb0        # 상태 객체 addend (mTimer 0x23ccf8 근처)
STATE_SLOT1 = 0x1bbaf0      # 슬롯1: 상태 객체 ptr — 매 틱 복구
STATE_SLOT2 = 0x1bbab0      # 슬롯2: 0x27A7C0 객체 ptr (mainTimer 0xbd32가 읽음) — 복구
STATE_VAL2 = 0x27a7c0       # 슬롯2 복구값
CANARY_SLOT = 0x1bbaac      # 슬롯3: PLAY::draw 카나리 포인터 (addend 0 → B) — 복구
OBJ4_SLOT = 0x1bbb10        # 슬롯4: PLAY::draw r5 소스 (0x4b6a0) — 가상함수 객체 ptr — 복구
OBJ4_VAL = 0x2490e0         # 슬롯4 복구값 (.bss 객체, addend)
R7_BASE_VAL = 0x1afbd4      # 0xbd30: add r7, pc용 r7 값 (0x1afbd4 + pc = 0x1bb908)
MT_LIT = 0x98               # 리터럴 풀 위치 (코드 0x98까지: b.w@0x94 4B → lit1_off=0x98)
code = bytearray()
code += struct.pack('<HH', 0xE92D, 0x40FF)      # 0x00 push.w {r0-r7, lr} — r7 보존!
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
code += struct.pack('<HH', 0xF8D4, 0x6010)      # 0x24 ldr.w r6, [r4, #16] = 슬롯1 오프셋
code += enc_add_reg(6, 6, 4)                    # 0x28 r6 = B+0x1bbaf0
code += struct.pack('<H', 0x6035)               # 0x2A str r5, [r6] — [0x1bbaf0] 복구!
code += struct.pack('<HH', 0xF8D4, 0x6014)      # 0x2C ldr.w r6, [r4, #20] = 슬롯2 오프셋
code += enc_add_reg(6, 6, 4)                    # 0x30 r6 = B+0x1bbab0
code += struct.pack('<HH', 0xF8D4, 0x7018)      # 0x32 ldr.w r7, [r4, #24] = 값2 오프셋
code += enc_add_reg(7, 7, 4)                    # 0x36 r7 = B+0x27a7c0
code += struct.pack('<H', 0x6037)               # 0x38 str r7, [r6] — [0x1bbab0] 복구!
code += struct.pack('<HH', 0xF8D4, 0x6020)      # 0x3A ldr.w r6, [r4, #32] = 슬롯3 오프셋
code += enc_add_reg(6, 6, 4)                    # 0x3E r6 = B+0x1bbaac
code += struct.pack('<HH', 0xF8D4, 0x7024)      # 0x40 ldr.w r7, [r4, #36] = lit10 (-lit_vaddr)
code += enc_add_reg(7, 7, 4)                    # 0x44 r7 = B (base!)
code += struct.pack('<H', 0x6037)               # 0x46 str r7, [r6] — [0x1bbaac] = B 복구!
code += struct.pack('<HH', 0xF8D4, 0x6028)      # 0x48 ldr.w r6, [r4, #40] = 슬롯4 오프셋
code += enc_add_reg(6, 6, 4)                    # 0x4C r6 = B+0x1bbb10
code += struct.pack('<HH', 0xF8D4, 0x702C)      # 0x4E ldr.w r7, [r4, #44] = 값4 오프셋
code += enc_add_reg(7, 7, 4)                    # 0x52 r7 = B+0x2490e0
code += struct.pack('<H', 0x6037)               # 0x54 str r7, [r6] — [0x1bbb10] 복구!
code += struct.pack('<H', 0x2601)               # 0x56 movs r6, #1
code += struct.pack('<H', 0x602E)               # 0x58 str r6, [r5] — [obj+0]=1 (게임 상태)
code += struct.pack('<H', 0x2625)               # 0x5A movs r6, #0x25 — 상태를 36(리소스로드) → 37로 (실험)
code += struct.pack('<H', 0x606E)               # 0x5C str r6, [r5, #4] — [obj+4]=0x24 (0x606E!)
code += struct.pack('<HH', 0xF8D5, 0x5000)      # 0x5E ldr.w r5, [r5] — 상태값
code += struct.pack('<H', 0x462B)               # 0x62 mov r3, r5 — 값 전달
code += struct.pack('<H', 0x47E0)               # 0x64 blx r12 (st:%d 로그)
# [0x1BBA8C] (__aeabi_idiv GOT) 값 로그 — 오염 실측 (r12=__android_log_print 유지)
code += struct.pack('<HH', 0xF8D4, 0x6030)      # 0x66 ldr.w r6, [r4, #48] = lit13 (0x1BBA8C)
code += enc_add_reg(6, 6, 4)                    # 0x6A r6 = B+0x1BBA8C
code += struct.pack('<H', 0x683E)               # 0x6C ldr r7, [r6] — [0x1BBA8C] 값 (vararg)
code += struct.pack('<HH', 0xF8D4, 0x2034)      # 0x6E ldr.w r2, [r4, #52] = lit14 (idiv fmt)
code += enc_add_reg(2, 2, 4)                    # 0x72 r2 = fmt 주소
code += struct.pack('<H', 0x2004)               # 0x74 movs r0, #4 (prio)
code += struct.pack('<HH', 0xF8D4, 0x1000)      # 0x76 ldr.w r1, [r4] = tag
code += enc_add_reg(1, 1, 4)                    # 0x7A r1 = tag 주소
code += struct.pack('<H', 0x463B)               # 0x7C mov r3, r7 — 값
# r12 재로드 (blx r12 이후 caller-saved r12 소실 — liblog가 ip를 덮어씀)
code += struct.pack('<HH', 0xF8D4, 0x3008)      # 0x7E ldr.w r3, [r4, #8] = lit3 (got)
code += enc_add_reg(3, 3, 4)                    # 0x82 r3 = GOT_LOGPRINT 주소
code += struct.pack('<HH', 0xF8D3, 0xC000)      # 0x84 ldr.w r12, [r3] = __android_log_print
code += struct.pack('<H', 0x47E0)               # 0x88 blx r12 (idiv:%x 로그)
code += struct.pack('<HH', 0xE8BD, 0x40EF)      # 0x8A pop.w {r0-r3, r5-r7, lr} — r4(리터럴 베이스) 유지!
code += struct.pack('<H', 0xB5F0)               # 0x8E push {r4-r7, lr} — 원래 r7이 스택에!
code += struct.pack('<HH', 0xF8D4, 0x701C)      # 0x90 ldr.w r7, [r4, #28] = lit8 (0x1afbd4 절대)
code += enc_b_t2(MT_L + 0x94, MT_ADDR + 4)      # 0x94 b.w 0xbd2c (ldr r7 스킵 — r7 이미 설정!)
while (MT_L + len(code)) % 4 != 0:
    code += b'\x00'
lit1_off = len(code)
code += struct.pack('<i', MSG_TAG - (MT_L + lit1_off))            # lit1 tag
code += struct.pack('<i', MT_FMT - (MT_L + lit1_off))             # lit2 fmt
code += struct.pack('<i', GOT_LOGPRINT - (MT_L + lit1_off))       # lit3 got
code += struct.pack('<i', STATE_OBJ - (MT_L + lit1_off))          # lit4 상태객체
code += struct.pack('<i', STATE_SLOT1 - (MT_L + lit1_off))        # lit5 슬롯1
code += struct.pack('<i', STATE_SLOT2 - (MT_L + lit1_off))        # lit6 슬롯2
code += struct.pack('<i', STATE_VAL2 - (MT_L + lit1_off))         # lit7 값2
code += struct.pack('<i', R7_BASE_VAL)                            # lit8 r7값 (절대, add 없음)
code += struct.pack('<i', CANARY_SLOT - (MT_L + lit1_off))        # lit9 슬롯3 주소
code += struct.pack('<i', -(MT_L + lit1_off))                     # lit10 B 계산용 (-lit_vaddr)
code += struct.pack('<i', OBJ4_SLOT - (MT_L + lit1_off))          # lit11 슬롯4 주소
code += struct.pack('<i', OBJ4_VAL - (MT_L + lit1_off))           # lit12 값4
code += struct.pack('<i', 0x1BBA8C - (MT_L + lit1_off))           # lit13 __aeabi_idiv GOT
code += struct.pack('<i', IDIV_FMT_ADDR - (MT_L + lit1_off))      # lit14 idiv fmt
while len(code) < 0xB4:
    code += b'\x00'
loggers[MT_ADDR] = (MT_L, code)
print(f'mainTimer 로거 @0x{MT_L:05x}: 슬롯1 0x{STATE_SLOT1:05x}=0x{STATE_OBJ:05x}, 슬롯2 0x{STATE_SLOT2:05x}=0x{STATE_VAL2:05x}, 카나리 0x{CANARY_SLOT:05x}=B, 객체4 0x{OBJ4_SLOT:05x}=0x{OBJ4_VAL:05x}')

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
code += enc_b_t2(RC_L + 0x3E, RC_ADDR + 2)      # 0x3E b.w 0x4b65a (실제 위치: push(2B) 후 0x3E)
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
b = b'idiv:%x\x00'
data[IDIV_FMT_ADDR:IDIV_FMT_ADDR+len(b)] = b

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

# --- 4d. Cycle H: PLAY::draw(0x4b658) 크래시 우회 — 0x4b79a~0x4b7a0 → b.w 0x4b6dc ---
# 0x51560(리소스 로드)이 r4=[객체]값 불일치로 -1 리턴 → 0x4b6b8 → 0x4b79a 경로
# r2 = r8 (오염: base+0x71648) → ldr r3,[r7,r2] SEGV (fault 0x8920cf50)
# → 상태 슬롯 재접근을 생략하고 곧장 0x4b6dc(상태 검사 → 정상 종료)로 점프
orig_crash = bytes(data[0x4b79a:0x4b7a2])
data[0x4b79a:0x4b79e] = enc_b_t2(0x4b79a, 0x4b6dc)
data[0x4b79e:0x4b7a2] = b'\x00\xbf\x00\xbf'
print(f'패치 0x4b79a: PLAY::draw 크래시 경로 우회 (→0x4b6dc), 원본 {orig_crash.hex()}')

# --- 4e. Cycle H: 카나리 검사 무력화 — 0x4b6f8: b 0x4b9c0 (stack_chk_fail) → nop ---
# 가상 함수 호출(0x2660/0x2960)이 .got([0x1bbaac] 포함)를 오염 → PLAY::draw 실행 중
# 카나리 포인터 재오염 → 카나리 불일치. 0x4b6f4 cmp/beq 후 b를 nop로 우회 (0x4b6fa 정상 종료)
orig_canary = bytes(data[0x4b6f8:0x4b6fa])
data[0x4b6f8:0x4b6fa] = b'\x00\xbf'
print(f'패치 0x4b6f8: 카나리 검사 우회 (→정상 종료), 원본 {orig_canary.hex()}')

# --- 4f. Cycle H: 가상 함수 호출 스킵 — 0x4b696 bl 0x5ddf4 (4B) → nop, 0x4b6a6 blx 0x2960 (2B) → nop ---
# 0x5ddf4(이미지 크기+0x2660 가상호출)·0x2960(객체 메서드)이 r5=[B+0x1bbb10] 오염값으로
# .rodata 문자열을 함수로 호출해 SIGBUS. 두 호출 스킵 → .rodata 오염·크래시 차단
orig_5ddf4 = bytes(data[0x4b696:0x4b69a])
data[0x4b696:0x4b69a] = b'\x00\xbf\x00\xbf'
orig_2960 = bytes(data[0x4b6a6:0x4b6a8])
data[0x4b6a6:0x4b6a8] = b'\x00\xbf'
print(f'패치 0x4b696: bl 0x5ddf4 스킵 (nop), 원본 {orig_5ddf4.hex()}')
print(f'패치 0x4b6a6: blx 0x2960 스킵 (nop), 원본 {orig_2960.hex()}')

# --- 4g. ARM 스텁 테이블(0x2618~0x2a80)은 실제 import 함수 호출 스텁 → 원복 유지 ---
# ★★★ 0x2600~0x2a80 영역은 Thumb이 아니라 ARM 상태 코드 ★★★
#   각 스텁: add ip, pc, #0x100000 / add ip, ip, #0xb9000 / ldr pc, [ip, #imm]!
#   GOT 슬롯 예: [0x1BB934]=SkBitmap::unlockPixels, [0x1BB964]=timer_delete,
#   0x26f0=malloc 계열 — 필수 함수 호출이므로 절대 무력화 금지!
#   (이전 시도: 95개 mov pc, lr → malloc 미실행 → BH_eventq_init 0x633c 크래시)
#   → 기본적으로 이 영역은 패치하지 않는다.

# --- 4g-2. 0x70fe0 문자열 영역 → ARM bx lr 시퀀스 (오염된 GOT 점프 무해화) ---
# 이미지 로드 중 GOT 슬롯들([0x1BB934] 등)이 base+0x70fe0(.rodata 문자열)으로 오염
# → ARM 스텁이 ARM 상태로 0x70fe0 점프 → 미정의 ARM 명령(0x47704770) → SIGILL.
# ※ 0x2660/0x2960 스텁을 mov pc, lr로 바꾸면 이미지 로드 실패(imgret:-9) → 롤백함.
# → 0x70fe0~0x70ff0을 ARM 'bx lr'(0xE12FFF1E)로 채움: ARM 진입 시 lr(0x6DE89, Thumb
#   비트1)로 즉시 복귀해 정상 흐름 유지. ([JNI] javaCall_openURL은 로그용 — 손상 무해)
BX_LR_ARM = 0xE12FFF1E  # bx lr (ARM)
orig_70fe0 = bytes(data[0x70fe0:0x70ff0])
data[0x70fe0:0x70ff0] = struct.pack('<I', BX_LR_ARM) * 4
print(f'패치 0x70fe0~0x70ff0: ARM bx lr ×4, 원본 {orig_70fe0.hex()}')

# --- 4h-3. MC_grpSetContext(0x6de80) 무력화 — .rodata 테이블 오염 점프 차단 ---
# JIT(자바) → 0x6de80 → 0x6de84 bl 0x68ef4 → .rodata 테이블(0x1108B8)이 오염되어
# 스택 주소로 점프(mov pc, r3) → SEGV_ACCERR (pc=sp+0x58, 스택 실행).
# 이미지 로드와 무관하게 발생 (이미지 스킵 후에도 동일) → 테이블 오염의 다른 경로.
# → 0x6de80 진입점을 bx lr로 교체해 0x68ef4 실행 자체를 차단.
orig_6de80 = bytes(data[0x6de80:0x6de82])
data[0x6de80:0x6de82] = b'\x70\x47'  # bx lr
print(f'패치 0x6de80: MC_grpSetContext 무력화 (bx lr), 원본 {orig_6de80.hex()}')

# --- 4h-5. __aeabi_idiv GOT [0x1BBA8C] — 오염 검증 실험 ---
# [0x1BBA8C] = base+0x1BB998 (GOT 엔트리 주소)로 오염됨 (idiv:%x 로그 실측).
# 이미지 로드가 원인인지 확인: img_slot_dispatch 상태 강제(로드 스킵) 실험.
orig_5de5c = bytes(data[0x5de5c:0x5de5e])
data[0x5de5c:0x5de5e] = b'\x01\x23'  # movs r3, #1 (슬롯 상태 강제 → creatImg 스킵)
print(f'패치 0x5de5c: 이미지 로드 스킵 (movs r3,#1), 원본 {orig_5de5c.hex()}')

# --- 4i. PLAY::draw 호출부 스킵 — blx 0x2660/0x2960, bl 0x5ddf4 ---
orig_4bd2 = bytes(data[0x4b6d2:0x4b6d4])
data[0x4b6d2:0x4b6d4] = b'\x00\xbf'  # blx 0x2660 → nop
orig_2960_2 = bytes(data[0x4b6a6:0x4b6a8])
data[0x4b6a6:0x4b6a8] = b'\x00\xbf'  # blx 0x2960 → nop
orig_5ddf4_2 = bytes(data[0x4b696:0x4b69a])
data[0x4b696:0x4b69a] = b'\x00\xbf\x00\xbf'  # bl 0x5ddf4 → nop
print(f'패치 0x4b6d2: blx 0x2660 스킵 (nop), 원본 {orig_4bd2.hex()}')
print(f'패치 0x4b6a6: blx 0x2960 스킵 (nop), 원본 {orig_2960_2.hex()}')
print(f'패치 0x4b696: bl 0x5ddf4 스킵 (nop), 원본 {orig_5ddf4_2.hex()}')

# --- 4i-2. creatImg(0x5f320) 내부 blx 0x2660 2곳 nop (SkBitmap::unlockPixels 스킵) ---
# 이미지 로드 중 GOT [0x1BB934]이 오염되면 0x70fe0(문자열)으로 점프 → SIGBUS.
# 0x5f4be (로드 성공 후), 0x5f52a (상태1 스킵 경로) — unlockPixels 호출을 스킵.
for a in [0x5f4be, 0x5f52a]:
    orig = bytes(data[a:a+4])
    data[a:a+4] = b'\x00\xbf\x00\xbf'
    print(f'패치 0x5f4be/0x5f52a: blx 0x2660 스킵 (nop)')

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
