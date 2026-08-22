import capstone, struct
data = open("/tmp/libLauncher_analysis.so", "rb").read()
TEXT_START, TEXT_END = 0x2ac8, 0x70f6c

md = capstone.Cs(capstone.CS_ARCH_ARM, capstone.CS_MODE_THUMB)
md.skipdata = True  # 데이터 풀에서 정렬 유지
md.detail = True

targets = {
    0x5f321: "XImage::creatImageLzma",
    0xb9fc: "fn_0xb9fc(game_start)",
    0x613c4: "fn_0x613c4(state_getter)",
    0x29e4: "fn_0x29e4",
    0x2a80: "fn_0x2a80",
    0x2a8c: "fn_0x2a8c",
    0x2828: "fn_0x2828(stack_chk_fail?)",
    0xf898: "fn_0xf898",
    0xfe34: "fn_0xfe34",
    0x104e4: "fn_0x104e4",
    0x6710: "fn_0x6710",
    0x6608: "fn_0x6608",
    0x6828: "fn_0x6828",
    0x4f43c: "fn_0x4f43c",
    0x4e544: "fn_0x4e544",
    0x5eb7c: "fn_0x5eb7c",
    0x58624: "fn_0x58624",
    0x585e8: "fn_0x585e8",
    0x2cc34: "fn_0x2cc34",
    0x584f0: "fn_0x584f0",
    0x5e34: "fn_0x5e34",
    0x58440: "fn_0x58440",
    0x58470: "fn_0x58470",
    0x6384: "MH_pltStart(이벤트 루프)",
    0x5f320: "creatImageLzma(짝수)",
}
# 0x5f321 홀수 타깃도 짝수/홀수 모두 허용 (Thumb bit)
for t in list(targets):
    targets[t ^ 1] = targets[t] + "(+1)"

found = {t: [] for t in targets}
lit_pools = []  # (src_addr, pool_addr, value)
sweep_insns = 0

for i in md.disasm(data[TEXT_START:TEXT_END], TEXT_START):
    if i.mnemonic.startswith(".byte") or i.mnemonic.startswith(".short") or i.mnemonic.startswith(".word"):
        continue
    sweep_insns += 1
    if i.mnemonic in ("bl", "blx"):
        for op in i.operands:
            if op.type == capstone.arm.ARM_OP_IMM:
                t = op.imm
                if t in targets:
                    found[t].append(i.address)
    elif i.mnemonic == "ldr" and i.operands and i.operands[-1].type == capstone.arm.ARM_OP_MEM:
        op = i.operands[-1]
        mem = op.mem
        if mem.base == capstone.arm.ARM_REG_PC:
            # Thumb: literal 주소 = Align(addr+4,4) + disp
            pc = (i.address + 4) & ~3
            pool_addr = pc + mem.disp
            if TEXT_START <= pool_addr < TEXT_END:
                val = struct.unpack_from("<I", data, pool_addr)[0]
                lit_pools.append((i.address, pool_addr, val))

print(f"스위프 명령어 수: {sweep_insns}, 리터럴 로드 수: {len(lit_pools)}\n")
for t, name in sorted(targets.items(), key=lambda x: x[0]):
    locs = found[t]
    if locs:
        print(f"0x{t:05x} {name}: {len(locs)}곳")
        for l in locs[:60]:
            print(f"    0x{l:08x}")

# 리터럴 풀에서 관심 주소 참조 (간접 호출/함수 포인터)
print("\n===== 리터럴 풀 참조 (관심 주소) =====")
interesting = set(targets.keys()) | {0xbef8}
for src, pool, val in lit_pools:
    if val in interesting or (val & 1) and (val ^ 1) in interesting:
        name = targets.get(val, targets.get(val ^ 1, hex(val)))
        print(f"0x{src:08x}: ldr [pc] -> 0x{val:05x} ({name})")
