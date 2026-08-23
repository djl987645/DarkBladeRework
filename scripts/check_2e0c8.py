import struct
d = open('docs/libLauncher_original.so','rb').read()

print("=== 0x2e080~0x2e100 raw bytes ===")
for off in range(0x2e080, 0x2e100, 4):
    v = struct.unpack('<I', d[off:off+4])[0]
    print(f"{hex(off)}: {hex(v)}  bytes={d[off:off+4].hex()}")

# 0x2e0c8이 코드로 해석되는지 — 주변 halfword
print("\n=== halfword 시퀀스 0x2e0c0~0x2e0d8 ===")
for off in range(0x2e0c0, 0x2e0d8, 2):
    hw = struct.unpack('<H', d[off:off+2])[0]
    print(f"{hex(off)}: {hex(hw)}")
