import struct
from capstone import *
from capstone.arm import *

d = open('docs/libLauncher_original.so','rb').read()
base = 0x2DA30
end  = 0x2e0d0
md = Cs(CS_ARCH_ARM, CS_MODE_THUMB)
md.detail = True

code = d[base:end]
for ins in md.disasm(code, base):
    # r1 쓰기 관련 명령만 필터
    mnem = ins.mnemonic
    ops = ins.op_str
    if 'r1' in ops and any(k in mnem for k in ['mov','ldr','add','sub','orr','and','eor','mvn','pop','ldmia','ldm']):
        # write 대상이 r1인지 (op_str 첫 번째 피연산자)
        first = ops.split(',')[0].strip()
        if first == 'r1':
            print(f"{hex(ins.address)}: {ins.mnemonic} {ins.op_str}")
