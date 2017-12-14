adb -d uninstall -k --user 0 com.amazon.device.software.ota
adb -d uninstall -k --user 0 com.amazon.device.software.ota.override

rem Delete updates
adb -d shell "rm -fv /sdcard/Android/data/com.amazon.device.software.ota/files/*.bin"