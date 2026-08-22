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

---

## 9. Cycle B — 네이티브 계측 실측 (2026-08-22)

### 9.1 목적
libLauncher.so(2008, ARMv5 Thumb)에 __android_log_print 계측을 삽입하여
**실제 실행 경로**를 확정한다. 대상: draw_Menu(0x32564), draw0(0x16660),
resload(0x40020), img_slot_dispatch(0x5de2c), creatImageLzma(0x5f320).

### 9.2 계측 설계 (최종 v6)
- 대상 함수 첫 4B를 Thumb-2 `b.w 로거` (4B)로 교체, 로거가 로그 출력 후
  **원래 1~2번째 명령 재현 → 함수+4로 복귀** (v3 실패: 함수+2 복귀 시
  b.w의 반쪽 halfword 실행 → 크래시)
- **ASLR 대응**: 로거는 PC-relative만 사용. adr로 로거 내부 주소 확보 →
  리터럴에 "타깃 가상주소 − 리터럴 위치" 오프셋 저장 → add로 런타임 실제 주소 계산
  (v2 실패: 절대 주소 0x1bb998 직접 접근 → SEGV_MAPERR)
- **레지스터 보존**: push.w {r0-r3, r4, lr}(일반) / {r0-r3, r5, lr}(draw_Menu)
  — r4 보존 or 리터럴풀 값 설정. blx __android_log_print 후 pop.w 복원
- **로거/문자열은 .rodata 검증된 제로 블록에만 배치**
  (v5 실패: 0x73400~0x734AC의 CP949 메뉴 문자열+16비트 테이블을 덮어 SIGBUS)
  - 로거 4개(일반): 0x732dc~0x7339c / draw_Menu 로거: 0x746c4 (별도 제로 블록)
  - 문자열: 0x74858~ (태그 HERMES_DBG + 메시지 5종)
