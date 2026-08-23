import struct
d = open('docs/libLauncher_original.so','rb').read()

# 1) 0x2e0c8을 값으로 가지는 리터럴/포인터 검색
for target in [0x2e0c8, 0x760a5, 0x760a4]:
    print(f"\n=== 0x{target:x} 참조 검색 ===")
    t = struct.pack('<I', target)
    pos = 0
    n = 0
    while True:
        pos = d.find(t, pos)
        if pos == -1:
            break
        # 코드 영역(0x1000~0x80000)에서만 관심
        if 0x1000 <= pos < 0x80000:
            print(f"  {hex(pos)}")
            n += 1
        pos += 4
    print(f"  총 {n}건 (코드 영역)")

# 2) movw/movt로 0x2e0c8을 만드는 코드 검색
print("\n=== movw/movt 0x2e0c8 패턴 ===")
for off in range(0x1000, 0x80000-4, 2):
    hw1 = struct.unpack('<H', d[off:off+2])[0]
    hw2 = struct.unpack('<H', d[off+2:off+4])[0]
    if (hw1 & 0xFBF0) == 0xF240:  # movw
        imm4 = hw1 & 0xF
        imm3 = (hw2 >> 12) & 0x7
        imm8 = hw2 & 0xFF
        imm16 = (imm4 << 12) | (imm3 << 8) | imm8
        if imm16 == 0x2e0c8 & 0xFFFF:
            rd = ((hw1 >> 4) & 0x8) | ((hw2 >> 8) & 0x7)
            print(f"  movw r{rd}, #0x{imm16:x} @ {hex(off)}")
    if (hw1 & 0xFBF0) == 0xF2C0:  # movt
        imm4 = hw1 & 0xF
        imm3 = (hw2 >> 12) & 0x7
        imm8 = hw2 & 0xFF
        imm16 = (imm4 << 12) | (imm3 << 8) | imm8
        if imm16 == (0x2e0c8 >> 16) & 0xFFFF:
            rd = ((hw1 >> 4) & 0x8) | ((hw2 >> 8) & 0x7)
            print(f"  movt r{rd}, #0x{imm16:x} @ {hex(off)}")
