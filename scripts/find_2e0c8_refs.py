import struct
d=open('docs/libLauncher_original.so','rb').read()
# 0x2e0c8 / 0x730a4 / 0x2e090 / 0x2e0d0 이 값으로 저장된 곳 전수 스캔
# (코드+rodata+data 전체! Thumb 비트 변형 포함)
targets = {
    0x2e0c8: [], 0x2e0c9: [],   # Thumb 비트 포함
    0x730a4: [], 0x730a5: [],
    0x2e090: [], 0x2e0d0: [],
    0x2e0d1: [], 0x2e109: [],  # 케이스 14 진짜 핸들러 후보(0x2e108+1)
}
for a in range(0, len(d)-3, 4):
    v = struct.unpack('<I', d[a:a+4])[0]
    if v in targets:
        targets[v].append(hex(a))
for k, v in targets.items():
    print('0x%06x: %s' % (k, v if v else '0건'))
