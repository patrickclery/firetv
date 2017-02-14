echo Delete pending updates
adb shell "rm -fv /sdcard/Android/data/com.amazon.device.software.ota/files/*.bin"
echo Blocking updates...
adb shell su -c "pm disable com.amazon.device.software.ota"

echo Upload and run recovery zip
rem adb push -p "../prerooted zips/sloane-5.2.1.1-rooted r1.zip" /sdcard/
adb push -p "../recovery/firetv2 recovery v6.zip" /sdcard/firetv2_recovery_v6.zip
adb shell su -c "sh '/sdcard/firetv2_recovery_v6.zip'"
rem adb shell su -c "mkdir -p /sdcard/TWRP/"
rem adb push -p "F:/Desktop/kodi_utils/TWRP/." /sdcard/TWRP/

pause