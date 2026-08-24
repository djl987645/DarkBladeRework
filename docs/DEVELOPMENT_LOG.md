
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
