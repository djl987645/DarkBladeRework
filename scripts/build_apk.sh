#!/bin/bash
# DarkBladeRework 빌드 + 설치 파이프라인 (Cycle F 이후 표준 절차)
# 사용법: ./scripts/build_apk.sh [--skip-install]
set -e
cd /root/darkblade-mod
ADB=/opt/android-tools/sdk/platform-tools/adb
KS=/root/.hermes/backup/darkblade.keystore
KSPASS=darkblade
BT=/opt/android-tools/build-tools/android-14

echo "[1/4] 원본 복원 + 패치 스크립트 실행 (libLauncher.so)"
# ★ 이중 패치 방지: src/libLauncher.so는 git에 패치본으로 커밋되어 있으므로
#   반드시 원본(docs/libLauncher_original.so)에서 복원 후 1회만 패치한다.
cp docs/libLauncher_original.so src/lib/armeabi-v7a/libLauncher.so
python3 scripts/patch_native_probe.py >/dev/null 2>&1 || { echo "패치 실패"; exit 1; }

echo "[2/4] apktool 빌드"
rm -rf dist && mkdir -p dist
apktool b src/ -o dist/darkblade.apk

echo "[3/4] zipalign + apksigner"
$BT/zipalign -f 4 dist/darkblade.apk dist/darkblade-aligned.apk
$BT/apksigner sign --ks $KS --ks-key-alias darkblade --ks-pass pass:$KSPASS --key-pass pass:$KSPASS \
    --v1-signing-enabled true --v2-signing-enabled true --v3-signing-enabled true \
    --out dist/darkblade-signed.apk dist/darkblade-aligned.apk
ls -la dist/darkblade-signed.apk

if [ "$1" == "--skip-install" ]; then
    echo "설치 생략. dist/darkblade-signed.apk 완성."
    exit 0
fi

echo "[4/4] 설치 (서명 변경 시 uninstall 선행)"
$ADB uninstall com.mobicle.darkblade >/dev/null 2>&1 || true
$ADB install --no-streaming dist/darkblade-signed.apk
echo "설치 완료"
