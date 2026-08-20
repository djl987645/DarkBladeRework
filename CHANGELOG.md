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
