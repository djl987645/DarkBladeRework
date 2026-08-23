import struct
d = open('docs/libLauncher_original.so','rb').read()

# 1) 0x80000000 리터럴 위치 검색
target = struct.pack('<I', 0x80000000)
pos = 0
hits = []
while True:
    pos = d.find(target, pos)
    if pos == -1:
        break
    hits.append(pos)
    pos += 4
print("0x80000000 리터럴 위치:", [hex(h) for h in hits[:30]])

# 2) movt rX, #0x8000 검색 (0x80000000 상위 halfword)
for off in range(0, len(d)-4, 2):
    hw1 = struct.unpack('<H', d[off:off+2])[0]
    hw2 = struct.unpack('<H', d[off+2:off+4])[0]
    if (hw1 & 0xFBF0) == 0xF2C0:  # movt
        imm4 = hw1 & 0x000F
        imm3 = (hw2 >> 12) & 0x7
        imm8 = hw2 & 0xFF
        imm16 = (imm4 << 12) | (imm3 << 8) | imm8
        if imm16 == 0x8000:
            rd = ((hw1 >> 4) & 0x8) | ((hw2 >> 8) & 0x7)
            print(f"movt r{rd}, #0x8000 @ {hex(off)}")

# 3) movw rX, #0 검색 후 movt #0x8000 조합 (movw #0 도 포함)
for off in range(0, len(d)-4, 2):
    hw1 = struct.unpack('<H', d[off:off+2])[0]
    hw2 = struct.unpack('<H', d[off+2:off+4])[0]
    if (hw1 & 0xFBF0) == 0xF240:  # movw
        imm4 = hw1 & 0x000F
        imm3 = (hw2 >> 12) & 0x7
        imm8 = hw2 & 0xFF
        imm16 = (imm4 << 12) | (imm3 << 8) | imm8
        if imm16 == 0:
            rd = ((hw1 >> 4) & 0x8) | ((hw2 >> 8) & 0x7)
            print(f"movw r{rd}, #0 @ {hex(off)}")
