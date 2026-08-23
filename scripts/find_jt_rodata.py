import struct
d=open('docs/libLauncher_original.so','rb').read()

# 0x2dfc8: ldr r2,[pc,#0xe4] → [0x2dfca+4+0xe4] = [0x2e0b2&~3]... 실제로는 0x2e0b0
# r2 = [0x2e0b0] = 0xfff442b8 (음수 = -0xBBD48)
# r2 = r0(this) + 0xfff442b8 = this - 0xBBD48
# r3 = [r2 + r4*4] → 테이블[r4]
# pc = r3 + r2

# this = 0xc167ed50 (16:21 크래시 r5), base = 0xc1471000 (16:21)
# 테이블베이스(this 기준) = this - 0xBBD48
# 그런데 ART JIT가 0x2e0c8을 호출 → pc = 0x2e0c8 (파일 오프셋)
# 파일 오프셋 기준으로 보면: pc(파일) = 0x2e0c8
# 테이블 베이스(파일) = this - 0xBBD48 에서 this도 파일 오프셋으로?
# this는 런타임 주소! 그런데 테이블 자체는 .rodata에 있어야...
# 실은: r2 = r0 + 0xfff442b8. r0 = this(런타임). 
# 하지만 점프 타깃 0x2e0c8은 .so 내부! 
# 그렇다면 this도 .so 내부여야 함! this = .so 내부 객체!
# this = base + X, 테이블 = base + (X - 0xBBD48) = .rodata 내!
# X - 0xBBD48 ∈ [0x70f6c, 0x1b55bc] → X ∈ [0x12CCC4, 0x1D1304]
# 0x1D1304 > 0x1cc6c4(.bss 끝) → X ∈ [0x12CCC4, 0x1cc6c4]

# 16:21 실측: r5 = 0xc167ed50, base = 0xc1471000 → X = 0x20DD50?? 
# 아니! 0xc167ed50 - 0xc1471000 = 0x20DD50 > 0x1cc6c4! .so 밖!
# 잠깐! r5는 this가 아닐 수 있음! 크래시 당시 r5 = 0xc167ed50!

# 다른 방법: 테이블 베이스를 .rodata에서 직접 찾기!
# 테이블[r4] + 테이블베이스 = 점프 타깃. 점프 타깃들 = 0x2e000~0x2e0d0 부근 케이스들
# 테이블 = this - 0xBBD48. this = .so 내 어딘가(객체) 
# 그러면 테이블 = .so 내부 고정 위치! X - 0xBBD48!
# this가 .bss(0x1bc828~)에 있으면 테이블 = 0x1bc828-0xBBD48 = 0x100AE0 (아직 .rodata)
# this가 0x1cc6c4 끝이면 테이블 = 0x110B7C (.rodata 끝 0x1b55bc보다 작음)
# → 테이블 ∈ [0x100AE0, 0x110B7C] 구간?! 아냐! this는 .bss 어디든!
# this ∈ [0x1bc828, 0x1cc6c4] → 테이블 ∈ [0x100AE0, 0x110B7C]
# .rodata 0x100AE0~0x110B7C 구간에서 상대 오프셋 테이블 찾기!

# 케이스 수: cmp r4,#0x1c; bhi → r4 ∈ [0, 0x1c] = 29개!
# 테이블[r4] = 4B 상대 오프셋 (pc = r3 + r2!)
# 점프 타깃(파일) = 테이블베이스 + 테이블[r4] = (this-0xBBD48) + 테이블[r4]
# this ∈ [0x1bc828, 0x1cc6c4] 가정 시 테이블 ∈ [0x100AE0, 0x110B7C]
# 점프 타깃들: 0x2e000~0x2e0d0 부근 (draw_MunjangStore 내부 케이스들!)

# 타깃 오프셋 = 테이블[r4] + 테이블베이스. 
# 타깃이 .text(0x2ac8~0x70f6c)여야 하므로:
# 테이블베이스 + 테이블[r4] ∈ [0x2ac8, 0x70f6c]
# 테이블[r4] = 상대 오프셋. 테이블베이스 ∈ [0x100AE0, 0x110B7C]
# 테이블[r4] ∈ [0x2ac8-0x110B7C, 0x70f6c-0x100AE0] = [-0xE0EB4, -0x8FE74] → 대부분 음수!

# .rodata 0x100AE0~0x110B7C에서 4B 값들이 대부분 음수(0xF1xxxx~0xF7xxxx)인 테이블 찾기!
import struct
print('=== .rodata 0x100AE0~0x110B7C 4B 덤프 (상대오프셋 후보) ===')
for a in range(0x100AE0, 0x110B7C, 4):
    v = struct.unpack('<i', d[a:a+4])[0]
    tgt = v + a  # 테이블베이스=파일위치 가정 시 타깃
    if 0x2ac8 <= tgt <= 0x70f6c:
        print('0x%05x: %+d (0x%08x) → 0x%05x' % (a, v, v & 0xffffffff, tgt))
