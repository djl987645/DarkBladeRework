import capstone
import struct

path = "/tmp/libLauncher_analysis.so"
data = open(path, "rb").read()

# ELF vaddr -> file offset 매핑
# 간단히: readelf 섹션 헤더에서 .text의 vaddr/offset 사용
import subprocess
out = subprocess.run(["readelf", "-S", path], capture_output=True, text=True).stdout
text_vaddr = text_offset = None
for line in out.splitlines():
    if ".text" in line and "PROGBITS" in line:
        parts = line.split()
        # [Nr] Name Type Address Off Size ...
        text_vaddr = int(parts[4], 16)
        text_offset = int(parts[5], 16)
        break
print(f".text vaddr={hex(text_vaddr)} off={hex(text_offset)}")

def disasm(addr, size, mode_thumb=True):
    off = text_offset + (addr - text_vaddr)
    code = data[off:off+size]
    md = capstone.Cs(capstone.CS_ARCH_ARM, capstone.CS_MODE_THUMB if mode_thumb else capstone.CS_MODE_ARM)
    md.detail = False
    lines = []
    for i in md.disasm(code, addr):
        lines.append(f"0x{i.address:08x}: {i.mnemonic:8s} {i.op_str}")
    return lines

for name, addr, size, thumb in [
    ("mainTimer", 0xbd29, 464, True),
]:
    print(f"\n===== {name} @ {hex(addr)} =====")
    for l in disasm(addr, size, thumb):
        print(l)
