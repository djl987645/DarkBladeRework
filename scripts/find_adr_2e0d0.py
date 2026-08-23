import struct
from capstone import Cs, CS_ARCH_ARM, CS_MODE_THUMB
d=open('docs/libLauncher_original.so','rb').read()
md=Cs(CS_ARCH_ARM, CS_MODE_THUMB); md.detail=True

# 목표: 0x2e0d0(또는 0x2e0c8)을 PC-상대 산술로 계산하는 코드 찾기
# Thumb adr rX, label = 0xA000~0xA7FF (add rX, pc, imm8<<2), 타깃=(pc&~3)+imm
# Thumb add.w rX, pc, #imm = 0xF20F 0x0xxx (타깃=(pc&~3)+imm)
# ARM add rX, pc, #imm = 0xE28Fxxxx (타깃=pc+8+imm)

TARGETS = {0x2e0d0: '0x2e0d0($t)', 0x2e0c8: '0x2e0c8', 0x2e0c9: '0x2e0c9', 0x2e0d1: '0x2e0d1'}

print('=== Thumb adr (0xA000~0xA7FF) ===')
hits=0
for a in range(0x2ac8, 0x70f6c, 2):
    h = struct.unpack('<H', d[a:a+2])[0]
    if (h & 0xF800) == 0xA000:
        rd = (h >> 8) & 0x7
        imm = (h & 0xFF) << 2
        pc = (a + 4) & ~3
        tgt = pc + imm
        if tgt in TARGETS:
            print('0x%05x: adr r%d, 0x%05x -> %s' % (a, rd, tgt, TARGETS[tgt]))
            hits+=1

print('=== Thumb add.w rX, pc, #imm (0xF20F 0x0xxx) ===')
for a in range(0x2ac8, 0x70f6c, 2):
    h = struct.unpack('<H', d[a:a+2])[0]
    if h == 0xF20F:
        h2 = struct.unpack('<H', d[a+2:a+4])[0]
        if (h2 & 0x8000) == 0:  # ADD (immediate)
            rd = (h2 >> 8) & 0xF
            imm3 = (h2 >> 12) & 0x7
            imm8 = h2 & 0xFF
            imm = (imm3 << 8) | imm8
            pc = (a + 4) & ~3
            tgt = pc + imm
            if tgt in TARGETS:
                print('0x%05x: add.w r%d, pc, #0x%x -> %s' % (a, rd, imm, TARGETS[tgt]))
                hits+=1

print('=== ARM add rX, pc, #imm (0xE28Fxxxx) — 0x2660~0x2a80, 0x70fe0 등 ARM 영역 전체 스캔 ===')
# ARM 명령은 4B 정렬. .text에서 ARM 코드를 찾기: 0x2660~0x2a80 알려진 ARM 스텁 + 0x70fe0
for a in range(0x2ac8, 0x70f6c, 4):
    w = struct.unpack('<I', d[a:a+4])[0]
    if (w & 0x0FFF0000) == 0x028F0000:  # add rX, pc, #imm
        rd = (w >> 12) & 0xF
        imm = w & 0xFFF
        tgt = (a + 8) + imm
        if tgt in TARGETS:
            print('0x%05x: add r%d, pc, #0x%x -> %s' % (a, rd, imm, TARGETS[tgt]))
            hits+=1
    if (w & 0x0FFF0000) == 0x008F0000:  # add rX, pc, rY (레지스터)
        rd = (w >> 12) & 0xF
        rm = w & 0xF
        print('  (참고) 0x%05x: add r%d, pc, r%d' % (a, rd, rm))
        hits+=1

if hits==0:
    print('전체 0건')
