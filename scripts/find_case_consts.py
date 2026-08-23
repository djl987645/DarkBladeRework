import struct
d=open('docs/libLauncher_original.so','rb').read()

# 검색 대상: 0x4B4(1204), 0x4C2(1218), 0x12D0(4816), 0xE(14)
targets = {0x4B4:'1204(케이스 차이)', 0x4C2:'1218(케이스 1218)', 0x12D0:'4816(주소 차이)', 0xE:'14(케이스 14)'}

print('=== 32비트 리터럴 값 검색 (.text 0x2ac8~0x70f6c + .rodata 0x70f6c~0x1b55bc) ===')
for t, name in targets.items():
    hits=[]
    for a in range(0x2ac8, 0x1b55bc-3, 2):
        v = struct.unpack('<I', d[a:a+4])[0]
        if v == t:
            hits.append(hex(a))
    print('%s (0x%x): %d건 %s' % (name, t, len(hits), ', '.join(hits[:30])))

print()
print('=== movw/movt imm16 검색 (Thumb-2: movw 0xF240, movt 0xF2C0) ===')
import re
for t, name in [(0x4B4,'1204'), (0x4C2,'1218'), (0x12D0,'4816')]:
    hits=[]
    for a in range(0x2ac8, 0x70f6c, 2):
        h = struct.unpack('<H', d[a:a+2])[0]
        if (h & 0xFBF0) == 0xF240:  # movw
            h2 = struct.unpack('<H', d[a+2:a+4])[0]
            imm4 = (h2 >> 12) & 0xF
            i = ((h >> 4) & 0xF) | ((h2 >> 4) & 0xF) << 4 | ((h2 >> 0) & 0xFF) << 8 | imm4 << 12
            if i == t:
                hits.append('movw 0x%05x' % a)
        if (h & 0xFBF0) == 0xF2C0:  # movt
            h2 = struct.unpack('<H', d[a+2:a+4])[0]
            imm4 = (h2 >> 12) & 0xF
            i = ((h >> 4) & 0xF) | ((h2 >> 4) & 0xF) << 4 | ((h2 >> 0) & 0xFF) << 8 | imm4 << 12
            if i == t:
                hits.append('movt 0x%05x' % a)
    print('%s (0x%x): %d건 %s' % (name, t, len(hits), ', '.join(hits[:30])))
