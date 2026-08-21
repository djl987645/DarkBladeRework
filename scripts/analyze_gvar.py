import struct

with open("/tmp/libLauncher.so", "rb") as f:
    data = f.read()

# Thumb ldr literal: 주소 = (PC+4+imm) & ~3
# 0x5748: ldr r3,[pc,#8]  -> PC=0x574c, addr=(0x574c+8)&~3=0x5754
# 0x574a: ldr r2,[pc,#0xc] -> PC=0x574e, addr=(0x574e+0xc)&~3=0x5758  (내가 0x575a로 잘못 읽음!)
v1 = struct.unpack_from('<I', data, 0x5754)[0]
v2 = struct.unpack_from('<I', data, 0x5758)[0]
r3 = (0x5750 + v1) & 0xffffffff
store_addr = (r3 + v2) & 0xffffffff
print(f"[0x5754]=0x{v1:08x} -> r3=0x{r3:08x}")
print(f"[0x5758]=0x{v2:08x} -> 저장 주소 = 0x{store_addr:08x}")

# 전역 변수 사용처 검색: 이 주소를 가리키는 리터럴/오프셋 검색
# GOT 베이스 0x1bb908 기준 오프셋
offset = (store_addr - 0x1bb908) & 0xffffffff
print(f"\nGOT 오프셋: 0x{offset:08x}")
cnt = 0
for i in range(0, len(data)-3, 4):
    v = struct.unpack_from('<I', data, i)[0]
    if v == offset:
        print(f"  리터럴 0x{i:06x}: 0x{v:08x}")
        cnt += 1
print(f"  총 {cnt}개 (리터럴 풀/GOT 오프셋)")

# 절대 주소로도 검색
cnt2 = 0
for i in range(0, len(data)-3, 4):
    v = struct.unpack_from('<I', data, i)[0]
    if v == store_addr:
        print(f"  절대값 0x{i:06x}: 0x{v:08x}")
        cnt2 += 1
print(f"  절대값 총 {cnt2}개")
