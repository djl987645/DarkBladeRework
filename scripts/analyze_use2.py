import struct, capstone

with open("/tmp/libLauncher.so", "rb") as f:
    data = f.read()

md = capstone.Cs(capstone.CS_ARCH_ARM, capstone.CS_MODE_THUMB)
md.detail = True

# 0x5b90 리터럴(0x1280)을 사용하는 코드: ldr rX,[pc,#imm] 패턴으로 0x5b90 주변 검색
# 0x5b90이 참조되는 위치: (insn_addr+4+imm)&~3 == 0x5b90
print("=== 0x5b90 리터럴을 참조하는 Thumb 코드 검색 ===")
for insn in md.disasm(data[0x5a00:0x5b90], 0x5a00):
    if insn.mnemonic == 'ldr' and 'pc' in insn.op_str:
        # ldr rX, [pc, #imm]
        import re
        m = re.search(r'\[pc, #(0x[0-9a-f]+)\]', insn.op_str)
        if m:
            imm = int(m.group(1), 16)
            addr = (insn.address + 4 + imm) & ~3
            if addr == 0x5b90:
                print(f"0x{insn.address:08x}: {insn.mnemonic} {insn.op_str}  -> 참조 0x5b90")

# 0x1bcb88을 참조하는 다른 방법: GOT 0x1bb908 + 0x1280
# 리터럴 0x1280을 가진 곳 2곳: 0x5758(initCanvas 저장), 0x5b90(사용처?)
print("\n=== 0x5b90 전후 디스어셈블 (Thumb) ===")
for insn in md.disasm(data[0x5b40:0x5bc0], 0x5b40):
    print(f"0x{insn.address:08x}: {insn.mnemonic:8s} {insn.op_str}")

# 0x1d44f8의 절대값 0x1bcb88 사용처 — 주변 코드 (ARM/Thumb?)
print("\n=== 0x1d44f8 주변 (절대값 0x1bcb88) ===")
for i in range(0x1d44e0, 0x1d4510, 16):
    chunk = data[i:i+16]
    ascii_repr = ''.join(chr(b) if 32 <= b < 127 else '.' for b in chunk)
    print(f"0x{i:06x}: {chunk.hex(' ')}  {ascii_repr}")
