# 다크블레이드 코드 분석 (CODE_ANALYSIS)

분석 기준: 원본 KTF.apk(com.mobicle.darkblade, 2008) 디코드 결과 + 최신 작업본 v0.1 대조
분석일: 2026-08-20

## 1. 원본 vs v0.1 변경 내역 (전수 대조 결과)

| 항목 | 원본 | v0.1 | 변경 |
|---|---|---|---|
| smali (자바 코드) | 226개 파일 | 226개 파일 | **0 diff — 100% 무수정** |
| libLauncher.so (게임 본판) | md5 8b13af7e… | md5 8b13af7e… | **동일 — 100% 무수정** |
| res/ 리소스 | - | - | 0 diff |
| assets/ | - | - | 0 diff |
| unknown/ | - | - | 0 diff |
| AndroidManifest.xml | uses-sdk minSdk 7 | minSdk 7 + targetSdk 22 | targetSdk 상향 (설치 호환용) |
| AndroidManifest.xml | supports-screens | + xlargeScreens="true" | 태블릿/대화면 수용 |
| lib/ | libLauncher.so 1개 | 18종 × 2 ABI (armeabi, armeabi-v7a) | 레거시 시스템 라이브러리 동봉 |

**결론: 게임 본판 코드(자바·네이티브)는 단 한 바이트도 수정하지 않았음.**
변경은 ① 매니페스트 2줄(설치·화면 호환) ② KitKat에서 추출한 레거시 라이브러리 17종 동봉뿐.

## 2. 패키지 구조 (smali 226개)

- **com/beyond (108개)** — 게임 엔진 프레임워크. CletActivity(액티비티), AppThread(렌더/이벤트 스레드), CletView(뷰), ScreenConfig(화면), MySocket(네트워크), CMediaPlayer(미디어) 등
- **com/kt (57개)** — KT 통신사 연동 (결제, DRM, 인증)
- **com/kaf (37개)** — KAF 성인인증 연동
- **com/mobicle (6개)** — 게임 진입점 (DarkBlade, R$)
- **org/kwis (6개)** — WIPI 규격 클래스
- **javax/microedition (6개)** — MIDP 클래스
- **com/skt (4개)** — SKT 연동
- **nanoxml (2개)** — XML 파서

전형적인 2008년 한국 피처폰→안드로이드 이식 구조 (WIPI/MIDP 기반, 통신사 결제·인증 모듈 포함).

## 3. 실행 흐름

```
DarkBlade.onCreate(Bundle)
 ├─ 효과음 배열 37개 구성 (snd/1.ogg ~ snd/42.ogg)
 ├─ super.onCreate(bundle, sounds)   → CletActivity
 │   ├─ instance/context 저장
 │   ├─ new AppThread(this, sounds)  → appTh
 │   └─ subCreate()
 │       ├─ ScreenConfig 초기화 (화면 크기·방향)
 │       ├─ CletView(AppFrameBuffer) 생성 → vg에 addView
 │       ├─ appTh.setCanvasSize(w,h,0,0,w,h)  ← Java 래퍼
 │       ├─ appTh.setContext(context)
 │       ├─ appTh.start()            ← 스레드 시작
 │       └─ KtDrmCheckActivity 생성 (DRM 확인)
 └─ KTinitPurchase("8100DA81")       ← KT 결제 초기화

AppThread.run()                      ← 별도 스레드
 └─ pltStart(filesDir, cacheDir)     ← 네이티브 게임 시작!
```

## 4. 네이티브 JNI (libLauncher.so)

JNI_OnLoad(0x2b01)에서 RegisterNatives로 15개 메서드 등록 (Java_ 심볼로 확인):

| 메서드 | 역할 |
|---|---|
| pltStart(String, String) | 게임 시작 (filesDir, cacheDir 인자) |
| pltPause / pltResume / pltFinish | 일시정지 / 재개 / 종료 |
| initCanvas(Canvas) | 렌더 타깃 초기화 |
| setCanvas(IIIIII) | 캔버스 크기·오프셋 설정 |
| BhandleKeyEvent(II)Z | 키 입력 |
| BhandleMotionEvent(III) | 모션 입력 |
| BhandleTouchPress/Release/Drag(III) | 터치 입력 |
| BhandleNetEvent(II) | 네트워크 이벤트 |
| BhandleBuyEvent(II) | 구매 이벤트 |
| BhandleMediaEvent(MediaPlayer, I) | 미디어 이벤트 |

네이티브 렌더링: Java Canvas → setCanvas → SkBitmap(전역 2개, .bss 0x1284/0x12ac) →
Skia 렌더러 → Canvas에 비트맵 블릿. GL 직접 호출 없음(순수 Skia 2D).

## 5. 라이브러리 의존성 체인 (S8/Android 9 기준)

```
libLauncher.so (원본 불변)
 └─ NEEDED: libc, libstdc++, libm, liblog, libdl, libz, libskia.so(동봉)
     └─ libskia.so (KitKat) NEEDED 10종 → libft2·libemoji·libcutils·libutils 등 전부 동봉
         └─ libcutils.so (KitKat) → android_atomic_* 심볼 + ioprio_set/get
             └─ ioprio_set/get → libioprio_stub.so (NEEDED로 참조해야 로드됨)
```

**S8 함정:** /system/lib에 libft2.so·libcutils.so가 실존해도 public.libraries.txt에
미등재 → 앱 dlopen 불가 → **동봉이 유일한 해법** (v19 18종 구성이 dlopen 통과 확인된 최소 구성).

## 6. 알려진 크래시 지점 (디버깅 이력)

1. **libft2.so 누락 (v2)** — UnsatisfiedLinkError → libskia NEEDED였음 → 동봉으로 해소
2. **libemoji.so 누락 (v0)** — libskia NEEDED 10종 중 누락 → 동봉으로 해소
3. **ioprio_set 미해석 (v0.1)** — KitKat 원본 libcutils가 참조, Android 9 bionic에 없음
   → libioprio_stub.so를 NEEDED로 갖는 **재링크 libcutils** 필요 (v19 구성이 유효)
4. **SkBitmap fMipMap=0x20004 SIGSEGV (v19)** — 전역 SkBitmap B(.bss 0x1bcbb4)의
   fMipMap에 가비지 기록. SkBitmap 생성자 44B 0-초기화 vs A/B 간격 40B의 레이아웃
   불일치 + BH_setBitmapSize 0x5c40~ 영역의 런타임 기록이 원인으로 좁혀짐 (분석 보류)

## 7. 작업 규칙 (이 문서 이후 준수)

- libLauncher.so **절대 수정 금지** — 바이너리 패치 없이 라이브러리 동봉으로만 해결
- 새 코드/구성 작성 전 DEVELOPMENT_LOG.md·CHANGELOG.md 확인 → 같은 실수 반복 금지
- 빌드 산출물 APK는 GitHub에 올리지 않음 — src/(디코드 소스)만 관리
- 버전: v0부터 (v1~v19 실험 체계는 폐기, CHANGELOG에 기록 유지)
