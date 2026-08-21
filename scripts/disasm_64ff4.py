import capstone
data = open("/tmp/libLauncher_analysis.so", "rb").read()
def disasm(addr, size, thumb=True):
    code = data[addr:addr+size]
    md = capstone.Cs(capstone.CS_ARCH_ARM, capstone.CS_MODE_THUMB if thumb else capstone.CS_MODE_ARM)
    return [(f"0x{i.address:08x}", f"{i.mnemonic} {i.op_str}") for i in md.disasm(code, addr)]

print("===== 0x64ff4 (이벤트 처리?) =====")
for a, l in disasm(0x64ff4, 130):
    print(f"{a}: {l}")
print("\n===== 0x6140 BH_eventq_wait 나머지 (0x6182~) =====")
for a, l in disasm(0x6182, 40):
    print(f"{a}: {l}")
