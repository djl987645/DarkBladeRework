# DarkBlade Rework (다크블레이드 개조)

2008년작 Android 2.1(SDK 7) 게임 **다크블레이드(com.mobicle.darkblade)** 를 현대 기기(갤럭시 S8, Android 7~9)에서 구동 가능하게 만드는 리워크 프로젝트.

## 문제

- 원본은 2008년 Android 2.1(SDK 7) 타겟, `lib/armeabi/libLauncher.so` (ARMv5, 32비트) 사용
- `libLauncher.so` → `libskia.so` → `libstlport.so` 의존성 체인: Android 5.0+에서 `libstlport.so`가 시스템에서 제거되어 **UnsatisfiedLinkError 즉시 크래시**
- 추가로 `libft2.so`(Freetype)도 Android 7+에서 `libfreetype.so`로 리네임되어 부재
- 시스템 `libcutils.so`의 `android_atomic_*` 심볼도 Android 9에서 제거됨

## 해결 전략

**원본 게임 코드는 수정하지 않고**, KitKat(Android 4.4) 시스템 이미지에서 추출한 레거시 라이브러리를 APK에 동봉:

| 라이브러리 | 출처 | 이유 |
|---|---|---|
| libLauncher.so | 원본 (수정 없음) | 게임 본체 |
| libskia.so | KitKat 추출 | 2008 libLauncher가 기대하는 구버전 Skia |
| libstlport.so | KitKat 추출 | Android 5.0+에서 시스템 제거됨 |
| libft2.so | KitKat 추출 | Android 7+에서 libfreetype.so로 리네임 |
| libcutils.so | KitKat 추출 | android_atomic_* 심볼 제공 |

## 빌드 방법

```bash
# 1. 디코드
apktool d DarkBlade.apk -o KTF_dec

# 2. lib/armeabi의 .so를 lib/armeabi-v7a에도 복제 (armeabi-v7a 폴더로 이동 패치)
#    대상: libLauncher.so, libskia.so, libstlport.so, libft2.so, libcutils.so

# 3. targetSdk 상향 (SDK 7 → 22)

# 4. 빌드
apktool b KTF_dec -o KTF_v2.apk

# 5. 정렬 및 서명
zipalign -f 4 KTF_v2.apk DarkBlade_v2_aligned.apk
apksigner sign --ks darkblade.keystore --ks-pass pass:XXXX --out DarkBlade_v2_signed.apk DarkBlade_v2_aligned.apk
```

## 버전 이력

모든 버전은 `apk/` 디렉토리에 signed APK로 보관. 상세 이력은 [CHANGELOG.md](CHANGELOG.md) 참조.

- **v2** — 최초 리워크: libLauncher + libskia + libstlport 동봉 (libft2 누락 → 실패)
- **v15~v19** — 에뮬레이터(x86_64) 테스트용 libcutils.so 이진 패치 실험 (LDREX→LDR, cmp/movs)
- **v19** — 18종 라이브러리 동봉 + libcutils movs 패치. 스핀 해소 후 SkBitmap 레이아웃 불일치 크래시 발생

## 분석 자료

- `analysis/crash19.txt` — v19 SIGSEGV debuggerd 덤프 (SkBitmap::freeMipMap → android_atomic_dec 크래시)
- `analysis/libcutils_installed_v18.so` — v18 설치본 libcutils (md5 대조용)

## 라이선스

게임 원본: © 2011 mobicle. 리워크 산출물은 교육/개인 사용 목적.
