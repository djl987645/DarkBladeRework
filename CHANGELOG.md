# Changelog

## v0 (2026-08-20) — 버전 체계 재정립
- 이전 v1~v19 실험 버전을 모두 폐기하고 **v0부터 새로 시작**
- 방침: 원본 게임 코드(libLauncher.so) 수정 금지, 필요한 레거시 라이브러리만 KitKat에서 추출해 동봉
- 구성 (5종): libLauncher(원본) + libskia + libstlport + libft2 + libcutils(KitKat 원본, 패치 없음)
- v2 실패(libft2 누락)와 v15~19 실패(이진 패치)에서 얻은 교훈 반영
- 상세 오류/수정 이력: [DEVELOPMENT_LOG.md](DEVELOPMENT_LOG.md)

## v19 (2026-08-20) — 실험 종료
- libcutils.so 6개 원자함수 `movs rX,#0` 패치 (v18의 cmp 패치가 무효임을 규명, 레지스터 클리어+Z 플래그 동시 보장)
- 18종 라이브러리 동봉 (KitKat 추출: libskia, libstlport, libft2, libcutils, libutils, libcorkscrew 등)
- 결과: libutils 생성자 스핀 해소 → 게임 네이티브 코드 실행까지 성공
- 잔여 문제: SkBitmap 레이아웃 불일치 (libLauncher 2008: 40B 가정 vs KitKat libskia: 44B 초기화) → fMipMap 가비지 0x20004 → SIGSEGV

## v18 (2026-08-20)
- libcutils.so 원자함수에 `cmp rX,#0` 패치 시도
- 규명: cmp는 레지스터를 0으로 만들지 못해 쓰레기값이면 Z=0 → 무한 루프 (무효 패치)

## v15~v17 (2026-08-20)
- 에뮬레이터(x86_64) 테스트용 libcutils.so LDREX/STREX → LDR/STR 이진 패치
- v15: LDREX/STREX→LDR/STR (번역기 버그 우회 시도)

## v2 (2026-08-20)
- 최초 리워크: libLauncher.so(원본) + libskia.so(KitKat) + libstlport.so(KitKat) 동봉
- 실패: `dlopen failed: library "libft2.so" not found` (libskia의 NEEDED, Android 7+에서 리네임)

## v1 (2026-08-20)
- 원본 APK + armeabi-v7a 폴더 복제 + targetSdk 22 상향만 적용
- 실패: `libstlport.so` 부재 (Android 5.0+ 시스템 제거)

## 원본 상태 (2008)
- Android 2.1 (SDK 7) 타겟, 400x240 고정 해상도
- `lib/armeabi/libLauncher.so` (ARMv5 32비트, 텍스트 재배치 포함 가능성)
- Java → JNI (libLauncher) → 자체 렌더러 (GL 직접 호출 없음)
- Android 2.x~4.x에서 정상 구동 (노트4 Android 5~6 성공 기록)

## v0.4 (2026-08-21) — 검은 화면 3중 원인 해소 (라이브러리 전면 교체 + JNI 드리프트 + 이벤트 루프)

### 라이브러리 교체 (GB/Gingerbread 기반으로 전면 재구성)
- **GB libskia.so 교체** — SkBitmap 40B (KitKat 44B와 레이아웃 불일치로 인한 fMipMap 가비지 0x20004 SIGSEGV 해소)
- **ioprio_stub.so 생성 + libcutils.so patchelf** — Android 11+ libc에서 제거된 ioprio_get/set syscall 래퍼 해소
- **GB 8종으로 교체**: libcutils·libemoji·libjpeg·liblog·libskia·libutils·libz + ioprio_stub (KitKat 9종 삭제: libcorkscrew·libexpat·libft2·libgabi++·libgccdemangle·libicui18n·libicuuc·libpng·libstlport)
- 전부 수동 언프리링크 (GB prelink 절대주소 → R_ARM_RELATIVE)

### 바이너리 패치 (v0.7~v0.8.3 실증 재적용, AD HOC)
- **뮤텍스 베니어 bx lr 패치** — libskia pthread_mutex_lock/unlock PLT 스텁 첫 워드 → 0xE12FFF1E (SkPixelRef::lockPixels futex 데드락 해소, 단일 스레드 게임이라 안전)
- **mNativeCanvas JNI 드리프트 패치** — libLauncher: Android 9에서 삭제된 `Canvas.mNativeCanvas(int)` → `mNativeCanvasWrapper(long)` (필드명 문자열 교체 + 시그니처 I→J + GetIntField→GetLongField + 리터럴 풀 갱신) — SIGABRT 해소 (logcat `Accessing hidden field ... mNativeCanvasWrapper:J`로 확정)
- **이벤트 큐 강제 주입 v2** — startClet 보장 실행:
  - 0x641e~0x6424 (8B) 전역 바이트 검사 NOP → `c0 46` ×4
  - 0x63f6~0x63f9 `bl BH_rlIsShow(0x64ff4)` → `movs r0,#0; nop` — rlIsShow 전역 바이트가 0이 아니면 startClet이 영원히 스킵되는 구조 무력화

### 검증 상태
- 크래시 3종 해소 (0x20004 SIGSEGV / futex 데드락 ANR / mNativeCanvas SIGABRT)
- CletActivity onCreate → AppFrameBuffer SurfaceView 생성(1280x684) → setCanvasSize(initCanvas) → AppThread.start() → Thread-2 이벤트 루프 가동
- 백트레이스: Thread-2가 MH_pltStart 루프(0x63fa)에서 정상 순환 = startClet 경로 통과
- **잔여**: 리소스 로드 경로(HERMES_DBG) 미진입 — startClet 내부 초기화 단계에서 리소스 로드 전 정지 추정 (다음 사이클 과제)

## v0.3 (2026-08-21) — DRM 우회 + 이벤트 큐 강제 주입

- KtDrmCheckActivity DrmCheck() 항상 성공 패치 (DRM NPE 크래시 해결)
- libLauncher.so MH_pltStart 이벤트 큐 강제 진행 (이벤트 타입 5 → startClet 주입, 1회성)
  - 0x63ea~0x63f9: `02 98 05 28 02 d0 05 20 01 90 02 90 5e f0 fd fd`
  - 0x6440~0x6443: `00 23 01 93` (타입 리셋)
- ImageBridge/ZipIo/JletActivity HERMES_DBG 리소스 로드 로그 추가
- docs/ANALYSIS.md 추가 (검은 화면 원인 규명: BH_eventq_wait 무한 대기)
- scripts/ 분석 스크립트 추가
- 결과: Thread-2가 이벤트 큐 대기(S) → 실행(R) 전환, 게임 루프 가동
- 잔여: 화면 렌더링 정상화 (리소스 로드 경로 진입 실패)
