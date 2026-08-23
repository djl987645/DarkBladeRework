import struct
d=open('docs/libLauncher_original.so','rb').read()

# 0x2dfc8: ldr r2,[pc,#0xe4] → r2=[0x2e0b0]=0xfff442b8=-0xBBD48
# r0=this([sp,#0x34]), r2=this-0xBBD48(테이블베이스), r3=[r2+r4*4], pc=r3+r2
# 케이스 14 타깃 = 0x2e0c8 (ART JIT 실측)
# 조건: A(테이블베이스 파일오프) + [A+14*4] = 0x2e0c8  (A ∈ .rodata)
# this ∈ .bss → A = this_off - 0xBBD48 ∈ [0x1bc828-0xBBD48, 0x1cc6c4-0xBBD48] = [0x100AE0, 0x110B7C]

found=[]
for A in range(0x100AE0, 0x110B7C, 4):
    v14 = struct.unpack('<i', d[A+56:A+60])[0]
    tgt = (A + v14) & 0xffffffff
    if tgt == 0x2e0c8:
        found.append(A)
        print('★★★ 테이블베이스 A = 0x%05x, [A+56] = %d (0x%08x) → 타깃 0x2e0c8!' % (A, v14, v14 & 0xffffffff))
        # 이 테이블의 29개 엔트리 전체 출력
        print('   테이블 엔트리 (케이스 0~28):')
        for i in range(29):
            v = struct.unpack('<i', d[A+i*4:A+i*4+4])[0]
            tt = (A + v) & 0xffffffff
            mark = ' ★' if tt == 0x2e0c8 else ''
            print('   [%2d] %+d (0x%08x) → 0x%05x%s' % (i, v, v & 0xffffffff, tt, mark))

if not found:
    print('조건 만족 없음 — this가 .bss가 아닐 수도, 케이스14가 아닐 수도')
    # A+[A+N*4]=0x2e0c8 for any N in 0..28
    print()
    print('=== 모든 N에 대해 A+[A+N*4]=0x2e0c8 탐색 ===')
    for A in range(0x100AE0, 0x110B7C, 4):
        for N in range(29):
            v = struct.unpack('<i', d[A+N*4:A+N*4+4])[0]
            if ((A + v) & 0xffffffff) == 0x2e0c8:
                print('A=0x%05x N=%d v=%d (0x%08x)' % (A, N, v, v & 0xffffffff))
