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
    imm10 = (imm32 >> 12) & 0x3FF   # 기존 유지 (앞으로 점프 검증됨! 뒤로 점프는 ldr.w pc 사용!)
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
CI15_FMT = str_off             # 케이스 14 진입: r0-r3 + [sp+0x34] + [sp+0x48] 실측!
str_off += len('ci15:r0=%x r1=%x r2=%x r3=%x v34=%x v48=%x') + 1
while str_off % 4 != 0:
    str_off += 1
print('문자열: tag=0x%05x, end=0x%05x, mt_fmt=0x%05x, rc_fmt=0x%05x, obj_fmt=0x%05x, ci15=0x%05x' % (MSG_TAG, str_off, MT_FMT_ADDR, RC_FMT_ADDR, OBJ_FMT_ADDR, CI15_FMT))

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
# --- 4h-3. MC_grpSetContext(0x6de80) — [ci15] 원복!
# 과거: .rodata 테이블(0x1108B8) 오염으로 0x68ef4 점프 크래시 → bx lr 무력화.
# ci14에서 0x2a88 원복+제로 영역 보존으로 초기화가 거의 완전히 진행(이미지 로드 성공).
# 이제 0x68ef4(점프테이블)가 정상 동작할 수 있으므로 원본 복원으로 드로잉 정상화 시도.
# [ci15] 4h-3 제거 — 0x6de80 원본(push {lr}; sub sp,#4; bl 0x68ef4; ...) 유지

# --- 4h-5. (Cycle I 실험 격리: 이미지 로드 스킵 복원 — idiv 루틴 검증 기준선) ---
# 0x5de5c: img_slot_dispatch 상태 강제 → creatImg 스킵 (이미지 로드 경로 격리)
orig_5de5c = bytes(data[0x5de5c:0x5de5e])
data[0x5de5c:0x5de5e] = b'\x01\x23'  # movs r3, #1 (슬롯 상태 강제 → creatImg 스킵)
print(f'패치 0x5de5c: 이미지 로드 스킵 (movs r3,#1), 원본 {orig_5de5c.hex()}')

# --- 4h-6. [ci16] MC_grpSetContext(0x6de80)/디스패처(0x68ef4) 진입 계측 ---
def enc_bl2(addr, target):
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
    h2 = 0xD000 | (J1 << 13) | (1 << 12) | (J2 << 11) | imm11
    return struct.pack('<HH', h1, h2)
# ci15 크래시: 0x6de80 진입 시 lr = 0xc0c7f150(스택+0x58) → JIT가 "리턴 슬롯(lr=sp+0x58)"
# 방식으로 호출했는데 함수가 pop {pc}(bl 규약)로 리턴 → 스택 주소로 점프 → SEGV_ACCERR.
# r10=0x83bc25e9(달빅), r4~r8=메소드 시그니처(0x71xxx) = JIT 네이티브 브리지 경유 증거.
# → 0x6de80 진입 시 lr/r0/r1/r2 로그 + 0x68ef4 진입 시 r1(인덱스)/r2/r3 로그로 검증.
MCG_L = 0x74eb8   # 0x6de80 로거 (제로 블록)
DIS_L = 0x74f10   # 0x68ef4 로거 (제로 블록)
MCG_FMT = 0x74aa0 # "mcg:%x %x %x %x"
DIS_FMT = 0x74ab0 # "dis:%x %x %x %x"
assert bytes(data[MCG_L:MCG_L+0x10]) == b'\x00' * 0x10, 'MCG_L 제로 아님!'
assert bytes(data[DIS_L:DIS_L+0x10]) == b'\x00' * 0x10, 'DIS_L 제로 아님!'
# 로거1: 0x6de80 진입 (push.w {r0-r3,r4,lr} 후 lr=[sp+20] → vararg1, [sp+0..8]=r0/r1/r2 그대로 vararg2..4)
code = bytearray()
code += struct.pack('<HH', 0xE92D, 0x401F)      # 0x00 push.w {r0-r3, r4, lr}
code += struct.pack('<H', 0x2004)               # 0x04 movs r0, #4
pc_adr = (MCG_L + 0x0A) & ~3
imm8 = (MCG_L + 0x44 - pc_adr) // 4
assert 0 <= imm8 <= 255
code += struct.pack('<H', 0xA400 | imm8)        # 0x06 adr r4, lit
code += struct.pack('<HH', 0xF8D4, 0x1000)      # 0x08 ldr.w r1, [r4] = tag
code += enc_add_reg(1, 1, 4)
code += struct.pack('<HH', 0xF8D4, 0x2004)      # 0x0E ldr.w r2, [r4,#4] = fmt
code += enc_add_reg(2, 2, 4)
code += struct.pack('<HH', 0xF8D4, 0x3008)      # 0x14 ldr.w r3, [r4,#8] = got
code += enc_add_reg(3, 3, 4)
code += struct.pack('<HH', 0xF8D3, 0xC000)      # 0x1A ldr.w r12, [r3] = __android_log_print
code += struct.pack('<HH', 0xF8DD, 0x3014)      # 0x1E ldr.w r3, [sp,#20] = lr (vararg1)
code += struct.pack('<H', 0x47E0)               # 0x22 blx r12
code += struct.pack('<HH', 0xE8BD, 0x401F)      # 0x24 pop.w {r0-r3, r4, lr}
code += struct.pack('<H', 0xB500)               # 0x28 push {lr} (원본 프롤로그)
code += struct.pack('<H', 0xB081)               # 0x2A sub sp, #4 (원본 프롤로그)
# ★ 2026-08-24 조건부 리턴으로 교체 (ART JIT "리턴 슬롯" 호출 대응):
#   원본 pop {pc}는 lr=리턴슬롯(짝수,스택주소)이면 NX! → bl 0x68ef4 재현 후
#   r3=저장된 lr 검사: 홀수(blx)→bx lr / 짝수(리턴슬롯)→ldr pc,[lr]
bl_dis = enc_bl2(MCG_L + 0x2C, 0x68ef4)
code += bl_dis                                  # 0x2C bl 0x68ef4 (원본 0x6de84 재현!)
code += struct.pack('<H', 0xB001)               # 0x30 add sp, #4 (원본 0x6de88)
code += struct.pack('<H', 0x9B00)               # 0x32 ldr r3, [sp] = 저장된 ART lr
code += struct.pack('<H', 0xB001)               # 0x34 add sp, #4 (sp 정리)
code += struct.pack('<H', 0x2201)               # 0x36 movs r2, #1
code += struct.pack('<H', 0x421A)               # 0x38 tst r3, r2 (lr&1!)
code += struct.pack('<H', 0xD101)               # 0x3A bne +2 → 0x40 (bx r3)
code += enc_b_t2(MCG_L + 0x3C, 0x758f8)        # 0x3C b.w 0x758f8 (짝수 = 리턴슬롯 로그 스텁!)
code += struct.pack('<H', 0x4718)               # 0x40 bx r3 (홀수 = blx 정상 복귀!)
while (MCG_L + len(code)) % 4 != 0:
    code += b'\x00'
