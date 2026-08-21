# 개발 로그 (오류·수정 내역)

> **규칙**: 새 버전 작업 전에 반드시 이 파일과 CHANGELOG.md를 확인하여 기존 실수를 반복하지 않는다.

## v0 (현재 버전) — 2026-08-20 시작

**방침**: 원본 게임 코드(libLauncher.so)는 절대 수정하지 않는다. 필요한 레거시 라이브러리만 KitKat에서 추출해 동봉한다. 이진 패치(AD HOC) 금지.

**v0 구성** (5종 동봉):
- libLauncher.so — 원본 (수정 없음)
- libskia.so — KitKat 추출
- libstlport.so — KitKat 추출
- libft2.so — KitKat 추출 (v2 실패에서 배움)
- libcutils.so — KitKat 원본 (패치 없음! v15~19 실수에서 배움)

---

## 오류·수정 이력 (v0 이전 실험 버전)

### 🔴 v1 — libstlport.so 누락
- **증상**: `UnsatisfiedLinkError` 즉시 크래시
- **원인**: libLauncher.so → libskia.so → libstlport.so 의존성. Android 5.0+에서 libstlport.so가 시스템에서 제거됨
- **교훈**: NEEDED 체인 전체를 동봉해야 함

### 🔴 v2 — libft2.so 누락
- **증상**: `dlopen failed: library "libft2.so" not found` (S8 실기 확인, 2026-08-20 23:38)
- **원인**: libskia.so(KitKat)가 libft2.so를 NEEDED. Android 7+에서 libft2.so → libfreetype.so로 리네임되어 시스템에 없음
- **교훈**: libskia.so의 NEEDED 16종 중 시스템에 없는 것(libft2, libstlport)을 모두 동봉해야 함. **libcutils.so의 android_atomic_* 심볼도 시스템(Android 9)에 없음 → 동봉 필수**

### 🟡 v15~v17 — libcutils.so LDREX/STREX→LDR/STR 패치 (실기 불필요)
- **증상**: 에뮬레이터(x86_64)에서 원자함수 스핀
- **원인**: x86_64 에뮬레이터의 ARM 번역기가 LDREX/STREX 미지원 (S8 ARMv7 실기에서는 정상 동작!)
- **교훈**: 에뮬레이터 전용 문제를 실기 APK에 반영하지 말 것. **실기 테스트는 원본 코드로!**

### 🔴 v18 — cmp rX,#0 패치 무효
- **증상**: android_atomic_inc 무한 루프 (libutils 생성자 스핀)
- **원인**: `cmp rX,#0`은 레지스터를 0으로 만들지 않음. r2=0xc4772990 쓰레기값 → Z=0 → bne 무한 루프
- **교훈**: 레지스터 클리어는 `movs rX,#0` (0xE3B0X000) 사용

### 🔴 v19 — movs 패치 후 SkBitmap 레이아웃 불일치 크래시
- **증상**: 스핀은 해소됐으나 `SIGSEGV @0x20004` (SkBitmap::freeMipMap → android_atomic_dec)
- **원인 분석**:
  - libLauncher.so(2008)가 SkBitmap 전역 객체 2개를 .bss에 0x28(40B) 간격으로 배치
  - KitKat libskia.so의 SkBitmap 생성자가 44B(0x2C)를 0으로 초기화 → 첫 객체 초기화가 둘째 객체 시작부 침범
  - 두 번째 SkBitmap(0x1bcbb4)의 fMipMap=0x20004 가비지 → freeMipMap에서 SEGV
- **미해결**: SkBitmap 레이아웃 ABI 불일치 (libLauncher 40B 가정 vs KitKat libskia 44B+) — **v0에서 libcutils 원본 복귀로 이 문제가 재현되는지 먼저 확인**
- **교훈**: 이진 패치로 스핀을 넘겨도 레이아웃 불일치는 남는다. 근본 해결 필요

---

## 확인된 사실 (반복 실수 방지)

1. **S8 실기 (ARMv7)**: LDREX/STREX 정상 동작 → libcutils.so 원본 사용 가능
2. **시스템 libcutils.so (Android 9)**: android_atomic_dec/inc/add/release_cas **없음** (fs_read/write_atomic_int만 존재)
3. **시스템 libft2.so (Android 9 arm)**: **없음** (libfreetype.so로 리네임)
4. **시스템 libstlport.so (Android 5.0+)**: **없음**
5. **libskia.so(KitKat) NEEDED 16종**: liblog, libcutils, libft2, libjpeg, libpng, libutils, libz, libexpat, libEGL, libGLESv2, libicuuc, libicui18n, libstlport, libc, libstdc++, libm
6. **libLauncher.so(2008) NEEDED**: libc, libstdc++, libm, liblog, libdl, libz, libskia — libcutils 직접 의존 없음
7. **KitKat libutils.so NEEDED**: libcorkscrew.so 포함 (Android 9에 없음) → libutils는 **시스템 것** 사용이 안전
8. **v19 APK에 이미 18종 동봉** — libft2/libcutils/libutils/libcorkscrew 포함. v0은 이 구성에서 libcutils만 원본으로 복귀

## v0.4 — 2026-08-21 (라이브러리 전면 교체 + JNI 드리프트 + 이벤트 루프 강제)

**발견/실증**:
- SkBitmap 레이아웃: GB(android-10)=40B / ICS·JB·KitKat=44B — 2008 libLauncher는 40B 가정. KitKat setConfig가 fConfig(offset 40)·fBytesPerPixel(42) 저장 → 전역 A+40 = B.fMipMap 오염 → 0x20004 SIGSEGV. GB libskia로 교체해 해소
- ioprio_get/set: Android 11+ libc에서 제거됨. GB libcutils도 ioprio_get 참조 → stub.so(NEEDED 0개) + patchelf로 해소
- futex 데드락: SkPixelRef::lockPixels가 공유 전역 뮤텍스 → 2.1 allocPixels(락 없음) vs 2.3(락 사용) 의미 차이. pthread_mutex_lock/unlock PLT 베니어 첫 워드 → bx lr(0xE12FFF1E)
- mNativeCanvas: Android 9에서 Canvas.mNativeCanvas(int) 삭제 → mNativeCanvasWrapper(long, BaseCanvas). GetFieldID 실패 + GetIntField = CheckJNI abort. libLauncher 바이트 패치 (필드명 + 시그니처 I→J + GetLongField + 리터럴 풀). **이것은 "본판 불변" 원칙의 예외 (v0.7과 동일 맥락)**
- **BH_rlIsShow 함정**: MH_pltStart 이벤트 루프는 `bl BH_rlIsShow` 반환값이 0이 아니면 0x63fe→0x641c→0x63ea 순환하며 startClet을 **영원히 스킵**. 초기 상태에서 rlIsShow 바이트가 0이 아닌 게 원인으로 추정 → 호출부를 movs r0,#0으로 무력화 + 전역 바이트 검사(0x641e~0x6424) NOP로 startClet 보장 실행
- **중간 산출물 위치**: /tmp/gblibs/ (패치 스크립트 4종 + lib 백업), /tmp/installed_libLauncher.so (기기 추출)

**교훈**:
- 백트레이스 주소 변화(0x6454→0x63f6→0x63fa)로 이벤트 루프 경로 추적 가능. 스핀 위치가 함수 경계와 정확히 일치해야 신뢰
- "startClet 실행됐다고 추정"하지 말 것 — 이벤트 루프가 스킵할 수 있음. 백트레이스+패치로 보장 후 다음 단계
