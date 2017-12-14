
echo Blocking updates with root permissions...
adb shell su -c "pm disable com.amazon.device.software.ota"

rem echo Install SuperUser
rem adb install "../apk/SuperUser.apk"

echo Installing recovery...
adb push -p ../recovery/"montoya recovery v1.zip" /sdcard/recovery.zip
adb shell "su -c sh /data/media/0/recovery.zip"

echo Now unplug the device from direct power and plug into USB then hit enter 

pause

@echo Press enter when recovery screen appears, then type the word "mouse"

@echo Then you must get the serial number via `adb devices` and run ftvstick1_03_push_twrp_backup.bat <serial>

pause

adb -d shell mouse

REM echo Installing prerooted zip
REM adb push -p ../"prerooted zips"/montoya-5.2.1.1-rooted_r1.zip /sdcard/montoya-5.2.1.1-rooted_r1.zip

REM echo Installing xposed zips
REM adb push ../xposed/xposed-v87-sdk22-arm.zip /sdcard/xposed-v87-sdk22-arm.zip
REM adb push ../xposed/xposed-uninstaller-20150831-arm.zip /sdcard/xposed-uninstaller-20150831-arm.zip
