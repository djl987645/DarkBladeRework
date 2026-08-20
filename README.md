# DarkBladeRework — 다크블레이드(2008) Android 9 구동 프로젝트

com.mobicle.darkblade (2008, Android 2.1/SDK 7 타겟, WIPI 이식작)를
갤럭시 S8(Android 9)에서 구동하기 위한 레거시 라이브러리 동봉 프로젝트.

## 원칙
- **게임 본판 코드(libLauncher.so, smali)는 절대 수정하지 않음**
- KitKat(Android 4.4) 시스템 이미지에서 제거된 레거시 라이브러리만 추출·동봉
- 모든 버전·오류·수정 내역을 GitHub에서 관리 (버전 체계: v0부터)

## 구조
- src/ — APK 디코드 소스 (apktool): smali/, res/, lib/, AndroidManifest.xml
- docs/ — 코드 분석 문서
- patches/ — 실험용 패치 스크립트 (v19 이하 실험 단계 산출물, 현재 미사용)
- libs/ — KitKat 추출 라이브러리 원본
- analysis/ — 크래시 분석 자료
- CHANGELOG.md — 버전 이력
- DEVELOPMENT_LOG.md — 오류·수정 내역 (반복 방지)

## 문제 요약
2008년 컴파일된 libLauncher.so(ARMv5)가 의존하는 라이브러리가 현대 Android에서
제거됨:
- libstlport.so — Android 5.0+ 제거
- libft2.so — libfreetype.so로 리네임 + public.libraries 미등재
- libemoji.so, libcorkscrew.so — 제거
- libcutils.so의 android_atomic_*·ioprio_set — bionic에서 제거/변경

## 해결 전략
KitKat(android-19) 이미지에서 18종 라이브러리 추출 → APK lib/armeabi(+v7a)에
동봉 → dlopen 통과. 단, libcutils.so는 libioprio_stub.so를 NEEDED로 갖는
재링크 버전 사용(안드로이드 9 bionic에 ioprio_set 부재).

## 빌드 방법
apktool b src/ → zipalign → apksigner(keystore, v1+v2+v3) → adb install --no-streaming

## 현재 상태
v0(5종) libemoji 누락 / v0.1(18종) ioprio_set 미해석 → v0.2에서 libcutils 재링크
구성으로 재테스트 예정. 상세: docs/CODE_ANALYSIS.md, DEVELOPMENT_LOG.md
