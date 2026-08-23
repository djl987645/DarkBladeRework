import struct
import subprocess

# 1) .rel.dyn에서 addend = 0x760a5 또는 0x760a4 또는 0x2e0c8인 슬롯 검색
r = subprocess.run(['readelf', '-r', 'docs/libLauncher_original.so'], capture_output=True, text=True)
lines = r.stdout.splitlines()
print("=== REL entries with addend 0x760a5/0x760a4/0x2e0c8/0x2e0c9 ===")
targets = {0x760a5, 0x760a4, 0x2e0c8, 0x2e0c9}
for line in lines:
    if 'R_ARM_RELATIVE' in line or 'R_ARM_ABS32' in line or 'R_ARM_GLOB_DAT' in line:
        # 형식: offset info type sym.value sym.name + addend
        parts = line.split()
        try:
            if len(parts) >= 4:
                # addend는 마지막 + 0x... 또는 0x... 형식
                for tok in parts:
                    if tok.startswith('+0x') or tok.startswith('0x') and len(tok) > 4:
                        try:
                            v = int(tok.replace('+', ''), 16)
                            if v in targets or v == 0x760a5:
                                print("HIT:", line.strip())
                        except ValueError:
                            pass
        except Exception:
            pass

# 2) 파일 바이트에서 0x760a5가 "addend"로 저장된 R_ARM_RELATIVE 슬롯 위치 직접 탐색
# REL은 Elf32_Rel(8B): r_offset(4) + r_info(4), addend는 대상 위치에 저장됨
# .rel.dyn 섹션 위치 확인
r2 = subprocess.run(['readelf', '-S', 'docs/libLauncher_original.so'], capture_output=True, text=True)
print("\n=== .rel.dyn 섹션 ===")
for line in r2.stdout.splitlines():
    if '.rel.dyn' in line:
        print(line.strip())

# 3) .rel.dyn에 있는 모든 R_ARM_RELATIVE의 addend 분포 (0x70000~0x78000 범위 대상)
d = open('docs/libLauncher_original.so','rb').read()
# 재배치 대상 오프셋(파일 내) = r_offset (vaddr==offset이므로 동일)
# 0x760a5 부근(0x75000~0x77000)을 가리키는 재배치가 있는지, 대상 메모리에 addend가 저장된 구조이므로
# 대상 오프셋 자체의 4B 값이 addend다. 즉 [0x760a0]~[0x760b0] 영역의 값 확인이 곧 addend.
print("\n=== 0x760a0~0x760c0 4B 값 (addend 후보) ===")
for off in range(0x760a0, 0x760c0, 4):
    v = struct.unpack('<I', d[off:off+4])[0]
    print(f"  {hex(off)}: {hex(v)}")
