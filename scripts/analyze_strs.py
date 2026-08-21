import struct

with open("/tmp/libLauncher.so", "rb") as f:
    data = f.read()

# Thumb: ldr r4,[pc,#0x50] @0x3f28 -> pc=0x3f2c, addr=0x3f2c+0x50=0x3f7c
# ldr r1,[pc,#0x50] @0x3f2c -> pc=0x3f30, addr=0x3f30+0x50=0x3f80
# ldr r3,[pc,#0x48] @0x3f3a -> pc=0x3f3e, addr=0x3f3e+0x48=0x3f86
# ldr r2,[pc,#0x48] @0x3f3c -> pc=0x3f40, addr=0x3f40+0x48=0x3f88
for addr in [0x3f7c, 0x3f80, 0x3f86, 0x3f88]:
    print(f"[0x{addr:x}] = 0x{struct.unpack_from('<I', data, addr)[0]:08x}")

# 문자열 주변 덤프: mNativeCanvas @0x711f8
print("\n--- 0x711d0 ~ 0x71230 ---")
for i in range(0x711d0, 0x71230, 16):
    chunk = data[i:i+16]
    ascii_repr = ''.join(chr(b) if 32 <= b < 127 else '.' for b in chunk)
    print(f"0x{i:06x}: {chunk.hex(' ')}  {ascii_repr}")

# 0x711f8 뒤로 64바이트 여유 확인
print("\n--- 0x71208 이후 96바이트 ---")
for i in range(0x71208, 0x71268, 16):
    chunk = data[i:i+16]
    ascii_repr = ''.join(chr(b) if 32 <= b < 127 else '.' for b in chunk)
    print(f"0x{i:06x}: {chunk.hex(' ')}  {ascii_repr}")
