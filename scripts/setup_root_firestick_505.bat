cd C:\Users\Patrick\Downloads\kodi
#echo Installing adb...
#adb push adb /sdcard/
#adb shell "su -c 'mount -o remount,rw /system; cp /sdcard/adb /system/bin; chmod 755 /system/bin/adb; mount -o remount,ro /system'"

#echo Uploading config files...
#adb push FireStarterBackup_root.zip /sdcard/FireStarterBackup.zip

echo Blocking updates...
adb shell su -c "pm disable com.amazon.device.software.ota"

#echo Disabling blacklist...
#adb shell su -c "pm disable com.amazon.tv.settings/com.amazon.tv.settings.tv.AppDisableService"
#adb shell su -c "pm enable de.belu.firestarter"

cd apk
for %%f in (*.apk) do adb install "%%f"

cd ..

echo Installing Kodi...
adb shell mkdir -p /sdcard/Android/data/org.xbmc.kodi/files/.kodi
adb push C:\Users\Patrick\AppData\Roaming\Kodi_rebuild_2016-02-20 /sdcard/Android/data/org.xbmc.kodi/files/.kodi

#echo Installing backup image...
#adb push -p recovery\sloane-5.0.5.1-rooted_r1.zip /sdcard/