lit1_off = len(code)
code += struct.pack('<i', MSG_TAG - (MCG_L + lit1_off))       # tag
code += struct.pack('<i', MCG_FMT - (MCG_L + lit1_off))       # fmt
code += struct.pack('<i', GOT_LOGPRINT - (MCG_L + lit1_off))  # got
print(f'로거 0x6de80 → 0x{MCG_L:05x}: lr/r0/r1/r2 로그 (MCG_FMT=0x{MCG_FMT:05x})')
# 로거2: 0x68ef4 진입 — r3(0x878)/r0/r1 로그 (테이블 복구 제거: .rodata 쓰기 불가 실측!)
# ci24 실측: .rodata(0x1108c8) 쓰기 → SEGV_ACCERR. 테이블 복구 불가.
# → 0x68f08의 ldr r3,[r3,r2]을 b.w 우회 루틴(0x74f80)으로 교체해 테이블 오염 무력화.
code2 = bytearray()
code2 += struct.pack('<HH', 0xE92D, 0x401F)     # 0x00 push.w {r0-r3, r4, lr}
code2 += struct.pack('<H', 0x2004)              # 0x04 movs r0, #4
pc_adr = (DIS_L + 0x0A) & ~3
imm8 = (DIS_L + 0x38 - pc_adr) // 4   # 리터럴 @0x38 (코드 0x36 + 정렬!)
assert 0 <= imm8 <= 255
code2 += struct.pack('<H', 0xA400 | imm8)       # 0x06 adr r4, lit (r4 = base+DIS_L+0x38)
code2 += struct.pack('<HH', 0xF8D4, 0x1000)     # 0x08 ldr.w r1, [r4] = tag
code2 += enc_add_reg(1, 1, 4)
code2 += struct.pack('<HH', 0xF8D4, 0x2004)     # 0x0E ldr.w r2, [r4,#4] = fmt
code2 += enc_add_reg(2, 2, 4)
code2 += struct.pack('<HH', 0xF8D4, 0x3008)     # 0x14 ldr.w r3, [r4,#8] = got
code2 += enc_add_reg(3, 3, 4)
code2 += struct.pack('<HH', 0xF8D3, 0xC000)     # 0x1A ldr.w r12, [r3] = __android_log_print
code2 += struct.pack('<HH', 0xF8DD, 0x300C)     # 0x1E ldr.w r3, [sp,#12] = 원래 r3 (vararg1)
code2 += struct.pack('<H', 0x47E0)              # 0x22 blx r12
code2 += struct.pack('<HH', 0xE8BD, 0x401F)     # 0x24 pop.w {r0-r3, r4, lr}
code2 += struct.pack('<H', 0xB570)              # 0x28 push {r4,r5,r6,lr} (원본 프롤로그)
# 0x2A movw r4, #0x2a08 / 0x2E movt r4, #0x0015 — 원본 0x68ef6의 ldr r4,[pc,#0xe4]
# (PC-relative는 로거 위치에서 엉뚱한 주소를 읽으므로 절대값 로드로 대체)
code2 += struct.pack('<HH', 0xF642, 0x2408)     # 0x2A movw r4, #0x2a08
code2 += struct.pack('<HH', 0xF2C0, 0x0415)     # 0x2E movt r4, #0x0015 → r4 = 0x00152a08
code2 += enc_b_t2(DIS_L + 0x32, 0x68ef8)        # 0x32 b.w 0x68ef8 (adds r6 — 0x68ef4~0x68ef7은 b.w로 덮임!)
while (DIS_L + len(code2)) % 4 != 0:
    code2 += b'\x00'
lit1_off2 = len(code2)
code2 += struct.pack('<i', MSG_TAG - (DIS_L + lit1_off2))      # lit0 tag
code2 += struct.pack('<i', DIS_FMT - (DIS_L + lit1_off2))      # lit1 fmt
code2 += struct.pack('<i', GOT_LOGPRINT - (DIS_L + lit1_off2)) # lit2 got
print(f'로거 0x68ef4 → 0x{DIS_L:05x}: r3/r0/r1 로그 (DIS_FMT=0x{DIS_FMT:05x})')
# 테이블 우회 루틴 @0x74f80: r3 = 0xfff586ce + r2 → mov pc,r3가 정상 타깃(base+0x68f86)으로!
TBL_BYPASS = 0x755ee   # 0x755ee~0x75618 제로 블록 (42B!) — 0x75400은 다른 로거가 사용!
assert bytes(data[TBL_BYPASS:TBL_BYPASS+0x10]) == b'\x00' * 0x10, 'TBL_BYPASS 제로 아님!'
tb = bytearray()
tb += struct.pack('<H', 0x008B)               # 0x00 lsls r3, r1, #2 (케이스 인덱스*4!)
tb += struct.pack('<HH', 0xF8D2, 0x3000)      # 0x02 ldr.w r3, [r2, r3] = 테이블[r1]
tb += struct.pack('<H', 0x2B00)               # 0x06 cmp r3, #0 (무효 케이스: 0/1/11 = 0)
tb += struct.pack('<H', 0xD002)               # 0x08 beq +4 → 0x10 (리턴 경로)
tb += struct.pack('<H', 0x189B)               # 0x0A adds r3, r3, r2 (base + 핸들러!)
tb += enc_b_t2(TBL_BYPASS + 0x0C, 0x68f0c)    # 0x0C b.w 0x68f0c (mov pc, r3)
tb += enc_b_t2(TBL_BYPASS + 0x10, 0x68f1a)    # 0x10 b.w 0x68f1a (pop {r4,r5,r6,pc} 정상 리턴!)
data[TBL_BYPASS:TBL_BYPASS+len(tb)] = tb
orig_68f08 = bytes(data[0x68f08:0x68f0c])
# ★ 2026-08-24 TBL_BYPASS 연결 제거 — 0x68ef4가 스텁(no-op)이 되어 0x68f08은 도달 불가, 원본 유지!
# data[0x68f08:0x68f0c] = enc_b_t2(0x68f08, TBL_BYPASS)
print(f'패치 0x68f08: {orig_68f08.hex()} → 원본 유지 (0x68ef4 스텁으로 도달 불가!)')
# 기록
orig_6de80 = bytes(data[0x6de80:0x6de84])
# ★ 2026-08-24 Cycle K: 0x6de80 → MG_STUB 직접 연결 (로그 없는 빌드!)
#   mcg 로거(0x74eb8)의 __android_log_print 호출이 sp를 어긋나게 해
#   리턴 슬롯(짝수 lr) 오인 크래시 유발 가설 검증. 로그 제거 시 크래시
#   해소 + 게임 진행 → 가설 확정. 진짜 리턴 슬롯이면 ldr.w pc,[r3]에서 크래시.
data[0x6de80:0x6de84] = enc_b_t2(0x6de80, 0x75608)  # MG_STUB (정의는 아래 — 하드코딩)
# ★ 2026-08-24 MG_setContext(0x68ef4) → 조건부 리턴 스텁 (no-op):
#   ART JIT가 setAlpha 호출 시 게임 상태 레지스터(r11=fp) 미설정(GOT 베이스 오염)
#   → MG_setContext 케이스 4 드로잉이 r5=0xff(알파)를 포인터로 오용 → SEGV fault 0xff
#   → 0x68ef4를 스텁으로: lr 홀수(bl)→bx lr / 짝수(리턴슬롯)→ldr pc,[lr] (그룹 설정 생략!)
MG_STUB = 0x75608   # 0x75602~0x75618 제로 (TBL_BYPASS 뒤 여유!)
assert bytes(data[MG_STUB:MG_STUB+0xC]) == b'\x00' * 0xC, 'MG_STUB 제로 아님!'
mgstub = bytearray()
mgstub += struct.pack('<H', 0x4673)               # mov r3, lr
mgstub += struct.pack('<H', 0x2201)               # movs r2, #1
mgstub += struct.pack('<H', 0x421A)               # tst r3, r2 (Thumb-1 TST는 레지스터 간!)
mgstub += struct.pack('<H', 0xD101)               # bne +2 → 0x75614 (bx r3)! ★ 0xD102는 +4 → 0x75616 패딩!
mgstub += struct.pack('<HH', 0xF8D3, 0xF000)      # ldr.w pc, [r3, #0] (리턴 슬롯!)
mgstub += struct.pack('<H', 0x4718)               # bx r3 (정상 bl 복귀!)
data[MG_STUB:MG_STUB+len(mgstub)] = mgstub
orig_68ef4 = bytes(data[0x68ef4:0x68ef8])
data[0x68ef4:0x68ef8] = enc_b_t2(0x68ef4, MG_STUB)
data[MCG_L:MCG_L+len(code)] = code
data[DIS_L:DIS_L+len(code2)] = code2
b = b'mcg:%x %x %x %x\x00'
data[MCG_FMT:MCG_FMT+len(b)] = b
b = b'dis:%x %x %x %x\x00'
data[DIS_FMT:DIS_FMT+len(b)] = b
print(f'패치 0x6de80: {orig_6de80.hex()} → b.w 0x{MCG_L:05x} (진입 계측)')
print(f'패치 0x68ef4: {orig_68ef4.hex()} → b.w 0x{MG_STUB:05x} (MG_setContext 스텁: no-op+조건부리턴!)')

