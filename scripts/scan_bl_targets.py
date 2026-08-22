import struct
data = open("/tmp/libLauncher_analysis.so", "rb").read()

# Thumb-2 BL/BLX immediate 인코딩 raw 스캔 (정렬 무관)
# half1: 11110 S imm10  (0xF800~0xFBFF)
# half2: 11 J1 1 J2 imm11 (0xD000~0xDFFF)
def scan_bl(start, end):
    hits = []
    i = start
    while i + 4 <= end:
        h1 = struct.unpack_from("<H", data, i)[0]
        h2 = struct.unpack_from("<H", data, i + 2)[0]
        if (h1 & 0xF800) == 0xF000 and (h2 & 0xD000) == 0xD000:
            S = (h1 >> 10) & 1
            imm10 = h1 & 0x3FF
            J1 = (h2 >> 13) & 1
            J2 = (h2 >> 11) & 1
            imm11 = h2 & 0x7FF
            # I1 = NOT(J1 XOR S), I2 = NOT(J2 XOR S)
            I1 = 1 - (J1 ^ S)
            I2 = 1 - (J2 ^ S)
            imm = (S << 24) | (I1 << 23) | (I2 << 22) | (imm10 << 12) | (imm11 << 1)
            if S:
                imm -= (1 << 25)
            pc = (i + 4) & ~3  # Thumb: PC = Align(addr+4, 4)
            tgt = pc + imm
            # 분기 종류: half2 bit12=1 → BL (link), =0 → BLX... 실제로 0xD000|0x1000 이면 BL
            is_bl = (h2 & 0x1000) != 0
            hits.append((i, tgt, is_bl))
        i += 2
    return hits

TEXT_START, TEXT_END = 0x2ac8, 0x70f6c

targets = {
    0x5f321: "XImage::creatImageLzma",
    0xb9fc: "game_start(0xb9fc)",
    0x613c4: "state_getter(0x613c4)",
    0x29e4: "runtime_0x29e4",
    0x2a80: "runtime_0x2a80",
    0x2a8c: "runtime_0x2a8c",
    0x2828: "stack_chk_fail",
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
}

hits = scan_bl(TEXT_START, TEXT_END)
print(f"BL/BLX 총 {len(hits)}건\n")
found = {t: [] for t in targets}
for src, tgt, is_bl in hits:
    if tgt in targets:
        found[tgt].append(src)

for t, name in sorted(targets.items()):
    locs = found[t]
    print(f"0x{t:05x} {name}: {len(locs)}곳")
    for l in locs[:40]:
        print(f"    0x{l:08x}")
