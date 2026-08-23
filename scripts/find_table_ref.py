import struct
from capstone import *
from capstone.arm import *

d = open('docs/libLauncher_original.so','rb').read()
md = Cs(CS_ARCH_ARM, CS_MODE_THUMB)
md.detail = True

# 0x1c4948 = 0x1C4948: movw #0x4948 + movt #0x1C 패턴 검색
print("=== 0x1c4948 테이블 참조 코드 (movw/movt) ===")
for off in range(0x2ac8, 0x7106c-4, 2):
    hw1 = struct.unpack('<H', d[off:off+2])[0]
    hw2 = struct.unpack('<H', d[off+2:off+4])[0]
    # movw rX, #0x4948
    if (hw1 & 0xFBF0) == 0xF240:
        imm4 = hw1 & 0xF
        imm3 = (hw2 >> 12) & 0x7
        imm8 = hw2 & 0xFF
        imm16 = (imm4 << 12) | (imm3 << 8) | imm8
        if imm16 == 0x4948:
            rd = ((hw1 >> 4) & 0x8) | ((hw2 >> 8) & 0x7)
            # 다음 4B에 movt rX, #0x1C?
            if off+6 < len(d):
                hw3 = struct.unpack('<H', d[off+4:off+6])[0]
                hw4 = struct.unpack('<H', d[off+6:off+8])[0]
                if (hw3 & 0xFBF0) == 0xF2C0:
                    imm4b = hw3 & 0xF
                    imm3b = (hw4 >> 12) & 0x7
                    imm8b = hw4 & 0xFF
                    imm16b = (imm4b << 12) | (imm3b << 8) | imm8b
                    rdb = ((hw3 >> 4) & 0x8) | ((hw4 >> 8) & 0x7)
                    if imm16b == 0x1C and rdb == rd:
                        print(f"  movw r{rd},#0x4948 + movt r{rd},#0x1C @ {hex(off)}")

# 리터럴 풀 로드 패턴: ldr rX, [pc, #lit] → 리터럴 값 = 0x1c4948?
print("\n=== 리터럴 0x1c4948 (4B) ===")
t = struct.pack('<I', 0x1c4948)
pos = 0
while True:
    pos = d.find(t, pos)
    if pos == -1:
        break
    if 0x2ac8 <= pos < 0x7106c:
        print(f"  {hex(pos)}")
    pos += 4