# ★ 2026-08-24 리턴 슬롯 로그 스텁 (0x758f8): mcg 짝수 lr(ART JIT 리턴 슬롯) 분기!
#   [lr]/[lr+4]/[lr+8] 실측 → ART JIT 복귀 구조 파악 (dalvik-main space NX 크래시 원인!)
RTN_L = 0x758f8
RTN_FMT = 0x749a0  # "rtn:%x %x %x %x" (0x74998~0x749fc 제로 — 0x74a80은 imgret 로거가 사용!)
assert bytes(data[RTN_L:RTN_L+0x40]) == b'\x00' * 0x40, 'RTN_L 제로 아님!'
assert bytes(data[RTN_FMT:RTN_FMT+0x10]) == b'\x00' * 0x10, 'RTN_FMT 제로 아님!'
rtn = bytearray()
rtn += struct.pack('<HH', 0xE92D, 0x401F)        # 0x00 push.w {r0-r3, r4, lr} (r3 보존!)
rtn += struct.pack('<H', 0x2004)                 # 0x04 movs r0, #4
rtn += struct.pack('<H', 0xA400)                 # 0x06 adr r4, lit (imm8 임시 — 아래 재작성!)
rtn += struct.pack('<HH', 0xF8D4, 0x1000)        # 0x08 ldr.w r1, [r4] = tag
rtn += enc_add_reg(1, 1, 4)
rtn += struct.pack('<HH', 0xF8D4, 0x2004)        # 0x0E ldr.w r2, [r4,#4] = fmt
rtn += enc_add_reg(2, 2, 4)
rtn += struct.pack('<HH', 0xF8D4, 0x5008)        # 0x14 ldr.w r5, [r4,#8] = got
rtn += enc_add_reg(5, 5, 4)
rtn += struct.pack('<HH', 0xF8D5, 0xC000)        # 0x1A ldr.w r12, [r5] = __android_log_print
rtn += struct.pack('<HH', 0xF8D3, 0x5000)        # 0x1E ldr.w r5, [r3] = [lr]!
rtn += struct.pack('<HH', 0xF8D3, 0x6004)        # 0x22 ldr.w r6, [r3,#4] = [lr+4]!
rtn += struct.pack('<HH', 0xF8D3, 0x7008)        # 0x26 ldr.w r7, [r3,#8] = [lr+8]!
rtn += struct.pack('<HH', 0xF8D7, 0x7000)        # 0x2A ldr.w r7, [r7] = [[lr+8]]! (진짜 복귀 주소?)
rtn += struct.pack('<HH', 0xE92D, 0x00E0)        # 0x2E push.w {r5, r6, r7} (varargs!)
rtn += struct.pack('<H', 0x47E0)                 # 0x32 blx r12
rtn += struct.pack('<H', 0xB00C)                 # 0x34 add sp, #12
rtn += struct.pack('<HH', 0xE8BD, 0x401F)        # 0x36 pop.w {r0-r3, r4, lr} (r3 복원!)
rtn += struct.pack('<HH', 0xF8D3, 0xF000)        # 0x3A ldr.w pc, [r3] (기존 동작 — [lr] 점프!)
while (RTN_L + len(rtn)) % 4 != 0:
    rtn += b'\x00'
lit_off = len(rtn)
pc_adr = (RTN_L + 0x0A) & ~3                     # adr(0x06)의 PC = RTN_L+0x0A → Align(PC,4)!
imm8 = (RTN_L + lit_off - pc_adr) // 4           # 리터럴 @lit_off
assert 0 <= imm8 <= 255
rtn[0x06:0x08] = struct.pack('<H', 0xA400 | imm8)  # adr r4, lit 재작성!
rtn += struct.pack('<i', MSG_TAG - (RTN_L + lit_off))       # tag
rtn += struct.pack('<i', RTN_FMT - (RTN_L + lit_off))       # fmt
rtn += struct.pack('<i', GOT_LOGPRINT - (RTN_L + lit_off))  # got
data[RTN_L:RTN_L+len(rtn)] = rtn
b = b'rtn:%x %x %x %x\x00'
data[RTN_FMT:RTN_FMT+len(b)] = b
print(f'리턴슬롯 로그 스텁 @0x{RTN_L:05x} (RTN_FMT=0x{RTN_FMT:05x})')

# --- 4h-8. [ci35] setAlpha(0x5e130) 로거 + 조건부 리턴 (JIT "lr=리턴슬롯" 호출 대응!) ---
# ci34 실측: ret 로그 [sp+4]=0xc15a714d(정상 bl 리턴!), setAlpha pop {pc}가 [sp]=lr=sp+0x58
# (JIT 리턴 슬롯!) → NX! → setAlpha(0x5e130)를 로거로: 로그 + bl 0x6de80 + 조건부 리턴!
# lr&1: 홀수(bl!)→bx lr / 짝수(JIT!)→ldr pc,[lr]!
ALPHA_L = 0x750a0   # 0x74fd0은 원본 데이터! 0x750a0(제로) 사용
assert bytes(data[ALPHA_L:ALPHA_L+0x10]) == b'\x00' * 0x10, 'ALPHA_L 제로 아님!'
ALPHA_FMT = 0x74af0  # "alpha:%x %x"
code4 = bytearray()
code4 += struct.pack('<HH', 0xE92D, 0x401F)      # 0x00 push.w {r0-r3, r4, lr}
code4 += struct.pack('<H', 0x2004)               # 0x04 movs r0, #4
pc_adr = (ALPHA_L + 0x0A) & ~3
imm8 = (ALPHA_L + 0x4C - pc_adr) // 4   # 리터럴 @0x4C (코드 0x48까지: bne/bx/ldrpc + 정렬!)
assert 0 <= imm8 <= 255
code4 += struct.pack('<H', 0xA400 | imm8)        # 0x06 adr r4, lit
code4 += struct.pack('<HH', 0xF8D4, 0x1000)      # 0x08 ldr.w r1, [r4] = tag
code4 += enc_add_reg(1, 1, 4)
code4 += struct.pack('<HH', 0xF8D4, 0x2004)      # 0x0E ldr.w r2, [r4,#4] = fmt
code4 += enc_add_reg(2, 2, 4)
code4 += struct.pack('<HH', 0xF8D4, 0x3008)      # 0x14 ldr.w r3, [r4,#8] = got
code4 += enc_add_reg(3, 3, 4)
code4 += struct.pack('<HH', 0xF8D3, 0xC000)      # 0x1A ldr.w r12, [r3] = __android_log_print
code4 += struct.pack('<HH', 0xF8DD, 0x3014)      # 0x1E ldr.w r3, [sp,#20] = lr (vararg1!)
code4 += struct.pack('<HH', 0xF8DD, 0x4018)      # 0x22 ldr.w r4, [sp,#24] = 원래 [sp] (vararg2!) — r4는 push/pop 보존!
code4 += struct.pack('<HH', 0xF8CD, 0x4000)      # 0x26 str.w r4, [sp,#0] → vararg2
code4 += struct.pack('<H', 0x47E0)               # 0x2A blx r12
code4 += struct.pack('<HH', 0xE8BD, 0x401F)      # 0x2C pop.w {r0-r3, r4, lr}
code4 += struct.pack('<H', 0xB500)               # 0x30 push {lr} (원본 setAlpha!)
code4 += struct.pack('<H', 0xB081)               # 0x32 sub sp, #4 (원본!)
code4 += struct.pack('<HH', 0xF3F7, 0x7CFF)      # 0x34 bl 0x6de80 @ALPHA_L+0x34 (계산 필요!)
code4 += struct.pack('<H', 0xB001)               # 0x38 add sp, #4 (원본!)
code4 += struct.pack('<H', 0x9B00)               # 0x3A ldr r3, [sp] (조건부 리턴: r3 = lr!) — 0x9D00은 r5! 버그!
while (ALPHA_L + len(code4)) % 4 != 0:
    code4 += b'\x00'
