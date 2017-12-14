echo "If software version < 5.2, hit CTRL+C now and update manually under Settings > About > Check For Updates, then run this immediately after the update"

pause

echo Delete pending updates
adb -d shell "rm -fv /sdcard/Android/data/com.amazon.device.software.ota/files/*.bin"
adb -d shell "pm clear com.amazon.device.software.ota"

echo Trying to 'hide' updates first with user permissions...
adb -d shell "pm hide com.amazon.device.software.ota"

REM Easiest to update to 5.2.1.x first as the other roots didn't work easily
echo Install kingroot
rem adb -d install "../apk/KingoRoot.apk"
REM adb -d install "../NewKingrootV5.0.5_C172_B411_en_release_2017_04_20_20170426153558_105203.apk"

REM echo Launching KingoRoot (go to TV now)...
REM adb -d shell am force-stop com.kingoapp.root
REM adb -d shell "am start -n com.kingoapp.root/.MainActivity"

REM echo "Now plug in to direct power source (not through USB), reboot, and run KingoRoot"
pause
