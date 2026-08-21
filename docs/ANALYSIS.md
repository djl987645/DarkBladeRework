# 다크블레이드 개조 분석 노트

## 1. 크래시 체인 (최초 실행)

- KtDrmCheckActivity DRM 실패 → `$1.onClick`에서 drmResult != -5면 onDestroy() 직접 호출
- KTInAppActivity.onDestroy에서 NPE 크래시 → `DrmCheck()` 항상 0 반환 패치로 해결

## 2. 실행 후 상태

- 게임 프로세스 생존, SurfaceView 1280x684 생성
- 렌더 루프 정상: `mainTimer → XGraphics::flush → MC_grpFlushLcd → MH_fbFlushLcd → BH_fbFlushLcdWithFrameBuffer → javacall_fb_lock_canvas → Surface.lockCanvas`
- SurfaceFlinger --latency 측정: 약 25fps 프레임 제출 (내용은 검은색)
- 키 입력(keyevent 19/20/21/22/23/66, tap) 무반응

## 3. 검은 화면 원인 규명

### 3.1 백트레이스 (kill -11 SIGSEGV)

Thread-2 (TID 23613):
```
AppThread.run → Java_com_beyond_AppThread_pltStart → AppThread_Start
→ MH_pltStart(+104) → BH_eventq_wait → BH_thread_cond_wait → pthread_cond_wait (futex 대기)
```

**게임이 이벤트 큐에서 영원히 대기 중** — 이벤트가 큐에 도착하지 않음.

### 3.2 MH_pltStart 이벤트 루프 구조 (0x6384)

```
0x6384: 초기화 호출들 (플랫폼/이벤트큐/화면)
0x63e6: 이벤트 루프 시작
  0x63ec: bl 0x6140  ← BH_eventq_wait (이벤트 대기 — 여기서 무한 대기)
  0x63f4: bl 0x64ff4 ← 전역 게터 (이벤트 상태)
  0x641e~: 이벤트 타입 분기
  0x6426: ldr r3, [sp, #4] — 이벤트 타입
  0x6428: cmp r3, #5
  0x642c~0x6436: 타입 5 → bl 0x69450(1), bl 0xbef8 (startClet!) ← 게임 시작 함수
  0x6444: b 0x63ea (루프백)
```

- 이벤트 타입 5 = 게임 시작 이벤트 → startClet(0xbef8) 호출
- startClet: 게임 로직 시작 함수 (게임 메뉴/타이틀 초기화)
- 이벤트 5를 큐에 넣는 플랫폼 미들웨어가 동작하지 않음 → 루프에 갇힘

### 3.3 이벤트 큐 함수들

- BH_eventq_init (0x631c) — 큐 초기화
- BH_eventq_wait (0x6140) — 대기 (head==tail이면 pthread_cond_wait)
- BH_eventq_add (0x61a8) — 이벤트 추가 (내부: 0x5f60 큐 push + 0x619c 시그널)
- eventq 전역: 0x1bcbfc (.bss)

### 3.4 게임 데이터 확인

- assets/res.dat: 정상 ZIP (항목: `%d/_[%03d].lz` 형식 LZMA 압축)
- /data/data/com.mobicle.darkblade/files/: DARK_OPTION, DARK_SYSTEM, lzma 생성됨
- 런타임 fd: base.apk(fd 49)만 열림, res.dat fd 없음 — Java 레벨에서 res.dat 접근
- Java 경로: ImageBridge.getInputStream → JletActivity.getResource → ZipIo.getInputStream (res.dat ZIP 검색) → 실패 시 AssetManager 폴백

## 4. 적용 패치 상세

### 4.1 libLauncher.so 이벤트 강제 주입

**목적**: 이벤트 큐 대기 없이 startClet을 1회 강제 호출

**위치 1** (0x63ea~0x63f9, 16B):
```
원본: 28 1c ff f7 a8 fe 00 28 fa d1 5e f0 fe fd   (일부)
패치: 02 98 05 28 02 d0 05 20 01 90 02 90 5e f0 fd fd
```
```
0x63ea: ldr r0, [sp, #8]     ; 플래그 확인
0x63ec: cmp r0, #5
0x63ee: beq 0x63f6           ; 이미 주입됨 → 스킵
0x63f0: movs r0, #5
0x63f2: str r0, [sp, #4]     ; 이벤트 타입 = 5
0x63f4: str r0, [sp, #8]     ; 플래그 = 5 (1회성)
0x63f6: bl 0x64ff4           ; (원래 흐름 유지, 인코딩 재계산)
```

**위치 2** (0x6440~0x6443, 4B):
```
원본: (bl 0x61ec — 화면 크기 설정)
패치: 00 23 01 93
```
```
0x6440: movs r3, #0
0x6442: str r3, [sp, #4]     ; startClet 후 이벤트 타입 리셋 (재호출 방지)
```

**인코딩 주의**:
- Thumb-2 BL은 PC = 명령어 주소 + 4 기준 (Align 아님)
- 이동된 bl의 인코딩은 keystone으로 생성: `bl 0x64ff4 @0x63f6 = 5e f0 fd fd`
- 12B 이상 패치 시 뒤따르는 4B 명령어가 분리되어 SIGILL 발생 (0x63f6 사고 교훈)

## 5. 테스트 결과 (v0.8.3)

- Thread-2 상태: S(대기, 이벤트 큐) → **R(실행)** 전환 성공
- utime 10390 → 48525 (게임 루프 활발히 실행 중)
- 화면: 여전히 검은색 (리소스 로드 HERMES_DBG 로그 0건)
- 후속 과제: startClet 이후 이미지 리소스 로드 경로 진입 실패 원인

## 6. 남은 미해결

- 게임이 이미지 로드를 시작하지 않는 원인 (HERMES_DBG 로그 패치: ImageBridge/ZipIo/JletActivity — 호출 0건)
- res.dat → byte[] → 네이티브 전달 경로 (getAssetResZip @ AppThread.smali:1336)
- startClet 내부 분석 (0xbef8, 940B) — 게임 상태 머신 초기화 검증

## 7. 참고 심볼

- mainTimer: 0xbd28 (게임 루프 타이머)
- startClet: 0xbef8 (게임 시작)
- MENU::draw_Menu: 0x32564 (점프 테이블 35개)
- MH_pltStart: 0x6384 (플랫폼 시작 → 이벤트 루프)
- AppThread_Start: 0x3f8c
- BH_eventq_wait: 0x6140, BH_eventq_add: 0x61a8
- XImage::creatImageLzma: 0x5f321
- javacall_getInformation: 0x3bcc
- "lzma" 문자열: 0x10f2e0, "DARK_SYSTEM": 0x71cc8