# 조건부 리턴 마무리 (정렬 후 이어붙임)
code4 += struct.pack('<H', 0xB001)               # add sp, #4
code4 += struct.pack('<H', 0x2201)               # movs r2, #1
code4 += struct.pack('<H', 0x421A)               # tst r3, r2 (r3&1!)
code4 += struct.pack('<H', 0xD1FF)               # 0x44 bne #-2 → 0x750e6 (bx r3!) ★ 0xD100이면 0x750e6(리터럴!)로 가서 데이터 실행 크래시!
code4 += struct.pack('<H', 0x4718)               # 0x46 bx r3 (홀수 = bl 호출 → 0x5eccc 정상 복귀!)
code4 += struct.pack('<HH', 0xF8D3, 0xF000)     # 0x48 ldr.w pc, [r3, #0] (짝수 = JIT 리턴 슬롯!) ★ 0x6BE0은 ldr r0,[r4,#0x3c]로 디코딩되는 32비트!
while (ALPHA_L + len(code4)) % 4 != 0:
    code4 += b'\x00'
lit1_off4 = len(code4)
code4 += struct.pack('<i', MSG_TAG - (ALPHA_L + lit1_off4))       # tag
code4 += struct.pack('<i', ALPHA_FMT - (ALPHA_L + lit1_off4))     # fmt
code4 += struct.pack('<i', GOT_LOGPRINT - (ALPHA_L + lit1_off4))  # got
# bl 0x6de80 인코딩을 정확히 계산 (ALPHA_L+0x34 기준!)
def enc_bl(addr, target):
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
    h2 = 0xD000 | (J1 << 13) | (1 << 12) | (J2 << 11) | imm11
    return struct.pack('<HH', h1, h2)
bl6de80 = enc_bl(ALPHA_L + 0x34, 0x6de80)
# code4의 bl 자리 교체 (0x34 위치 = 코드 0x34~0x37)
code4[0x34:0x38] = bl6de80
# ★ 2026-08-24 ALPHA 로거 비활성화 (케이스14 수정 실험):
#   4h-7(POPRET 로거 @0x75060)의 리터럴(0x750a0~0x750ac)이 4h-8(ALPHA 로거 @0x750a0)을 덮음
#   → setAlpha→0x750a0 = 리터럴 → SIGILL. 4h-7이 나중에 실행되므로 ALPHA 로거는 항상 손상.
#   ALPHA 로거 기록을 막으면 setAlpha 원본 유지 + 0x750a0은 POPRET 리터럴로 안전.
# orig_5e130 = bytes(data[0x5e130:0x5e134])
# data[0x5e130:0x5e134] = enc_b_t2(0x5e130, ALPHA_L)
# data[ALPHA_L:ALPHA_L+len(code4)] = code4
# b = b'alpha:%x %x\x00'
# data[ALPHA_FMT:ALPHA_FMT+len(b)] = b
# print(f'패치 0x5e130: {orig_5e130.hex()} → b.w 0x{ALPHA_L:05x} (setAlpha 로거+조건부 리턴!)')
print('★ ALPHA 로거(4h-8) 비활성화 — setAlpha 원본 유지, 0x750a0은 POPRET 리터럴')

# --- 4h-9. [ci36] 0x5e1f2(ldr r4,[r4,r3]) 로거 — [base+0x1BBB70] GOT 슬롯 실측 ---
# ci36: ALPHA/ret r5 버그 수정 후 크래시가 libjpeg.so+0x2cfd0(데이터!)에서 발생.
# 0x5e1c8 함수: r4 = base+0x1BB908, r3 = 0x268 → ldr r4,[r4,r3] = [base+0x1BBB70]!
# 이 GOT 슬롯(R_ARM_RELATIVE, addend=0x47000031) 값이 관건!
E1F2_L = 0x7522c   # 0x75229~0x752d0 제로 블록 (4의 배수 0x7522c!)
assert bytes(data[E1F2_L:E1F2_L+0x10]) == b'\x00' * 0x10, 'E1F2_L 제로 아님!'
code5 = bytearray()
code5 += struct.pack('<HH', 0xE92D, 0x401F)      # 0x00 push.w {r0-r3, r4, lr}
code5 += struct.pack('<H', 0x2004)               # 0x04 movs r0, #4
pc_adr = (E1F2_L + 0x0A) & ~3
imm8 = (E1F2_L + 0x40 - pc_adr) // 4             # 리터럴 @0x40 (코드 0x3E + 정렬!)
assert 0 <= imm8 <= 255
code5 += struct.pack('<H', 0xA400 | imm8)        # 0x06 adr r4, lit
code5 += struct.pack('<HH', 0xF8D4, 0x1000)      # 0x08 ldr.w r1, [r4] = tag
code5 += enc_add_reg(1, 1, 4)
code5 += struct.pack('<HH', 0xF8D4, 0x2004)      # 0x0E ldr.w r2, [r4,#4] = fmt
code5 += enc_add_reg(2, 2, 4)
code5 += struct.pack('<HH', 0xF8D4, 0x3008)      # 0x14 ldr.w r3, [r4,#8] = got
code5 += enc_add_reg(3, 3, 4)
code5 += struct.pack('<HH', 0xF8D3, 0xC000)      # 0x1A ldr.w r12, [r3] = __android_log_print
code5 += struct.pack('<HH', 0xF8DD, 0x3010)      # 0x1E ldr.w r3, [sp,#16] = 원래 r4 (base+0x1BB908!)
code5 += struct.pack('<HH', 0xF8DD, 0x400C)      # 0x22 ldr.w r4, [sp,#12] = 원래 r3 (0x268!)
code5 += enc_add_reg(4, 4, 3)                    # 0x26 adds r4, r4, r3 = base+0x1BBB70!
code5 += struct.pack('<HH', 0xF8D4, 0xF000)     # 0x28 ldr.w r4, [r4, #0] = [base+0x1BBB70]!! 핵심! ★ 0x6C80은 ldr r0,[r0,#0x48]로 디코딩!
code5 += struct.pack('<HH', 0xF8DD, 0x3010)      # 0x2A ldr.w r3, [sp,#16] = vararg1 (원래 r4!)
code5 += struct.pack('<HH', 0xF8CD, 0x4000)      # 0x2E str.w r4, [sp,#0] = vararg2 (GOT 슬롯 값!)
code5 += struct.pack('<H', 0x47E0)               # 0x32 blx r12
code5 += struct.pack('<HH', 0xE8BD, 0x401F)      # 0x34 pop.w {r0-r3, r4, lr}
code5 += struct.pack('<H', 0x58E4)               # 0x38 ldr r4, [r4, r3] (원본 재현!)
while (E1F2_L + len(code5)) % 4 != 0:
    code5 += b'\x00'
code5 += enc_b_t2(E1F2_L + len(code5), 0x5e1f4)  # 0x3A b.w 0x5e1f4!
while (E1F2_L + len(code5)) % 4 != 0:
    code5 += b'\x00'
lit1_off5 = len(code5)                           # 리터럴 @0x40
E1F2_FMT = E1F2_L + len(code5) + 12              # FMT 문자열 @리터럴+12 (0x4C)
code5 += struct.pack('<i', MSG_TAG - (E1F2_L + lit1_off5))       # tag
code5 += struct.pack('<i', E1F2_FMT - (E1F2_L + lit1_off5))      # fmt (고정 오프셋!)
code5 += struct.pack('<i', GOT_LOGPRINT - (E1F2_L + lit1_off5))  # got
b = b'e1f2:%08x %08x\x00'
code5 += b
orig_5e1f2 = bytes(data[0x5e1f2:0x5e1f4])
data[0x5e1f2:0x5e1f6] = enc_b_t2(0x5e1f2, E1F2_L)  # ★ 4B 슬라이스! (2B면 bytearray가 늘어나 전 바이트 밀림!)
data[E1F2_L:E1F2_L+len(code5)] = code5
print(f'패치 0x5e1f2: {orig_5e1f2.hex()} → b.w 0x{E1F2_L:05x} ([base+0x1BBB70] GOT 실측!)')

