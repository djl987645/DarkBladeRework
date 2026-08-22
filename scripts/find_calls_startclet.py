import capstone
data = open("/tmp/libLauncher_analysis.so", "rb").read()
md = capstone.Cs(capstone.CS_ARCH_ARM, capstone.CS_MODE_THUMB)

# .text 범위 (vaddr == offset) — find_calls.py 패턴
TEXT_START, TEXT_END = 0x2ac8, 0x70f6c

# 관심 타깃: creatImageLzma + startClet의 하위 호출들
targets = {
    0x5f321: "XImage::creatImageLzma",
    0xb9fc: "game_start(0xb9fc)",
    0x613c4: "state_getter(0x613c4)",
    0x29e4: "runtime_call_0x29e4",
    0x2a80: "runtime_call_0x2a80",
    0x2a8c: "runtime_call_0x2a8c",
    0x2828: "stack_chk_fail(0x2828)",
    0xf898: "proc_0xf898",
    0xfe34: "proc_0xfe34",
    0x104e4: "proc_0x104e4",
    0x6710: "plat_0x6710",
    0x6608: "plat_0x6608",
    0x6828: "plat_0x6828",
    0x4f43c: "init_0x4f43c",
    0x4e544: "init_0x4e544",
    0x5eb7c: "init_0x5eb7c",
    0x58624: "init_0x58624",
    0x585e8: "init_0x585e8",
    0x2cc34: "init_0x2cc34",
    0x584f0: "init_0x584f0",
    0x5e34: "init_0x5e34",
    0x58440: "init_0x58440",
    0x58470: "init_0x58470",
    0x6384: "MH_pltStart(이벤트 루프)",
}

found = {t: [] for t in targets}
for i in md.disasm(data[TEXT_START:TEXT_END], TEXT_START):
    if i.mnemonic in ("bl", "blx"):
        try:
            tgt = int(i.op_str.strip("'# "), 16)
            if tgt in targets:
                found[tgt].append(i.address)
        except Exception:
            pass

for t, name in sorted(targets.items(), key=lambda x: x[0]):
    locs = found[t]
    print(f"0x{t:05x} {name}: {len(locs)}곳")
    for l in locs[:60]:
        print(f"    0x{l:08x}")
