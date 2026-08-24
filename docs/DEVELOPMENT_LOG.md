
## 2026-08-24 — KTF 원본 실기 테스트 (박종민 지시: 테스트+오류 확인 후 일시 정지)

### 수행
- KTF.apk(박종민 제공, 진짜 원본) libLauncher.so로 빌드(패치 0) → S8 설치 → 실행 테스트
- 설치 APK: dist/darkblade-signed.apk (8,021,883B), libLauncher md5 8b13af7ef123fe059bca7217f5ee6b8f

### 발생 오류 (크래시 확인)
- **CheckJNI abort** — Java_com_beyond_AppThread_initCanvas+66 (0x3f62, GetIntField 호출)
- 사유: `JNI GetIntField called with pending exception java.lang.NoSuchFieldError: no "I" field "mNativeCanvas" in class "Landroid/graphics/Canvas;" or its superclasses`
- 호출 경로: CletActivity$AppFrameBuffer.surfaceCreated(CletActivity.java:144) → AppThread.initCanvas(native)
- 원인: Android 9(API 28)에서 android.graphics.Canvas.mNativeCanvas(int) 필드 제거 — 2008년 게임이 Canvas 내부 필드 직접 접근
- 화면: 위치 정확도 시스템 다이얼로그 표시 후 앱 백그라운드 abort (shot1/shot2 동일 132,763B)

### 결정적 단서 — 이전 빌드와의 차이 (26B 중 0x3f56 1B)
- KTF 원본 initCanvas: GetFieldID 후 **GetIntField**(JNIEnv 슬롯 100, 0x3f56=0xc8)
- 이전 빌드 5종(ci2/ci4/probe/prepatch/analysis): **GetLongField**(슬롯 101, 0x3f56=0xca)로 변경됨
- → 기존 "분석본"은 이미 initCanvas가 수정된 패치본. KTF 원본만 진짜 원본 코드
- 이전 빌드의 "검은 화면+리턴 슬롯 크래시"는 initCanvas 통과 이후 문제 / KTF 원본은 initCanvas부터 차단

### 일시 정지
- 재개 시 우선 과제: initCanvas 패치 — GetFieldID 실패(mNativeCanvas) 시 ExceptionClear 후 무시 또는 필드 조회 우회

## 2026-08-24 — Cycle: initCanvas JNI 예외 우회 패치 + 실기 검증 (박종민 시스템 명령)

### 패치 (scripts/patch_initcanvas.py, KTF 원본 기준)
- Java_com_beyond_AppThread_initCanvas(0x3f20)의 mNativeCanvas(int) 조회를 Android 9 호환으로 교체
  - 필드명: "mNativeCanvas" @0x711F8 -> "mNativeCanvasWrapper" @0x720DC
  - 시그니처: "I" @0x7145C -> "J" @0x720F1
  - GetIntField(JNIEnv 슬롯 100) -> GetLongField(슬롯 101) (0x3f56: 0xc8->0xca)
  - 리터럴 풀: [0x3f84] 0xffeb5b54->0xffeb67e9, [0x3f88] 0xffeb58f0->0xffeb67d4
- 결과: 패치본 md5 4cf197027761437fee79ee5b80d53c71 = 기존 "분석본"과 동일
  → 기존 분석본의 정체 = KTF 원본 + 이 initCanvas 패치본임이 확정 (26B 차이의 정체)
- initCanvas 영역(0x3f20~0x3f90) + 문자열(0x720DC~) ci2 설치본과 100% 일치 검증

### 실기 검증 (S8, APK 8,021,883B)
1. 설치 후 실행: PID 18655 생존, CheckJNI(Late-enabling -Xcheck:jni) 활성에도 abort 없음
2. shot1: TEXTREL 다이얼로그(67,614B) -> tap(640,566)
3. shot2: **검은 화면(8,179B) 진입** — 이전 빌드와 동일한 "검은 화면" 관문
4. 30초+ 경과: PID 생존, crash 버퍼 0건, **setAlpha(리턴 슬롯) 크래시 미발생**
5. gfxinfo: 78프레임 렌더링 / 29 janky (37.18%) — 게임 루프 활성

### 판정
- initCanvas 우회: ✅ 성공 (CheckJNI abort 제거)
- 검은 화면 관문: ✅ 진입 (이전 빌드와 동일 상태)
- setAlpha 리턴 슬롯 크래시: 현재 미발생 — 이전 빌드에서 케이스14(문장상점 0x2e0e0) 진입 시 발생했으므로, 검은 화면 초기 단계에서는 미도달