# --- 4h-10. [ci36] 0x5e1f4/0x5e200 역참조 우회 — JIT 카피 실행 대응 ---
# ci36 실측: 0x5e1c8이 JIT 카피(0x561D0)에서 실행 → add r4,pc의 pc가 0x561D4 →
# r4 = 0x1B3908(정상 0x1BB908, 0x8000 차이) → [0x1B3B70] = 한글 문자열(0xb7b4b7aa) →
# 0x5e1f4 ldr r3,[r4,#8] = [0xb7b4b7b2] → SEGV! → 0x5e1f4/0x5e200을 movs r3,#0으로 우회.
orig_5e1f4 = bytes(data[0x5e1f4:0x5e1f6])
data[0x5e1f4:0x5e1f6] = struct.pack('<H', 0x0023)   # movs r3, #0 (ldr r3,[r4,#8] 우회!)
orig_5e200 = bytes(data[0x5e200:0x5e202])
data[0x5e200:0x5e202] = struct.pack('<H', 0x0023)   # movs r3, #0 (ldr r3,[r4,#0xc] 우회!)
print(f'패치 0x5e1f4: {orig_5e1f4.hex()} → 0023 (movs r3,#0) / 0x5e200: {orig_5e200.hex()} → 0023')

# --- 4h-7. [ci28~32] 0x6de88(add sp,#4)+0x6de8a(pop {pc}) 교체 — 리턴값 실측 ---
# ci32 실측: mcg(lr=0xc146a14d 정상!) → pret → dis → 0x68ef4 리턴(0x7508C) → b.w 0x6de88 →
# add sp,#4 → pop {pc}가 [sp]=0xc0dff150(스택+0x58!) → SEGV! [sp]값 로그 후 원래 pop {pc}!
POPRET_L = 0x75060   # 0x74fc0은 원본 데이터! 0x75060(제로) 사용
assert bytes(data[POPRET_L:POPRET_L+0x10]) == b'\x00' * 0x10, 'POPRET_L 제로 아님!'
POP_FMT = 0x74ae0  # "ret:%x %x"
code3 = bytearray()
code3 += struct.pack('<HH', 0xE92D, 0x401F)      # 0x00 push.w {r0-r3, r4, lr}
code3 += struct.pack('<H', 0x2004)               # 0x04 movs r0, #4
pc_adr = (POPRET_L + 0x0A) & ~3
imm8 = (POPRET_L + 0x40 - pc_adr) // 4   # 리터럴 @0x40 (조건부 리턴 코드 0x3C + 정렬!)
assert 0 <= imm8 <= 255
code3 += struct.pack('<H', 0xA400 | imm8)        # 0x06 adr r4, lit
code3 += struct.pack('<HH', 0xF8D4, 0x1000)      # 0x08 ldr.w r1, [r4] = tag
code3 += enc_add_reg(1, 1, 4)
code3 += struct.pack('<HH', 0xF8D4, 0x2004)      # 0x0E ldr.w r2, [r4,#4] = fmt
code3 += enc_add_reg(2, 2, 4)
code3 += struct.pack('<HH', 0xF8D4, 0x3008)      # 0x14 ldr.w r3, [r4,#8] = got
code3 += enc_add_reg(3, 3, 4)
code3 += struct.pack('<HH', 0xF8D3, 0xC000)      # 0x1A ldr.w r12, [r3] = __android_log_print
code3 += struct.pack('<HH', 0xF8DD, 0x3018)      # 0x1E ldr.w r3, [sp,#24] = 원래 [sp] = add 전 sp값! (vararg1)
code3 += struct.pack('<HH', 0xF8DD, 0x401C)      # 0x22 ldr.w r4, [sp,#28] = 원래 [sp+4] = pop {pc} 대상! (vararg2) — r4는 push/pop 보존!
code3 += struct.pack('<HH', 0xF8CD, 0x4000)      # 0x26 str.w r4, [sp,#0] → vararg2
code3 += struct.pack('<H', 0x47E0)               # 0x2A blx r12
code3 += struct.pack('<HH', 0xE8BD, 0x401F)      # 0x2C pop.w {r0-r3, r4, lr}
code3 += struct.pack('<H', 0xB001)               # 0x30 add sp, #4 (원본 0x6de88!)
code3 += struct.pack('<H', 0x9B00)               # 0x32 ldr r3, [sp] (원본 pop {pc} 대상! = JIT 리턴 슬롯일 수 있음!)
code3 += struct.pack('<H', 0x2201)               # 0x34 movs r2, #1
code3 += struct.pack('<H', 0x421A)               # 0x36 tst r3, r2 (r3&1!)
code3 += struct.pack('<H', 0xD1FF)               # 0x38 bne 0x3A (홀수 = 정상 bl 리턴!)
code3 += struct.pack('<H', 0x4718)               # 0x3A bx r3 (홀수 → 정상 복귀!)
code3 += struct.pack('<HH', 0xF8D3, 0xF000)     # 0x3C ldr.w pc, [r3, #0] (짝수 = JIT 리턴 슬롯! [슬롯]의 실제 주소로!)
while (POPRET_L + len(code3)) % 4 != 0:
    code3 += b'\x00'
lit1_off3 = len(code3)
code3 += struct.pack('<i', MSG_TAG - (POPRET_L + lit1_off3))       # tag
code3 += struct.pack('<i', POP_FMT - (POPRET_L + lit1_off3))       # fmt
code3 += struct.pack('<i', GOT_LOGPRINT - (POPRET_L + lit1_off3))  # got
orig_6de88 = bytes(data[0x6de88:0x6de8c])
# ★ 2026-08-24 POPRET 로거(4h-7) 비활성화: [sp]=r5저장값(.bss)을 복귀 주소로 오용 → NX 크래시.
#   0x6de88 시점 [sp]=old r5, [sp+4]=lr — ldr r3,[sp]는 복귀주소가 아님.
#   케이스14 실험에서는 계측 불필요 → 원본 유지(MC_grpSetContext 정상 복귀).
# data[0x6de88:0x6de8c] = enc_b_t2(0x6de88, POPRET_L)
# data[POPRET_L:POPRET_L+len(code3)] = code3
# b = b'ret:%x %x\x00'
# data[POP_FMT:POP_FMT+len(b)] = b
print('★ POPRET 로거(4h-7) 비활성화 — 0x6de88 원본 유지')
print(f'패치 0x6de88: {orig_6de88.hex()} → b.w 0x{POPRET_L:05x} ([sp]/[sp+4] 리턴값 실측!)')

