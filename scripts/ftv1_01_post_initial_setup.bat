echo Delete pending updates
adb shell "rm -fv /sdcard/Android/data/com.amazon.device.software.ota/files/*.bin"
adb shell "pm clear com.amazon.device.software.ota"

echo Install kingroot
rem adb install "../apk/NewKingrootV5.0.2_C167_B381_en_release_2017_01_12_20170112231602_105203.apk"

pause