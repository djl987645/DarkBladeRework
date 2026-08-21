import struct

with open("/tmp/libLauncher.so", "rb") as f:
    data = f.read()

print("=== 리터럴 풀 정밀 판독 ===")
for addr in [0x3f84, 0x3f88, 0x5754, 0x575a]:
    v = struct.unpack_from('<I', data, addr)[0]
    print(f"[0x{addr:06x}] = 0x{v:08x}  ->  주소: 0x{(0x1bb908 + v) & 0xffffffff:08x}")

# "I\0" 후보 문자열 위치 확인 (GetFieldID sig)
print("\n=== 'mNativeCanvas' 참조처 검색 (리터럴 값으로) ===")
target = 0x711f8 - 0x1bb908  # 0xffeb58f0
cnt = 0
for i in range(0, len(data)-3, 4):
    v = struct.unpack_from('<I', data, i)[0]
    if v == target:
        print(f"  0x{i:06x}: 0x{v:08x} (mNativeCanvas 오프셋)")
        cnt += 1
print(f"  총 {cnt}개")

# android/graphics/Canvas 오프셋
target2 = 0x711e0 - 0x1bb908
cnt2 = 0
for i in range(0, len(data)-3, 4):
    v = struct.unpack_from('<I', data, i)[0]
    if v == target2:
        print(f"  Canvas클래스 오프셋: 0x{i:06x}")
        cnt2 += 1
print(f"  총 {cnt2}개")

# 0x5748 저장 타깃 = [0x5754] + pc(0x5750) + [0x575a]
v1 = struct.unpack_from('<I', data, 0x5754)[0]
v2 = struct.unpack_from('<I', data, 0x575a)[0]
r3 = (0x5750 + v1) & 0xffffffff
store_addr = (r3 + v2) & 0xffffffff
print(f"\n=== 0x5748 전역 저장 주소 ===")
print(f"  [0x5754]=0x{v1:08x} -> r3 = 0x5750+0x{v1:08x} = 0x{r3:08x}")
print(f"  [0x575a]=0x{v2:08x} -> 저장 주소 = 0x{store_addr:08x}")

# ELF 섹션 헤더 파싱으로 .data/.bss 매핑
print("\n=== ELF 섹션 헤더 ===")
import subprocess
