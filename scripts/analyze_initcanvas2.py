import capstone

with open("/tmp/libLauncher.so", "rb") as f:
    data = f.read()

md = capstone.Cs(capstone.CS_ARCH_ARM, capstone.CS_MODE_THUMB)
md.detail = True

print("=== initCanvas (0x3f21, Thumb) ===")
for insn in md.disasm(data[0x3f21:0x3f21+0x80], 0x3f21):
    print(f"0x{insn.address:08x}: {insn.mnemonic:8s} {insn.op_str}")
