import struct, capstone, re

with open("/tmp/libLauncher.so", "rb") as f:
    data = f.read()

md = capstone.Cs(capstone.CS_ARCH_ARM, capstone.CS_MODE_THUMB)
md.detail = True

# 0x5b90 리터럴(0x1280)을 참조하는 코드: ldr rX, [pc, #imm], (addr+4+imm)&~3 == 0x5b90
print("=== 0x5b90 리터럴(0x1280) 참조 코드 검색 (0x5600~0x5b90) ===")
for insn in md.disasm(data[0x5600:0x5b90], 0x5600):
    if insn.mnemonic.startswith('ldr') and 'pc' in insn.op_str:
        m = re.search(r'\[pc, #(0x[0-9a-f]+)\]', insn.op_str)
        if m:
            imm = int(m.group(1), 16)
            addr = (insn.address + 4 + imm) & ~3
            if addr == 0x5b90:
                print(f"0x{insn.address:08x}: {insn.mnemonic} {insn.op_str}")

# 0x5758 리터럴(0x1280) 참조 코드: 0x5748의 ldr r3,[pc,#8] -> addr=(0x5748+4+8)&~3=0x5754 아님! 
# 0x5748: ldr r3,[pc,#8] -> 0x574c+8 = 0x5754 (0x1bb908 오프셋!) 그건 GOT 베이스
# 0x574a: ldr r2,[pc,#0xc] -> 0x574e+0xc = 0x575a &~3 = 0x5758 (0x1280!) -> initCanvas 저장부
print("\n=== 0x5748~0x5750 (initCanvas 저장부) 재확인 ===")
for insn in md.disasm(data[0x5748:0x5752], 0x5748):
    print(f"0x{insn.address:08x}: {insn.mnemonic:8s} {insn.op_str}")

# 0x1bcb88이 .data/.bss 어디인지: .data 0x1bbb90~0x1bc824, .bss는 그 뒤
# GOT 오프셋 0x1280을 사용하는 모든 리터럴 풀 항목과 참조 코드
print("\n=== 0x1280 값 리터럴 전부 + 참조 코드 ===")
lits = []
for i in range(0x2ac8, 0x70f6c, 2):  # .text 범위만 (리터럴 풀은 .text 내)
    v = struct.unpack_from('<I', data, i)[0]
    if v == 0x1280:
        lits.append(i)
print(f"리터럴 풀 위치: {[hex(x) for x in lits]}")

for lit in lits:
    for insn in md.disasm(data[lit-0x400:lit], lit-0x400):
        if insn.mnemonic.startswith('ldr') and 'pc' in insn.op_str:
            m = re.search(r'\[pc, #(0x[0-9a-f]+)\]', insn.op_str)
            if m:
                imm = int(m.group(1), 16)
                addr = (insn.address + 4 + imm) & ~3
                if addr == lit:
                    print(f"  0x{insn.address:08x}: {insn.mnemonic} {insn.op_str} -> 리터럴 0x{lit:x}")
