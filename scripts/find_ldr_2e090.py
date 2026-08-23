import struct
d=open('docs/libLauncher_original.so','rb').read()

# 0x2e090을 ldr [pc]로 읽는 모든 코드 찾기 (16비트 + 32비트 ldr literal)
def find_ldr_pc_target(target):
    hits=[]
    for a in range(0x2ac8, 0x70f6c-4, 2):
        h = struct.unpack('<H', d[a:a+2])[0]
        if (h & 0xF800) == 0x4800:
            rt = (h >> 8) & 0x7
            imm = (h & 0xFF) << 2
            pc = (a + 4) & ~3
            if pc + imm == target:
                hits.append((a, 'ldr r%d, [pc,#0x%x]' % (rt, imm)))
        else:
            h2 = struct.unpack('<H', d[a+2:a+4])[0]
            if (h & 0xFBFF) == 0xF8DF:
                rt = (h2 >> 12) & 0xF
                imm = (h2 & 0xFFF)
                pc = (a + 4) & ~3
                if pc + imm == target:
                    hits.append((a, 'ldr.w r%d, [pc,#0x%x]' % (rt, imm)))
    return hits

for t in [0x2e090, 0x2e0c8, 0x2e0cc, 0x2e0b0]:
    hits = find_ldr_pc_target(t)
    print('0x%06x 읽는 코드: %s' % (t, hits[:12]))
