# DarkBladeRework — 다크블레이드(2008) Android 9 구동 프로젝트

com.mobicle.darkblade (2008, Android 2.1/SDK 7 타겟, WIPI 이식작)를
갤럭시 S8(Android 9)에서 구동하기 위한 레거시 라이브러리 동봉 + 본판 코드 최소 수정 프로젝트.

## 원칙
- **본판 코드(libLauncher.so, smali) 수정 최소화** — 레거시 라이브러리 동봉만으로 실행 불가함이 확인되어, 최소 수정 원칙으로 전환 (v0.3)
  - 수정 1: DRM 확인 우회 (KtDrmCheckActivity DrmCheck 항상 성공)
  - 수정 2: 이벤트 큐 강제 진행 (libLauncher.so MH_pltStart — startClet 강제 주입)
  - 수정 3: 리소스 로드 디버깅 로그 (ImageBridge/ZipIo/JletActivity HERMES_DBG — 제거 가능)
- KitKat(Android 4.4) 시스템 이미지에서 제거된 레거시 라이브러리 추출·동봉
- 모든 버전·오류·수정 내역을 GitHub에서 관리 (버전 체계: v0부터)

## 구조
- src/ — APK 디코드 소스 (apktool): smali/, res/, lib/, AndroidManifest.xml
- docs/ — 코드 분석 문서 (ANALYSIS.md: 검은 화면 원인 규명, 이벤트 루프 구조)
- patches/ — 실험용 패치 스크립트
- scripts/ — 디스어셈블/분석 스크립트 (capstone 기반)
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
1. KitKat(android-19) 이미지에서 18종 라이브러리 추출 → APK lib/armeabi(+v7a)에
   동봉 → dlopen 통과. 단, libcutils.so는 libioprio_stub.so를 NEEDED로 갖는
   재링크 버전 사용(안드로이드 9 bionic에 ioprio_set 부재).
2. DRM NPE 크래시 우회 (DrmCheck 항상 성공)
3. 검은 화면 원인: 이벤트 큐(BH_eventq_wait) 무한 대기 → startClet 강제 주입

## 빌드 방법
apktool b src/ → zipalign → apksigner(keystore, v1+v2+v3) → adb install --no-streaming
설치 후 실행 시 TEXTREL 경고 대화상자에서 확인 탭 필요 (targetSdk 22 미만).

## 현재 상태
- v0(5종) libemoji 누락 / v0.1(18종) ioprio_set 미해석 → v0.2에서 libcutils 재링크 구성
- **v0.3: DRM 우회 + 이벤트 큐 강제 주입** — Thread-2가 실행 상태로 전환, 게임 루프 가동
- 잔여 문제: 화면 렌더링 (여전히 검은 화면, 리소스 로드 경로 진입 실패)
- 상세: docs/CODE_ANALYSIS.md, docs/ANALYSIS.md, DEVELOPMENT_LOG.md