# --- 5. Cycle I: __aeabi_idiv ARM 루틴 직접 구현 (0x74eb8) + 0x2a80 스텁 교체 ---
# [0x1BBA8C](__aeabi_idiv GOT)가 오염(게임 코드 쓰기). 0x2a80 스텁(blx 0x2a80 → ARM →
# ldr pc,[ip,#4]! → [0x1BBA8C])이 오염 주소를 실행 → 크래시 연쇄.
# → 0x2a88의 ldr pc를 ARM 'b 0x74eb8'로 교체해 GOT 경유를 우회.
#
# ★★ 주의 (ci7 실전): ARM b 타깃은 반드시 4바이트 정렬! 0x74b72(2 mod 4)는 오프셋
#   내림으로 0x74b70(2B 앞)에 점프 → 2바이트 밀린 ARM 실행 → SIGILL(0x74bb8).
# ★ 0x76700~0x76824 / 0x76C00~ / 0x74B72~0x74C40 = 게임의 함수 포인터 풀/실행 경로
#   (ci2~ci7 실전: 코드 삽입 시 게임이 그 주소를 참조/실행해 크래시). 사용 금지.
# ★★★ [ci14] 핵심 가설: 게임이 "런타임에 0x74bb8(제로 영역)에 자체 __aeabi_idiv 코드를
#   작성"하고 [0x1BBA8C] = base+0x74bb9(Thumb)로 설정해 호출한다! (ci7: [0x1BBA8C]=base+0x74bb9,
#   pc=base+0x74bb8 실측 — libgcc __aeabi_idiv가 런타임 생성됨!)
#   → 우리가 0x74b72~0x74c40을 코드로 덮어써서 생성과 충돌 → 크래시/멈춤.
#   → ci14: 0x74b72~0x74c40 제로 유지 + 0x2a88 원복(ldr pc,[ip,#4]!) → 게임의 런타임
#     생성을 방해하지 않고 관찰. (0x74eb8~0x74f04도 제로 복원)
# 0x2a88 원복: ldr pc,[ip,#4]! = E5BCF004
orig_2a88 = bytes(data[0x2a88:0x2a8c])
# 원본 복원 (빌드 스크립트가 원본에서 패치하므로, 여기서는 "패치 안 함" = 원본 유지)
print(f'패치 0x2a88: 원본 유지 (ldr pc,[ip,#4]! — 게임 런타임 생성 관찰)')

# 0x74eb8~0x74f04: 원래 제로 유지 (아무것도 안 씀)
# 0x2a88: 원본 유지 (ldr pc,[ip,#4]! — 게임의 [0x1BBA8C] 경유 허용 = 런타임 생성 관찰)
print('패치 5: [ci14] 0x74eb8/0x74f00/0x2a88 전부 원본 유지 (게임 런타임 __aeabi_idiv 생성 관찰)')

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

# --- 4j. [ci37] draw_MunjangStore 점프 테이블 (0x2dfd4 mov pc,r3) 실측 ---
# ci37: 0x2e0c8에서 SEGV (fault 0x415d3d50, r1=0x80000000) — 그런데 0x2e0c8은
# 리터럴 풀(데이터)! capstone은 0x2e0c8='ldrsh r0,[r1,r5]'(0x5f48)로 오해석.
# 진짜 원인 = 점프 테이블 0x2dfd4(mov pc,r3)가 리터럴 풀 주소로 점프.
# → 0x2dfd2(adds r3,r3,r2 + mov pc,r3)를 b.w로 덮고 로거에서 인덱스(r4)·
# 슬롯(r3)·베이스(r2) 실측. 로거 끝에서 원본 2개 재현 → mov pc,r3로 자연 점프.
JT_L = 0x753e0   # 0x753e0~0x75460 제로 블록
assert bytes(data[JT_L:JT_L+0x10]) == b'\x00' * 0x10, 'JT_L 제로 아님!'
code6 = bytearray()
code6 += struct.pack('<HH', 0xE92D, 0x401F)      # 0x00 push.w {r0-r3, r4, lr}
code6 += struct.pack('<H', 0x2004)               # 0x04 movs r0, #4
pc_adr = (JT_L + 0x0A) & ~3
imm8 = (JT_L + 0x3C - pc_adr) // 4               # 리터럴 @0x3C (코드 0x3A + 정렬!)
assert 0 <= imm8 <= 255
code6 += struct.pack('<H', 0xA400 | imm8)        # 0x06 adr r4, lit
code6 += struct.pack('<HH', 0xF8D4, 0x1000)      # 0x08 ldr.w r1, [r4] = tag
code6 += enc_add_reg(1, 1, 4)
code6 += struct.pack('<HH', 0xF8D4, 0x2004)      # 0x0E ldr.w r2, [r4,#4] = fmt
code6 += enc_add_reg(2, 2, 4)
code6 += struct.pack('<HH', 0xF8D4, 0x3008)      # 0x14 ldr.w r3, [r4,#8] = got
code6 += enc_add_reg(3, 3, 4)
code6 += struct.pack('<HH', 0xF8D3, 0xC000)      # 0x1A ldr.w r12, [r3] = __android_log_print
code6 += struct.pack('<HH', 0xF8DD, 0x300C)      # 0x1E ldr.w r3, [sp,#12] = 원래 r3 (슬롯 값) vararg1
code6 += struct.pack('<HH', 0xF8DD, 0x4010)      # 0x22 ldr.w r4, [sp,#16] = 원래 r4 (인덱스) vararg2
code6 += struct.pack('<HH', 0xF8CD, 0x4000)      # 0x26 str.w r4, [sp,#0] → vararg2
code6 += struct.pack('<HH', 0xF8DD, 0x4008)      # 0x2A ldr.w r4, [sp,#8] = 원래 r2 (베이스) vararg3
code6 += struct.pack('<HH', 0xF8CD, 0x4004)      # 0x2E str.w r4, [sp,#4] → vararg3
code6 += struct.pack('<H', 0x47E0)               # 0x32 blx r12
code6 += struct.pack('<HH', 0xE8BD, 0x401F)      # 0x34 pop.w {r0-r3, r4, lr}
code6 += struct.pack('<H', 0x189B)               # 0x38 원본 재현: adds r3, r3, r2
code6 += struct.pack('<H', 0x469F)               # 0x3A 원본 재현: mov pc, r3 (자연 점프!)
while (JT_L + len(code6)) % 4 != 0:
    code6 += b'\x00'
lit1_off6 = len(code6)                           # 리터럴 @0x3C
JT_FMT = JT_L + len(code6) + 12                  # FMT 문자열 @리터럴+12 (0x48)
code6 += struct.pack('<i', MSG_TAG - (JT_L + lit1_off6))       # tag
code6 += struct.pack('<i', JT_FMT - (JT_L + lit1_off6))        # fmt
code6 += struct.pack('<i', GOT_LOGPRINT - (JT_L + lit1_off6))  # got
orig_2dfd2 = bytes(data[0x2dfd2:0x2dfd6])
data[0x2dfd2:0x2dfd6] = enc_b_t2(0x2dfd2, JT_L)  # ★ 4B 슬라이스!
data[JT_L:JT_L+len(code6)] = code6
b = b'jt:%x %x %x\x00'
data[JT_FMT:JT_FMT+len(b)] = b
print(f'패치 0x2dfd2: {orig_2dfd2.hex()} → b.w 0x{JT_L:05x} (점프 테이블: 인덱스/슬롯/베이스 실측!)')

# --- 4k. [ci38] draw_MunjangStore 진입 로거 (0x2da30 프롤로그) ---
# ci37 재현: pc=0x2e0c8(리터럴 풀) 크래시, lr=0x760a5(문자열 주소!) — JT 로거(0x2dfd2)
# 미발동 = 점프 테이블 경로가 아님. draw_MunjangStore가 "진짜" 실행되는지,
# 호출자(lr)가 누군지 실측. 프롤로그 push {r4-r7,lr}+mov r7,fp(4B)를 b.w로 덮고
# 로거 끝에서 원본 2개 재현 후 0x2da34 복귀.
ENT_L = 0x75f80   # 0x75f80~0x75ff0 제로 블록 (112B)
assert bytes(data[ENT_L:ENT_L+0x10]) == b'\x00' * 0x10, 'ENT_L 제로 아님!'
code7 = bytearray()
code7 += struct.pack('<HH', 0xE92D, 0x401F)      # 0x00 push.w {r0-r3, r4, lr}
code7 += struct.pack('<H', 0x2004)               # 0x04 movs r0, #4
pc_adr = (ENT_L + 0x0A) & ~3
imm8 = (ENT_L + 0x38 - pc_adr) // 4              # 리터럴 @0x38 (코드 0x36 + 정렬!)
assert 0 <= imm8 <= 255
code7 += struct.pack('<H', 0xA400 | imm8)        # 0x06 adr r4, lit
code7 += struct.pack('<HH', 0xF8D4, 0x1000)      # 0x08 ldr.w r1, [r4] = tag
code7 += enc_add_reg(1, 1, 4)
code7 += struct.pack('<HH', 0xF8D4, 0x2004)      # 0x0E ldr.w r2, [r4,#4] = fmt
code7 += enc_add_reg(2, 2, 4)
code7 += struct.pack('<HH', 0xF8D4, 0x3008)      # 0x14 ldr.w r3, [r4,#8] = got
code7 += enc_add_reg(3, 3, 4)
code7 += struct.pack('<HH', 0xF8D3, 0xC000)      # 0x1A ldr.w r12, [r3] = __android_log_print
code7 += struct.pack('<HH', 0xF8DD, 0x3014)      # 0x1E ldr.w r3, [sp,#20] = 원래 lr (복귀 주소!) vararg1
code7 += struct.pack('<HH', 0xF8DD, 0x4000)      # 0x22 ldr.w r4, [sp,#0] = 원래 r0 (this?) vararg2
code7 += struct.pack('<HH', 0xF8CD, 0x4000)      # 0x26 str.w r4, [sp,#0] → vararg2
code7 += struct.pack('<H', 0x47E0)               # 0x2A blx r12
code7 += struct.pack('<HH', 0xE8BD, 0x401F)      # 0x2C pop.w {r0-r3, r4, lr}
code7 += struct.pack('<H', 0xF0B5)               # 0x30 원본 재현: push {r4-r7, lr}
code7 += struct.pack('<H', 0x5F46)               # 0x32 원본 재현: mov r7, fp
code7 += enc_b_t2(ENT_L + 0x34, 0x2da34)         # 0x34 b.w 0x2da34 (다음 원본!)
while (ENT_L + len(code7)) % 4 != 0:
    code7 += b'\x00'
