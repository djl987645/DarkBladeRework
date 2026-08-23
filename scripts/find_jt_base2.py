import struct
from capstone import Cs, CS_ARCH_ARM, CS_MODE_THUMB
d=open('docs/libLauncher_original.so','rb').read()
md=Cs(CS_ARCH_ARM, CS_MODE_THUMB); md.detail=True

# 가설: this = .rodata 내부 const 객체
# 0x2dfce: r2 = this + 0xfff442b8 = this - 0xBBD48 = 테이블베이스
# 테이블[r4] = [테이블베이스 + r4*4], pc = 테이블[r4] + 테이블베이스
# ART JIT 실측: pc = 0x2e0c8
# → [A + N*4] + A = 0x2e0c8, A = this_off - 0xBBD48
# this_off = .rodata 내부 = [0x70f6c, 0x1b55bc]
# → A ∈ [0x70f6c-0xBBD48, 0x1b55bc-0xBBD48] = [-0x4ADD C, 0xFA074] → A < 0이면 무효
# A >= 0 → this_off >= 0xBBD48! → this_off ∈ [0xBBD48, 0x1b55bc]
# A ∈ [0, 0xFA074]
# 근데 A는 .text/.rodata 내부여야! A ∈ [0x2ac8, 0x1b55bc]
# 이제 [A+N*4]+A = 0x2e0c8 만족하는 A,N 찾기!
print('=== [A+N*4]+A = 0x2e0c8 탐색 (A ∈ [0x2ac8, 0x1b55bc], N ∈ 0..63) ===')
found=0
for A in range(0x2ac8, 0x1b55bc, 4):
    for N in range(64):
        v = struct.unpack('<i', d[A+N*4:A+N*4+4])[0]
        if ((A + v) & 0xffffffff) == 0x2e0c8:
            print('A=0x%05x N=%d v=%d(0x%08x) → 0x2e0c8 ★' % (A, N, v, v&0xffffffff))
            found += 1
if not found:
    print('없음')

# 보조: this 후보를 .rodata에서, this-0xBBD48이 .text(0x2ac8~0x70f6c)가 되는 경우
# this_off - 0xBBD48 ∈ [0x2ac8, 0x70f6c] → this_off ∈ [0xBE610, 0x126AB4]
# .rodata(0x70f6c~0x1b55bc) ∩ [0xBE610, 0x126AB4] = [0xBE610, 0x126AB4]
print()
print('=== this 후보: 0xBE610~0x126AB4 (.rodata), this-0xBBD48 ∈ .text ===')
print('this_off = 0x10F950 가설 → 테이블 = 0x53E08 (.text!)')
A = 0x53E08
print('테이블베이스 A = 0x%05x' % A)
for i in range(64):
    v = struct.unpack('<i', d[A+i*4:A+i*4+4])[0]
    tt = (A + v) & 0xffffffff
    if 0x2ac8 <= tt <= 0x70f6c or v == 0:
        print('  [%2d] %+d (0x%08x) → 0x%05x%s' % (i, v, v&0xffffffff, tt, ' ★' if tt==0x2e0c8 else ''))