- 인코딩 함정 (capstone 5.0.7 교차 검증 필수):
  - Thumb-1 ADD(reg): 0001100 **Rm** Rn **Rd** (필드 순서!)
  - ADD T2 Rd는 3비트(r0-r7만), Rm은 4비트 — r12는 T2 ADD 불가
  - ldr.w r3,[r3,#0] = F8D3 3000 (Thumb-1 0x6B18은 capstone이 r0로 오인)
  - halfword 바이트 순서: 바이트 `5f 46` → halfword 0x465F (LE) — 0x5F46은 ldrsh!
  - b.w 오프셋 = 실제 배치 주소 기준 (코드 길이와 별개)

### 9.3 실측 결과 (S8 실기, v0.4b+계측)
```
getResZip → res.dat loaded(3,521,012B)
DBG:draw_Menu(0x32564)          ← draw_Menu 진입 확인!
DBG:imgslot(0x5de2c)  ×4        ← 이미지 슬롯 디스패처 반복 호출
DBG:creatImg(0x5f320) ×4        ← creatImageLzma 실제 호출!
DBG:draw0(0x16660)              ← 미진입 (상태 0 아님)
DBG:resload(0x40020)            ← 미진입 (대형 리소스 로드 경로 미사용)
```
- **이미지 로딩이 실제로 발생** (v0.4b ImageBridge 0건과 대비되는 결정적 변화)
- 크래시 없음, 프로세스 생존, 23프레임 렌더 (검은 화면 유지)
- 검은 화면 관문 재정의: **이미지 로드 부재가 아니라 "상태0(draw0) 미진입 +
  그리기/표시 경로" 문제로 좁혀짐**

### 9.4 draw_Menu 로거 충돌 (중요 함정)
- draw_Menu 로거 포함 시 **SIGBUS(BUS_ADRALN) @ draw_Menu+62 (bl 0x11af8)** 크래시
- 0x11af8 = 상태 ≥ 0x24일 때 호출되는 Java 콜백 경유 함수 (0x608d8/0x2a80 호출)
- draw_Menu 로거 제외 시 정상 동작 — 로거의 r4=리터럴풀 값 설정이
  0x11af8 경로와 충돌하는 것으로 추정 (정확한 메커니즘은 미해명)
- 현행: draw_Menu 로거 제외 4개 계측이 안정 버전

### 9.5 다음 단계 (Cycle C 후보)
① draw_Menu 진입 시 상태값 실측 (0x3258c cmp r3,#0x23 분기 직전)
② creatImageLzma 성공/실패 계측 (0x5f320 진입 후 리턴 경로)
③ 상태 전이 트리거 이벤트 (터치/타이머) 조사

---

## 10. Cycle C — 이미지 로드 실패 루프 확인 (2026-08-22)

### 10.1 imgslot 상태 바이트 실측 (슬롯 번호 → 상태)
- imgslot(0x5de2c) 로거를 "슬롯 상태 바이트" 로그로 개량:
  r0(슬롯 포인터) → [r0+0x21] 상태 바이트 → `imgslot st:%d`
- **결과: `imgslot st:0` ×4 — 동일 슬롯(0xC4A8C250) 4회 연속 로드 시도, 상태 0 유지**
- **creatImageLzma(0x5f320)가 4회 모두 실패** (성공 시 상태 바이트가 0이 아님)
- = 로드 실패 재시도 루프 (v0.4b ImageBridge 0건과 일치하는 검은 화면의 실체)

### 10.2 creatImageLzma 실패 메커니즘 (정적 분석)
- 0x5f32e~0x5f33c: 슬롯+0x21 상태가 1이면 0x5f468(완료 경로) — 0이면 로드 진행
- 0x5f342: bl 0x632cc (디코더 초기화)
- **0x5f34c: ldrb r3, [r7+V3] — 전역 플래그 검사 — 0이면 0x5f44a (즉시 실패!)**
  - r7 = 0x1BB908 (전역 기준), V3 = 0xBEEA8 → **플래그 = 0x27A7B0 (.bss)**
- **플래그 0x27A7B0은 리소스 시스템 초기화 여부를 나타내며, 초기값 0**
- 0x40020(리소스 로드) 미진입 → 초기화 미실행 → 플래그 0 → creatImageLzma 항상 실패
- **검은 화면 원인 체인 확정: 0x40020 미진입 → 플래그 0 → 이미지 로드 실패**

### 10.3 mainTimer 상태값 실측 시도
- mainTimer(0xbd28) 로거 추가: [0x1BCAF0]→+4 상태값 로그 (객체 0이면 st:0)
  - [0x1BCAF0] = draw_Menu의 r4(0x1BC908)+0x1e8 — 상태 객체 포인터 위치
- **결과: `st:-384435303` 1건** — 값이 비정상(0xE936F119), 상태값 해석 불확실
- **mainTimer 로그 1건 = 게임 루프가 1회만 실행 후 정지 상태 유지** (프로세스는 생존)
  - 단, gfxinfo 23프레임과 모순 — mainTimer 호출 빈도 재검증 필요
- 함정: mainTimer 로거 리터럴 5개(tag/fmt/got/상태객체/V7) 구성, 슬롯 0x58

### 10.4 안정 계측 구성 (현행)
- 로거 5개: draw0(0x16660)·resload(0x40020)·imgslot(0x5de2c)·creatImg(0x5f320)
  @0x732dc~0x7339c + mainTimer(0xbd28) @0x746c4
- 문자열 @0x74858~ (태그 + "imgslot st:%d" + "st:%d" 등 6종)
- draw_Menu 로거는 0x11af8 충돌로 제외 유지

### 10.5 다음 단계 (Cycle D 후보)
① 0x40020 콜러 4곳(0x40958/0x40b78/0x40b9e/0x40cd6)의 상위 호출 체인 —
   "어떤 상태 전이가 0x40020을 부르는가"
② 상태 객체 [0x1BCAF0] 정체 재검증 + 상태값 정확 실측
③ 0x632cc(디코더 초기화) 분석 — 플래그 0x27A7B0 설정 주체

## §11. Cycle H — 0x70fe0 SIGILL 해결 + GOT 오염 실측 (2026-08-23)

### 11.1 ARM/Thumb 상태 혼재 규명 (0x2600~0x2a80 = PLT 스텁)
- **0x2600~0x2a80 영역은 Thumb이 아니라 ARM 상태 코드** — 함수 포인터 점프 스텁
  - 각 스텁 12B: `add ip, pc, #0x100000` / `add ip, ip, #0xb9000` / `ldr pc, [ip, #imm]!`
  - ARM 파이프라인(+8): ip = 0x1BB668 고정 → `ldr pc, [ip, #0x2c4]!` → **[0x1BBA8C]**
- **0x2660 스텁 = [0x1BBA8C] = R_ARM_JUMP_SLOT __aeabi_idiv** (이전 "[0x1BB934]=unlockPixels"는 계산 오류)
- [0x1BBA8C] 파일 초기값 0x2604 = .plt 시작 (lazy binding 초기값)
- .plt = 0x2604(크기 0x4c4), .text = 0x2ac8, .got = 0x1BB908
- blx 0x2660 = ARM 상태 전환 → GOT에서 함수 포인터 로드 → 점프 (PLT 구조)

### 11.2 0x70fe0 SIGILL 해결 (ARM bx lr 패치)
- 크래시: 0x70fe0("[JNI] javaCall_openURL" 문자열)에서 SIGILL(ARM 미정의 명령)
- 원인: 함수 포인터가 문자열 주소로 오염 → ARM 상태 점프 → 0x47704770(Thumb bx lr×2가 ARM으로 해석) = 미정의
- **해결: 0x70fe0~0x70ff0을 ARM `bx lr`(0xE12FFF1E)×4로 채움** — lr(0x6DE89, Thumb 비트 1)로 정상 복귀
- 주의: Thumb bx lr(7047)로 채우면 ARM 상태에서 0x47704770 = 미정의 → SIGILL 유지 (4j-4g2 이중 패치 버그)

### 11.3 이미지 로드 실측 (creatImg 슬롯)
- creatImg(0x5f320) 로거 확장: `creatImg sl:%x` (raw_r0=True — 슬롯 포인터 출력)
- **실측: 슬롯 3개 로드** — sl:c1721110, c1721eb4, c1720f3c (힙, 간격 불규칙 0xDA4/-0x1D4)
- imgret:27576 (0x6BB8) — 첫 슬롯 이미지 27,576B 로드 성공
- 슬롯 배열 베이스 = [0x1BBAC6] (GOT 내부 전역 포인터, 런타임에 힙 주소)

### 11.4 __aeabi_idiv GOT 오염 실측 (핵심 발견)
- mainTimer 픽서에 idiv:%x 로그 추가 → **[0x1BBA8C] = base+0x1BB998 (GOT 엔트리 주소)** 로 오염
  - base+0x1BB998 = __android_log_print GOT 슬롯 "주소" (함수 주소가 아님)
  - 이미지 로드 스킵 후에도 동일 → **이미지 로드와 무관한 오염**
- 결과: 0x2660/0x2a80 스텁이 [0x1BBA8C]에서 GOT 주소를 pc로 로드 → .got 영역 실행 → SEGV_ACCERR (스택/힙 실행으로 표시됨)
- 크래시 백트레이스: JIT → XGraphics::setAlpha(0x5e148 bl 0x6de80) / UI::_nPopup_Draw(0x5114e bl 0x5e130) 경유
- lr = 0x114D/0x1153 (문자열 주소) — 함수 포인터가 문자열 주소로도 오염

### 11.5 로거 함정 (이번 사이클 교훈)
- **mainTimer 로거 코드 확장 시 MT_LIT(리터럴 풀 위치) 갱신 필수** — adr r4가 엉뚱한 위치를 가리켜 r3 오염 크래시
- **__android_log_print 인자 순서**: r0=prio, r1=tag, r2=fmt, r3=첫 vararg (r2/r3 혼동 시 liblog 내부 크래시)
- **r12(ip)는 caller-saved** — blx r12 후 재호출 시 재로드 필수
- 리터럴 오프셋: lit13=0x1BBA8C(@+48), lit14=idiv fmt(@+52)

### 11.6 다음 단계 (Cycle I 후보)
① **ARM 나눗셈 직접 구현** — 0x76524(완전 제로 블록)에 __aeabi_idiv 루틴 작성,
   0x2668/0x2a88의 `ldr pc`를 `b <루틴>`으로 교체 (GOT [0x1BBA8C] 의존 제거)
② [0x1BBA8C]에 GOT 엔트리 주소(base+0x1BB998)를 쓰는 코드 추적 — 오염원 최종 규명
③ 0x6de80(MC_grpSetContext)/0x5e130(setAlpha) bx lr 무력화 — 크래시 경로 차단 실험 (backtrace 이동 확인됨)



