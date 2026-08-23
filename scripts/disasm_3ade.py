import struct
from capstone import Cs, CS_ARCH_ARM, CS_MODE_THUMB
d=open('docs/libLauncher_original.so','rb').read()
md=Cs(CS_ARCH_ARM, CS_MODE_THUMB); md.detail=True

# 0x03ade = GetMethodID(0x2ad4) 호출부. 이 함수의 시작을 찾자 (push 프롤로그 역추적)
# 0x03ade 앞쪽에서 push {.., lr} 찾기
start = 0x3a00
print('=== 0x3a00 ~ 0x3c00 전체 ===')
out = []
for i in md.disasm(d[start:0x3c00], start):
    out.append('0x%05x: %-14s %s' % (i.address, i.mnemonic, i.op_str))
print('\n'.join(out))
