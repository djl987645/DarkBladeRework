import capstone

with open("/tmp/libLauncher.so", "rb") as f:
    data = f.read()

# 문자열 검색
for s in [b"mNativeCanvas", b"android/graphics/Canvas", b"\x00I\x00"]:
    idx = 0
    found = []
    while True:
        i = data.find(s, idx)
        if i == -1:
            break
        found.append(i)
        idx = i + 1
    print(f"'{s}': {[hex(x) for x in found[:10]]}")

md = capstone.Cs(capstone.CS_ARCH_ARM, capstone.CS_MODE_THUMB)
md.detail = True

print("\n=== 0x5748 (Thumb) ===")
for insn in md.disasm(data[0x5748:0x5748+0x60], 0x5748):
    print(f"0x{insn.address:08x}: {insn.mnemonic:8s} {insn.op_str}")
