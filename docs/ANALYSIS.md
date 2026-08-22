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

## 8. startClet(0xbef8) 내부 분석 (Cycle A, 2026-08-22)

### 8.1 함수 구조 (940B 전체 디스어셈블 완료)

프롤로그: 스택 카나리 저장 + 전역 플래그 3개 클리어.
핵심: startClet은 **이미지 로딩을 직접 하지 않음** — 설정 구조체 초기화까지 수행 후 반환.
이미지 로딩은 별도 경로(8.3 참조)이며, 이벤트 루프(0x6384)가 타입5 이벤트로 startClet을
재호출하는 구조.

### 8.2 호출 그래프 (호출 순서)

```
0x4f43c   — startClet 전용 초기화 (유일 호출처=startClet)
0x4e544   — 범용 헬퍼 (47곳 호출; 반환값이 성공 플래그, r6에 보존)
0x6710    — 10개 원소 배열 초기화 (인자 ptr, 0xa)
0x5eb7c   — 전용 초기화 2
0x58624   — 전역 객체 초기화 (startClet 전용)
0x585e8   — 전역 객체 초기화 2연타
0x613c4   — 객체 부재 가드 ×2 (반환 1=객체 없음; 있으면 0x58470/0x58440로 우회)
0x2cc34   — 전용 초기화 (유일 호출처)
0x584f0   — 전용 초기화
0x104e4   — 11 halfword 좌표 구조체 초기화 (2회)
0xf898    — 항목 수 조회 (r1=count, r0=size; 0이면 루프 스킵)
0xfe34    — 9항목 좌표 보정 루프 (점프테이블, 음수 보정 시 0x2a80 호출)
0x5e34    — 전용 초기화 (r0=0, r1=2)
0x6608    — 전용 초기화 (상태 설정)
0x6828    — 전용 초기화 (r2=0x32=50)
0xb9fc    — ★ 설정 구조체 세터 (마지막 호출)
```

조기 종료 분기 4곳: 0xbf76(→0xc1fe), 0xbf8c(→0xc20a), 0xbfb4(→0xc202),
0xbfce(→0xc1f4), 0xbffc(→0xc214) — 전역 객체 상태/플래그에 따라 일부 초기화 스킵
후 정상 진행하는 구조 (치명적 조기 종료 아님).

### 8.3 0xb9fc = 전역 설정 구조체 세터 (159곳 호출 — 게임 전역 설정 API)

```
인자 10개: r0,r1,r2,r3,[sp+0x10],[sp+0x14],[sp+0x18],[sp+0x1c],[sp+0x20],[sp+0x24]
→ 전역 구조체 오프셋 0x00,0x04,0x08,0x0c,0x10,0x14,0x18,0x1c,0x20,0x24
각 필드는 인자 >= 0 일 때만 저장 (-1 = "변경 안 함" 의미)
마지막에 +0x28~0x38 5워드 = 0 클리어
```

startClet은 (0,1,0,0,0,0,0,0,0,0) 호출 → 필드0=0, 필드1=1, 나머지 0 초기화.
draw_Menu 내부(0x325c0)에서는 (-1,5,0,...) 호출 → 사운드(필드1)=5 설정.
즉 **게임 설정(사운드/진동/난이도 등) 저장소**로 추정.

### 8.4 이미지 로딩 경로 지도 (게임 상태 머신 관점)

```
이벤트 루프(0x6384, 타입5) → startClet(0xbef8) → 설정 초기화(0xb9fc)
   └→ draw_Menu(0x32564): 전역 상태(+4) 값 0~35 점프테이블 → 상태별 draw 핸들러
        └→ 상태0 핸들러 0x16660: 화면 클리어(0x5d74c) + 텍스트/버튼 배치(0x608d8,
            0x58b08) — ★ 이미지 슬롯 로드 직접 호출 없음
리소스 로드 함수: 0x40020 (대형, 4곳에서 호출: 0x40958/0x40b78/0x40b9e/0x40cd6)
   └→ img_slot_dispatch(0x5de2c): 78곳 호출 — 슬롯 상태(+0x21 바이트) 확인 →
        미로드 시 데이터 포인터에서 포맷 문자열 비교("lzma" vs 기타, blx 0x29e4)
        → 같으면 XImage::creatImageLzma(0x5f321), 다르면 0x5f24c(대체 생성자)
        ★ creatImageLzma 유일 콜 사이트 = 0x5deaa
```

### 8.5 결론 (이번 사이클 판정)

- startClet은 정상 완주 구조 — v0.4b에서 HERMES_DBG 3건 확인된 것과 일치.
- 검은 화면의 관문은 **draw_Menu 진입 여부 + 리소스 로드 함수(0x40020 계열) 호출
  여부**로 좁혀짐. 상태0 draw 핸들러(0x16660)는 이미지 로드를 부르지 않으므로,
  "리소스 로드 단계"로의 상태 전이가 일어나지 않으면 영구 검정 화면이 됨.
- 다음 단계 후보: ① 0x32564/0x16660/0x40020/0x5de2c 진입 계측
  (libLauncher.so 네이티브 __android_log_print 패치 — GOT 0x1bb998 경유 가능,
  liblog.so NEEDED 확인됨) ② 상태 전이 트리거 이벤트 조사.

