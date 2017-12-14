echo Uploading APK...
adb -d install "../apk_essential/kodi-16.1-Jarvis-armeabi-v7a.apk"
echo Uploading Kodi...
adb -d shell "rm -rf /sdcard/Android/data/org.xbmc.kodi/files/.kodi"
adb -d shell "mkdir -p /sdcard/Android/data/org.xbmc.kodi/files/.kodi/"
adb -d  push -p "../.kodi/." "/sdcard/Android/data/org.xbmc.kodi/files/.kodi/"

adb -d shell "chmod -R 777 /sdcard/Android/data/org.xbmc.kodi/files/.kodi/"

pause
