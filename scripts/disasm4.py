import capstone
import subprocess

path = "/tmp/libLauncher_analysis.so"
data = open(path, "rb").read()
out = subprocess.run(["readelf", "-S", path], capture_output=True, text=True).stdout
for line in out.splitlines():
    if ".text" in line and "PROGBITS" in line:
        parts = line.split()
        text_vaddr = int(parts[4], 16)
        text_offset = int(parts[5], 16)
        break

def disasm(addr, size, thumb=True):
    off = text_offset + (addr - text_vaddr)
    code = data[off:off+size]
    md = capstone.Cs(capstone.CS_ARCH_ARM, capstone.CS_MODE_THUMB if thumb else capstone.CS_MODE_ARM)
    return [(f"0x{i.address:08x}", f"{i.mnemonic} {i.op_str}") for i in md.disasm(code, addr)]

print("===== BH_fbFlushLcdWithFrameBuffer @ 0x58d0 (752B) =====")
for a, l in disasm(0x58d0, 752):
    print(f"{a}: {l}")
