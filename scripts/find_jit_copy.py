import struct
d = open('docs/libLauncher_original.so','rb').read()

# draw_MunjangStore 프롤로그 시그니처 (0x2da30~0x2da60, 48B)
sig = d[0x2da30:0x2da60]
print(f"시그니처(48B): {sig.hex()}")

# 1) .so 전체에서 동일 시그니처 반복 검색
print("\n=== 48B 정확 일치 ===")
pos = 0
while True:
    pos = d.find(sig, pos)
    if pos == -1:
        break
    print(f"  0x{pos:05x}")
    pos += 1

# 2) 16B 프롤로그 일치 검색 (더 관대하게)
sig16 = d[0x2da30:0x2da40]
print("\n=== 16B 프롤로그 일치 ===")
pos = 0
while True:
    pos = d.find(sig16, pos)
    if pos == -1:
        break
    print(f"  0x{pos:05x}")
    pos += 1

# 3) 0x2e0c8 부근(크래시 지점) 시그니처가 반복되는 위치
sig2 = d[0x2e0c0:0x2e0d0]
print(f"\n크래시 지점 시그니처(16B): {sig2.hex()}")
pos = 0
while True:
    pos = d.find(sig2, pos)
    if pos == -1:
        break
    print(f"  0x{pos:05x}")
    pos += 1
