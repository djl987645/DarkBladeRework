import struct
d = open('docs/libLauncher_original.so','rb').read()

# 1) 0x760a0~0x76200 영역이 문자열인지 확인 (UTF-8 디코드)
seg = d[0x760a0:0x76200]
print("=== 0x760a0~0x76200 첫 64B ===")
print(seg[:64].hex())
try:
    print("UTF-8:", seg[:64].decode('utf-8', errors='replace'))
except Exception as e:
    print("decode err:", e)

# 2) 0x760a4/0x760a5를 가리키는 R_ARM_RELATIVE 재배치 확인 (ELF .rel.dyn)
import subprocess
r = subprocess.run(['readelf', '-r', 'docs/libLauncher_original.so'], capture_output=True, text=True)
for line in r.stdout.splitlines():
    if '760a' in line or '760b' in line:
        print("REL:", line.strip())

# 3) 0x760a0~0x76200이 "함수 포인터 배열"인지: 4B 단위 값들이 코드 영역(0x1000~0x80000)을 가리키는지
print("\n=== 0x760a0~0x76200 4B 단위 포인터 검사 ===")
for off in range(0x760a0, 0x76200, 4):
    v = struct.unpack('<I', d[off:off+4])[0]
    # 코드 영역 포인터 or Thumb 비트(홀수) 코드 포인터?
    if (0x1000 <= v < 0x80000) or (0x1000 <= (v & ~1) < 0x80000):
        print(f"  {hex(off)}: {hex(v)} ← 코드 포인터!")
