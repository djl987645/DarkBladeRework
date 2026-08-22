import capstone
data = open("/tmp/libLauncher_analysis.so", "rb").read()
md = capstone.Cs(capstone.CS_ARCH_ARM, capstone.CS_MODE_THUMB)
md.skipdata = True
md.detail = True

TEXT_START, TEXT_END = 0x2ac8, 0x70f6c

# 관심 함수들
targets = {
    0x5de2c: "img_slot_dispatch(0x5de2c)",
    0x5f24c: "img_create_alt(0x5f24c)",
    0x5f320: "XImage::creatImageLzma",
    0xb9fc: "fn_0xb9fc",
    0x613c4: "state_getter(0x613c4)",
    0x0: "EXIT",
}

found = {t: [] for t in targets}
for i in md.disasm(data[TEXT_START:TEXT_END], TEXT_START):
    if i.mnemonic.startswith("."):
        continue
    if i.mnemonic in ("bl", "blx"):
        for op in i.operands:
            if op.type == capstone.arm.ARM_OP_IMM and op.imm in targets:
                found[op.imm].append(i.address)

for t, name in sorted(targets.items(), key=lambda x: x[0]):
    locs = found[t]
    print(f"0x{t:05x} {name}: {len(locs)}곳")
    for l in locs[:80]:
        print(f"    0x{l:08x}")
