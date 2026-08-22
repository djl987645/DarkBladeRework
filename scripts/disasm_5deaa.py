import capstone
data = open("/tmp/libLauncher_analysis.so", "rb").read()
md = capstone.Cs(capstone.CS_ARCH_ARM, capstone.CS_MODE_THUMB)
md.detail = True

def disasm(start, size, label):
    print(f"===== {label} @ 0x{start:08x} =====")
    for i in md.disasm(data[start:start+size], start):
        print(f"0x{i.address:08x}: {i.mnemonic} {i.op_str}")
    print()

# 1) creatImageLzma 호출부 (0x5deaa 주변) — 함수 경계 확인 위해 앞쪽부터
disasm(0x5de80, 0x60, "creatImageLzma 호출부 (0x5deaa)")
