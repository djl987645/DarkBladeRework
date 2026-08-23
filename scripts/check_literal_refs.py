import struct
d = open('docs/libLauncher_original.so','rb').read()

# 1) 0xfff45f48 (0x2e0c8의 리터럴 값)을 참조하는 코드 검색
print("=== 리터럴 0xfff45f48 참조 ===")
t = struct.pack('<I', 0xfff45f48)
pos = 0
while True:
    pos = d.find(t, pos)
    if pos == -1:
        break
    print(f"  {hex(pos)}")
    pos += 4

# 2) 0x2e0c8~0x2e0cc가 "리터럴 풀"인지 "코드"인지 — 주변 ldr [pc] 참조 확인
# 0x2e000~0x2e08e 코드에서 pc-relative ldr들이 0x2e090~0x2e0cc를 가리키는지
print("\n=== 0x2e000~0x2e08e의 ldr [pc] 리터럴 오프셋 ===")
import re
# 간단히 0x2dfd0~0x2e090 사이 코드에서 16비트 ldr literal (01001 Rt imm8) 스캔
for off in range(0x2dfd0, 0x2e090, 2):
    hw = struct.unpack('<H', d[off:off+2])[0]
    if (hw & 0xF800) == 0x4800:  # ldr Rt, [pc, #imm8*4]
        rt = (hw >> 8) & 0x7
        imm8 = hw & 0xFF
        pc = (off + 4) & ~3
        target = pc + imm8*4
        print(f"  0x{off:05x}: ldr r{rt}, [pc,#0x{imm8*4:x}] → 0x{target:05x}")