lit1_off7 = len(code7)                           # 리터럴 @0x38
ENT_FMT = ENT_L + len(code7) + 12                # FMT 문자열 @리터럴+12 (0x44)
code7 += struct.pack('<i', MSG_TAG - (ENT_L + lit1_off7))       # tag
code7 += struct.pack('<i', ENT_FMT - (ENT_L + lit1_off7))       # fmt
code7 += struct.pack('<i', GOT_LOGPRINT - (ENT_L + lit1_off7))  # got
orig_2da30 = bytes(data[0x2da30:0x2da34])
data[0x2da30:0x2da34] = enc_b_t2(0x2da30, ENT_L)  # ★ 4B 슬라이스!
data[ENT_L:ENT_L+len(code7)] = code7
b = b'ent:%x %x\x00'
data[ENT_FMT:ENT_FMT+len(b)] = b
print(f'패치 0x2da30: {orig_2da30.hex()} → b.w 0x{ENT_L:05x} (draw_MunjangStore 진입: lr/r0 실측!)')

# --- 4h-10. [ci38] 0x2e0c8(리터럴 풀!) → 케이스 14 트램펄린 수정 (Cycle I, v14) ---
# JIT2 로거 실측(17:57): jit2:c15250a5 0 0 fffff05c → SIGILL fault 0xc15250a4
# 결론: ART JIT가 "케이스 14 핸들러"를 0x2e0d0-8 = 0x2e0c8(리터럴 풀=데이터!)로 오계산!
#   사용자 이론 검산: 케이스1218(0x2f398)-0x12D0 = 0x2e0c8! (0x2e0d0-0x2e0c8=8 = 리터럴 풀 선행!)
# 수정(v14): 0x2e0c8에 b.w 0x2e0d0! + 0x2e0d0에 b.w LOGGER_C!
# ★ 안전성 재검증(전수 스캔): 0x2e0c8의 원래 값(0xfff45f48)을 읽는 곳 = 0x2e07a 1곳!
#   ★ 0x2e07a~0x2e08e는 "죽은 코드"가 아니라 활성 코드! (0x2e000으로 점프 23건!)
#   → 0x2e0c8을 b.w로 덮으면 0x2e07a(케이스13 메뉴초기화)가 b.w 인코딩을 읽고 크래시!
#   → 0xfff45f48을 0x2e0d4~0x2e0d7로 이전 + 0x2e07a의 imm8 조정(0x13→0x16)!
orig_2e0c8 = bytes(data[0x2e0c8:0x2e0cc])
assert orig_2e0c8 == struct.pack('<I', 0xfff45f48), f'0x2e0c8 원본 아님: {orig_2e0c8.hex()}'
data[0x2e0c8:0x2e0cc] = enc_b_t2(0x2e0c8, 0x2e0d0)  # b.w 0x2e0d0 (케이스 14 트램펄린!)
print(f'패치 0x2e0c8: {orig_2e0c8.hex()} → b.w 0x2e0d0 (케이스 14 트램펄린!)')

# 리터럴 0xfff45f48 이전: 0x2e0c8 → 0x2e0d4 (0x2e07a가 읽는 위치!)
#   0x2e07a: ldr r1, [pc, #0x58] → PC=0x2e07c + 0x58 = 0x2e0D4! (imm8 0x13→0x16)
#   원본 0x2e0d4~0x2e0d7은 케이스14 본체(ldr r0,[r1,r3] + bl 첫 halfword) → LOGGER_C가 재현!
orig_2e07a = bytes(data[0x2e07a:0x2e07c])
assert orig_2e07a == b'\x13\x49', f'0x2e07a 원본 아님: {orig_2e07a.hex()}'
data[0x2e07a:0x2e07c] = b'\x16\x49'  # imm8 0x13 → 0x16 (0x2e0c8 → 0x2e0d4!)
print(f'패치 0x2e07a: {orig_2e07a.hex()} → 1649 (리터럴 0x2e0d4 참조!)')

# --- 4h-11. [ci39] 케이스 14 진입 래퍼 — v21 (인자 실측 로그, 106B!) ---
# v20 실측(07:09): 0x2e0e0 SEGV fault 0x4! [sp+0x48]=r1+4=4 → r1=0!
#   ART JIT가 넘기는 r1이 '호출마다 다름' (05:25: c0c7f058! 07:09: 0!)
#   → 레지스터 기반 프레임 불가! 정확한 인자 실측 필요!
# v21: sub sp,#0x174만 (push 생략!) + 로그(r0-r3 + [원래sp+0x48]) + r1 기반 프레임!
def enc_movw_movt(reg, val):
    """movw/movt 인코더! val 32비트!
    MOVW T3: hw1 = 1111 0 i 100100 imm4 | hw2 = 0 imm3 Rd imm8!
    imm16 = imm4:i:imm12 (imm12 = imm3:imm8 = 11비트!)
    hw2 = (imm3 << 12) | (Rd << 8) | imm8!"""
    out = b''
    for opcode, v in [(0xF240, val & 0xFFFF), (0xF2C0, (val >> 16) & 0xFFFF)]:
        i = (v >> 11) & 1
        imm4 = (v >> 12) & 0xF
        imm12 = v & 0x7FF
        imm3 = (imm12 >> 8) & 0x7
        imm8 = imm12 & 0xFF
        hw1 = opcode | (i << 10) | imm4
        hw2 = (imm3 << 12) | (reg << 8) | imm8
        out += struct.pack('<HH', hw1, hw2)
    return out

