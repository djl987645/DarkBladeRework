import capstone
data = open("/tmp/libLauncher_analysis.so", "rb").read()
def disasm(addr, size, thumb=True):
    code = data[addr:addr+size]
    md = capstone.Cs(capstone.CS_ARCH_ARM, capstone.CS_MODE_THUMB if thumb else capstone.CS_MODE_ARM)
    return [(f"0x{i.address:08x}", f"{i.mnemonic} {i.op_str}") for i in md.disasm(code, addr)]

print("===== mainTimer 나머지 0xbe1a~0xbef8 =====")
for a, l in disasm(0xbe1a, 0xbef8-0xbe1a):
    print(f"{a}: {l}")
