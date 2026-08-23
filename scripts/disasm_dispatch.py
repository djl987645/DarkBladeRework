import struct
from capstone import Cs, CS_ARCH_ARM, CS_MODE_THUMB
d=open('docs/libLauncher_original.so','rb').read()
md=Cs(CS_ARCH_ARM, CS_MODE_THUMB); md.detail=True

def dis(addr, n):
    out=[]
    for i in md.disasm(d[addr:addr+n], addr):
        out.append('0x%05x: %-12s %s' % (i.address, i.mnemonic, i.op_str))
    return out

print('=== 0x2df90 ~ 0x2e030 (디스패치 + 범위밖 처리) ===')
print('\n'.join(dis(0x2df90, 0xA0)))
print()
print('=== 0x2e000 (범위 밖 기본 핸들러) ~ 0x2e090 ===')
print('\n'.join(dis(0x2e000, 0x90)))
print()
# 0x2dfc8~0x2dfd4의 ldr r2,[pc,#0xe4] → [0x2e0b0] 확인
print('=== 리터럴 0x2e0b0 = 0x%08x ===' % struct.unpack('<I', d[0x2e0b0:0x2e0b4])[0])
