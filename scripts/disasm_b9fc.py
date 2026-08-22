import capstone
data = open("/tmp/libLauncher_analysis.so", "rb").read()

md = capstone.Cs(capstone.CS_ARCH_ARM, capstone.CS_MODE_THUMB)
md.detail = True

def disasm_range(start, size):
    code = data[start:start+size]
    return list(md.disasm(code, start))

def dump(start, size, label):
    print(f"===== {label} @ 0x{start:08x} ({size}B) =====")
    for i in disasm_range(start, size):
        print(f"0x{i.address:08x}: {i.mnemonic} {i.op_str}")
    print()

# 1) 0xb9fc: startClet이 마지막에 호출하는 게임 시작 함수
dump(0xb9fc, 0xbe00-0xb9fc, "game_start (0xb9fc)")

# 2) creatImageLzma(0x5f321) 콜 사이트 전체 검색 (bl 0x5f321, bl 0x5f320 등)
print("===== creatImageLzma(0x5f321) 호출처 검색 =====")
for i in disasm_range(0, len(data)):
    pass  # 너무 큼 — .text 영역만
