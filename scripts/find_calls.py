import capstone
data = open("/tmp/libLauncher_analysis.so", "rb").read()
md = capstone.Cs(capstone.CS_ARCH_ARM, capstone.CS_MODE_THUMB)
md.detail = False

targets = {0x5f60, 0x60d4, 0x6134}
found = {t: [] for t in targets}
# .text 0x2ac8 ~ 0x70f6c (vaddr == offset)
for i in md.disasm(data[0x2ac8:0x70f6c], 0x2ac8):
    if i.mnemonic in ("bl", "blx"):
        try:
            tgt = int(i.op_str.replace("#", ""), 16)
            if tgt in targets:
                found[tgt].append(i.address)
        except:
            pass

for t, locs in found.items():
    print(f"0x{t:04x} 호출 {len(locs)}곳: {[hex(l) for l in locs[:20]]}")
