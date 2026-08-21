import struct

with open("/tmp/libLauncher.so", "rb") as f:
    data = f.read()

# 0x7145c 주변 덤프 (GetFieldID 시그니처 "I" 후보)
print("--- 0x71440 ~ 0x71490 ---")
for i in range(0x71440, 0x71490, 16):
    chunk = data[i:i+16]
    ascii_repr = ''.join(chr(b) if 32 <= b < 127 else '.' for b in chunk)
    print(f"0x{i:06x}: {chunk.hex(' ')}  {ascii_repr}")

# 0x1bcb88 사용처: 이 주소를 참조하는 명령어 검색
# GOT 베이스 0x1bb908 기준, offset 0x1280
# ldr rX, [pc, #imm] 패턴으로 리터럴 풀에서 0x1280 찾기 -> 이미 2개 (0x5758, 0x5b90)
# 0x5b90 주변 코드가 사용처!
print("\n--- 0x5b80 ~ 0x5bc0 리터럴 ---")
for i in range(0x5b80, 0x5bc0, 16):
    chunk = data[i:i+16]
    ascii_repr = ''.join(chr(b) if 32 <= b < 127 else '.' for b in chunk)
    print(f"0x{i:06x}: {chunk.hex(' ')}  {ascii_repr}")

# "mNativeCanvas" 뒤 여유: 0x71204~0x71208은 00 00 00
# "mNativeCanvasWrapper\0" 21바이트: 0x711f8~0x7120c 필요 -> 0x71208부터 "[JNI]" 침범!
# 대안: 0x71204에서 시작? 0x71204~0x71218 (21B) -> "[JNI] can't get a" 침범
# 다른 여유 공간 찾기: NUL 패딩이 큰 영역 검색
print("\n--- 0x711e0~0x71240 전체 ---")
for i in range(0x711e0, 0x71240, 16):
    chunk = data[i:i+16]
    ascii_repr = ''.join(chr(b) if 32 <= b < 127 else '.' for b in chunk)
    print(f"0x{i:06x}: {chunk.hex(' ')}  {ascii_repr}")
