import struct
d=open('docs/libLauncher_original.so','rb').read()

# 0x12D0 = 0x000012D0! 리터럴 검색
hits=[]
for a in range(0x2ac8, 0x70f6c, 4):
    v=struct.unpack('<I', d[a:a+4])[0]
    if v==0x12D0: hits.append(hex(a))
print('리터럴 0x12D0:', hits)

# movw #0x12D0
hits2=[]
for a in range(0x2ac8, 0x70f6c-4, 2):
    h1, h2 = struct.unpack('<HH', d[a:a+4])
    if (h1 & 0xFBF0) == 0xF240 or (h1 & 0xFBF0) == 0xF2C0:
        imm4 = (h1 >> 4) & 0xF
        i = (h1 >> 10) & 1
        imm3 = (h2 >> 12) & 0x7
        imm8 = h2 & 0xFF
        imm16 = (imm4 << 12) | (i << 11) | (imm3 << 8) | imm8
        if imm16 == 0x12D0: hits2.append(hex(a))
print('movw/movt #0x12D0:', hits2)

# 0x2f398 근처에서 "PC 상대" 계산: sub rN, pc, #imm 또는 ldr rN, [pc] 후 sub
# 0x2f340~0x2f3a0 리터럴 풀 확인
print()
print('=== 0x2f3a0~0x2f440 리터럴 후보 ===')
for a in range(0x2f3a0, 0x2f440, 4):
    v=struct.unpack('<I', d[a:a+4])[0]
    print('0x%05x: 0x%08x' % (a, v))
