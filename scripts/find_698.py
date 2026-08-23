import struct
d=open('docs/libLauncher_original.so','rb').read()
hits=[]
for a in range(0x2ac8, 0x70f6c, 4):
    v=struct.unpack('<I', d[a:a+4])[0]
    if v in (0x698, 0x660, 0x6A0): hits.append((hex(a), hex(v)))
print('리터럴 0x698/0x660/0x6A0:', hits)
hits2=[]
for a in range(0x2ac8, 0x70f6c-4, 2):
    h1, h2 = struct.unpack('<HH', d[a:a+4])
    if (h1 & 0xFBF0) == 0xF240 or (h1 & 0xFBF0) == 0xF2C0:
        imm4 = (h1 >> 4) & 0xF
        i = (h1 >> 10) & 1
        imm3 = (h2 >> 12) & 0x7
        imm8 = h2 & 0xFF
        imm16 = (imm4 << 12) | (i << 11) | (imm3 << 8) | imm8
        if imm16 in (0x698, 0x660, 0x6A0): hits2.append((hex(a), hex(imm16)))
print('movw/movt:', hits2)
