import struct
d = open('docs/libLauncher_original.so','rb').read()

# 0x1c4948 함수 포인터 테이블 분석
print("=== 0x1c4900~0x1c4a00 (함수 포인터 테이블 후보) ===")
for off in range(0x1c4900, 0x1c4a00, 4):
    v = struct.unpack('<I', d[off:off+4])[0]
    marker = ""
    if 0x1000 <= v < 0x80000:
        marker = " ← 코드 포인터!"
    if v & 1 and 0x1000 <= (v & ~1) < 0x80000:
        marker = " ← Thumb 코드 포인터!"
    print(f"  {hex(off)}: {hex(v)}{marker}")
