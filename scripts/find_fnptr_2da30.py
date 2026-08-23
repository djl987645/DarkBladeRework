import struct
d = open('docs/libLauncher_original.so','rb').read()

# 1) 0x2da30 (draw_MunjangStore)를 값으로 가지는 리터럴/포인터 검색
print("=== 0x2da30 참조 검색 (4B 리터럴) ===")
t = struct.pack('<I', 0x2da30)
pos = 0
n = 0
while True:
    pos = d.find(t, pos)
    if pos == -1:
        break
    print(f"  {hex(pos)}")
    n += 1
    pos += 4
print(f"  총 {n}건")

# 2) R_ARM_RELATIVE 재배치 중 addend = 0x2da30 인 슬롯
import subprocess
r = subprocess.run(['readelf', '-r', 'docs/libLauncher_original.so'], capture_output=True, text=True)
print("\n=== RELOC addend 0x2da30 ===")
for line in r.stdout.splitlines():
    if 'R_ARM_RELATIVE' in line:
        parts = line.split()
        # 마지막 토큰이 +0x... addend
        for tok in parts:
            if tok.startswith('+0x'):
                try:
                    v = int(tok[1:], 16)
                    if v == 0x2da30 or abs(v - 0x2da30) < 0x100:
                        print("  HIT:", line.strip())
                except ValueError:
                    pass

# 3) 재배치 슬롯 위치 0x2e0c8 주변 (리터럴 풀이 재배치 대상인지)
print("\n=== .rel.dyn R_ARM_RELATIVE 전체 개수 및 0x2e0xx~0x2e1xx 대상 ===")
cnt = 0
for line in r.stdout.splitlines():
    if 'R_ARM_RELATIVE' in line:
        cnt += 1
        parts = line.split()
        if parts and parts[0].startswith('0002e'):
            print("  ", line.strip())
print(f"  총 {cnt}개 R_ARM_RELATIVE")