CASE14_WRAPPER = 0x75de0   # 0x75de0~0x75e4c 제로 블록 (108B, 확인 완료!)
CI15B_FMT = CI15_FMT + 0x30  # CI15_FMT 뒤! 'ci15b:r0=%x r1=%x r2=%x r3=%x v48=%x'
codeW = bytearray()
# 0x75de0: 프롤로그! (push 생략! 프레임만!)
codeW += struct.pack('<H', 0xB0DD)               # sub sp, #0x174 (2B! 372B!)
# 0x75de2: 로그! (push.w {r0-r3, lr} 20B!)
codeW += struct.pack('<HH', 0xE92D, 0x400F)      # push.w {r0-r3, lr} (4B!)
# 0x75de6: r8 = base + CI15B_FMT! (add r8,pc @0x75dee! pc=base+0x75df2!)
codeW += enc_movw_movt(8, (CI15B_FMT - 0x75df2)) # movw/movt r8 (8B)
codeW += struct.pack('<H', 0x44F8)               # add r8, pc (2B!)
# 0x75df0: r12 = base + 0x1bb998! (add r12,pc @0x75df8! pc=base+0x75dfc!)
codeW += enc_movw_movt(12, (0x1bb998 - 0x75dfc)) # movw/movt r12 (8B)
codeW += struct.pack('<H', 0x44FC)               # add r12, pc (2B!)
codeW += struct.pack('<HH', 0xF8DC, 0xC000)      # ldr.w r12, [r12] = log_print (4B!)
codeW += struct.pack('<H', 0x2004)               # movs r0, #4 (2B!)
codeW += struct.pack('<H', 0x4641)               # mov r1, r8 (tag!) (2B!)
codeW += struct.pack('<H', 0x4642)               # mov r2, r8 (fmt!) (2B!)
codeW += struct.pack('<H', 0x9B00)               # ldr r3, [sp, #0] = 원래 r0! (2B!)
codeW += struct.pack('<H', 0x9E02)               # ldr r6, [sp, #8] = 원래 r2! (2B!)
codeW += struct.pack('<H', 0x9F03)               # ldr r7, [sp, #12] = 원래 r3! (2B!)
codeW += struct.pack('<HH', 0xF8DD, 0x91B8)      # ldr.w r9, [sp, #0x1B8] = [원래sp+0x48]! (4B!)
codeW += struct.pack('<HH', 0xF8DD, 0xA010)      # ldr.w r10, [sp, #0x10] = lr! (4B! blx/jump 경로 확인!)
codeW += struct.pack('<HH', 0xE92D, 0x06C0)      # push.w {r6, r7, r9, r10} (4B! varargs!)
codeW += struct.pack('<H', 0x47E0)               # blx r12 (2B!)
codeW += struct.pack('<H', 0xB008)               # add sp, #16 (2B!)
codeW += struct.pack('<HH', 0xE8BD, 0x400F)      # pop.w {r0-r3, lr} (4B!)
# 0x75e18: 프레임 구성! (r2 = GOT 베이스! r1 = arg1!)
codeW += enc_movw_movt(2, (0x1bb908 - 0x75e22)) # movw/movt r2 (8B!) (add r2,pc @0x75e22!)
codeW += struct.pack('<H', 0x447A)               # add r2, pc (2B! r2 = base+0x1bb908!)
codeW += struct.pack('<H', 0x920D)               # str r2, [sp, #0x34] = GOT! (2B!)
codeW += struct.pack('<H', 0x910E)               # str r1, [sp, #0x38] = arg1! (2B!)
codeW += struct.pack('<H', 0x910F)               # str r1, [sp, #0x3c] = this! (2B!)
codeW += struct.pack('<H', 0x460B)               # mov r3, r1 (2B!)
codeW += struct.pack('<H', 0x3304)               # adds r3, #4 (2B!)
codeW += struct.pack('<H', 0x9312)               # str r3, [sp, #0x48] = arg1+4! (2B!)
codeW += struct.pack('<H', 0x3304)               # adds r3, #4 (2B!)
codeW += struct.pack('<H', 0x9313)               # str r3, [sp, #0x4c] = arg1+8! (2B!)
codeW += struct.pack('<H', 0x3304)               # adds r3, #4 (2B!)
codeW += struct.pack('<H', 0x9314)               # str r3, [sp, #0x50] = arg1+0xc! (2B!)
# --- 원본 0x2e0d0~0x2e0d6 재현 ---
codeW += struct.pack('<HH', 0xF240, 0x2380)      # movw r3, #0x280 (4B!)
codeW += struct.pack('<H', 0x990D)               # ldr r1, [sp, #0x34] (2B!)
codeW += struct.pack('<H', 0x58C8)               # ldr r0, [r1, r3] (2B!)
codeW += enc_bl(CASE14_WRAPPER + len(codeW), 0x5ddf4)  # bl 0x5ddf4 (4B!)
codeW += enc_b_t2(CASE14_WRAPPER + len(codeW), 0x2e0da) # b.w 0x2e0da (4B!)
assert len(codeW) <= 0x6C, f'래퍼 길이 {len(codeW)} > 0x6C!'
data[CASE14_WRAPPER:CASE14_WRAPPER+len(codeW)] = codeW
# CI15B_FMT 문자열!
bC15B = b'ci15b:r0=%x r2=%x r3=%x v48=%x lr=%x\x00'
data[CI15B_FMT:CI15B_FMT+len(bC15B)] = bC15B
print(f'v21 래퍼 길이: {len(codeW)}B (CI15B_FMT=0x{CI15B_FMT:05x})')
# 0x2e0d0: bx lr + nop (ART JIT 직접 blx 호출 무력화: 조용히 복귀!) 
# + 0x2e0d4~0x2e0d7: 리터럴 0xfff45f48 (0x2e07a용!)
# v22 실측: ART JIT가 blx로 0x2e0d0 호출(lr=c14170a5=JIT코드) → 래퍼 프레임 구성 불가 → 본체 [sp+0x48] 역참조 SEGV
# → bx lr로 즉시 복귀: 케이스 14 드로잉 스킵, ART JIT 코드로 안전 복귀
orig_2e0d0 = bytes(data[0x2e0d0:0x2e0d4])
data[0x2e0d0:0x2e0d4] = struct.pack('<HH', 0x4770, 0xBF00)  # bx lr / nop
data[0x2e0d4:0x2e0d8] = struct.pack('<I', 0xfff45f48)  # 리터럴 이전!
bC15 = b'ci15:r0=%x r1=%x r2=%x r3=%x v34=%x v48=%x\x00'
data[CI15_FMT:CI15_FMT+len(bC15)] = bC15
print(f'패치 0x2e0d0: {orig_2e0d0.hex()} → b.w 0x{CASE14_WRAPPER:05x} + 리터럴 0x2e0d4 (케이스14 래퍼 v17! fmt=0x{CI15_FMT:05x})')

# --- 4h-12. [ci40] 이벤트 루프 게이트 0x63fc: beq → b (드로잉 강제 진입 복원!) ---
# v0.4b(6f7098b) 패치가 누락되어 게임 로직 멈춤(검은 화면 고정)!
# 0x63fc: cmp r0,#0 / 0x63fe: beq 0x641e → b 0x641e (무조건 드로잉 경로!)
orig_63fc = bytes(data[0x63fc:0x63fe])
assert orig_63fc == b'\x0f\xd0', f'0x63fc 원본 아님: {orig_63fc.hex()}'
data[0x63fc:0x63fe] = b'\x0f\xe0'   # beq(0xd00f) → b(0xe00f) (+0x1E = 0x641e!)
print(f'패치 0x63fc: {orig_63fc.hex()} → e00f (이벤트 루프 게이트: beq→b 드로잉 강제!)')

# --- 4h-13. [ci41] 케이스 14 디스패치 테이블: 0x2e0d0 → 안전 반환 stub ---
# 0x1c4998 = 12B 레코드 테이블(타입, 인덱스, 주소)의 케이스 14 엔트리 (주소 0x2e0d0)
# ART JIT가 프레임 없이 이 주소로 점프 → draw_MunjangStore 프레임 부재 → [sp+0x48] 역참조 SEGV(fault 0x4)
# → stub(bx lr) 교체: 케이스 14 드로잉 스킵 + 크래시 방지 (실험)
STUB_RET = 0x7575c
assert bytes(data[STUB_RET:STUB_RET+16]) == b'\x00'*16, '0x7575c 제로 블록 아님'
data[STUB_RET:STUB_RET+2] = struct.pack('<H', 0x4770)  # bx lr
orig_tbl = struct.unpack_from('<I', data, 0x1c4998)[0]
assert orig_tbl == 0x2e0d0, f'테이블 0x1c4998 값 아님: 0x{orig_tbl:05x}'
data[0x1c4998:0x1c499c] = struct.pack('<I', STUB_RET)
print(f'패치 0x1c4998: 0x{orig_tbl:05x} → 0x{STUB_RET:05x} (케이스14 stub: bx lr)')

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
