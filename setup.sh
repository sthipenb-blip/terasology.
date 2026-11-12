#!/usr/bin/env bash
# Prepara el proyecto Android (ejecutar UNA vez, con internet). Requiere Node 18+.
set -e
mkdir -p www
[ -f index.html ] && cp index.html www/index.html
npm install
node copy-three.js
[ -d android ] || npx cap add android
npx cap sync android
M=android/app/src/main/AndroidManifest.xml
# Pantalla horizontal y sin barras
grep -q sensorLandscape "$M" || sed -i 's/<activity /<activity android:screenOrientation="sensorLandscape" /' "$M"
S=android/app/src/main/res/values/styles.xml
grep -q windowFullscreen "$S" || sed -i 's#<style name="AppTheme.NoActionBar"[^>]*>#&\n        <item name="android:windowFullscreen">true</item>#' "$S"
echo "Listo. Para generar el APK:  cd android && ./gradlew assembleDebug"
echo "APK en: android/app/build/outputs/apk/debug/app-debug.apk"
