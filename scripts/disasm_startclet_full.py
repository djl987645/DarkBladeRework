import capstone
data = open("/tmp/libLauncher_analysis.so", "rb").read()

# 알려진 심볼 (ANALYSIS.md 기준)
syms = {
    0xbd28: "mainTimer (게임 루프 타이머)",
    0xbef8: "startClet (게임 시작)",
    0x32564: "MENU::draw_Menu (점프 테이블 35개)",
    0x6384: "MH_pltStart (플랫폼 시작)",
    0x3f8c: "AppThread_Start",
    0x6140: "BH_eventq_wait",
    0x61a8: "BH_eventq_add",
    0x5f321: "XImage::creatImageLzma",
    0x3bcc: "javacall_getInformation",
}

def resolve(t):
    best = None
    for base, name in syms.items():
        if base <= t < base + 0x1000:
            off = t - base
            best = f"{name}+0x{off:x}" if off else name
            break
    return best

def disasm_range(start, size, thumb=True):
    code = data[start:start+size]
    md = capstone.Cs(capstone.CS_ARCH_ARM, capstone.CS_MODE_THUMB if thumb else capstone.CS_MODE_ARM)
    md.detail = True
    return list(md.disasm(code, start))

print("===== startClet @ 0xbef8 (940B) 전체 =====\n")
calls = []
for i in disasm_range(0xbef8, 940):
    line = f"0x{i.address:08x}: {i.mnemonic} {i.op_str}"
    print(line)
    if i.mnemonic in ("bl", "b", "bx", "blx"):
        for op in i.operands:
            if op.type == capstone.arm.ARM_OP_IMM:
                t = op.imm
                r = resolve(t)
                calls.append((i.address, i.mnemonic, t, r))

print("\n===== 호출/분기 대상 목록 =====\n")
for src, mn, t, r in calls:
    print(f"0x{src:08x}: {mn} 0x{t:08x}  {('-> ' + r) if r else ''}")
