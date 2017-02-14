# Upload and run recovery zip
rem adb push -p "../prerooted zips/bueller-5.2.1.1-rooted_r1.zip" /sdcard/
adb push -p "../recovery/bueller_recovery_v2.zip" /sdcard/
adb shell su -c "sh /sdcard/bueller_recovery_v2.zip"
rem adb shell su -c "mkdir -p /sdcard/TWRP/"
rem adb push -p "F:/Desktop/kodi_utils/TWRP/." /sdcard/TWRP/

pause