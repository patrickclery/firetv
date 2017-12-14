REM cd D:\Backup\Patrick\Downloads\kodi
REM echo Installing adb...
REM adb push adb /sdcard/
REM adb shell "su -c 'mount -o remount,rw /system; cp /sdcard/adb /system/bin; chmod 755 /system/bin/adb; mount -o remount,ro /system'"

echo Blocking updates...
adb shell su -c "pm disable com.amazon.device.software.ota"

echo Disabling blacklist...
adb shell su -c "pm disable com.amazon.tv.settings/com.amazon.tv.settings.tv.AppDisableService"
adb shell su -c "pm enable de.belu.firestarter"

REM echo Removing KingRoot...
REM adb shell su -c "pm disable com.kingapp.root"
REM adb shell su -c "pm uninstall com.kingouser.com"

REM cd apk
REM for %%f in (*.apk) do adb install -p "%%f"
REM cd ..

REM echo Removing KingRoot...
REM adb shell su -c "pm disable com.kingapp.root"
REM adb shell su -c "pm uninstall com.kingouser.com"

rem echo Installing backup image...
rem adb push -p recovery\sloane-5.0.5.1-rooted_r1.zip /sdcard/

pause