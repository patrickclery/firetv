cd C:\Users\Patrick\Downloads\kodi

echo Hiding updates...
adb shell pm hide com.amazon.device.software.ota

echo Try disabling updates...
adb shell pm disable com.amazon.device.software.ota

echo Uploading config files...
adb push FireStarterBackup_root.zip /sdcard/FireStarterBackup.zip

echo Set screen saver to a gazillion seconds
adb shell settings put system screen_off_timeout 12345678

cd apk
for %%f in (*.apk) do adb install "%%f"

cd ..

echo Installing Kodi...
adb shell rm -rf /sdcard/Android/data/org.xbmc.kodi/files/.kodi
adb shell mkdir -p /sdcard/Android/data/org.xbmc.kodi/files/.kodi
adb push C:\Users\Patrick\AppData\Roaming\Kodi_rebuild_2016-02-20 /sdcard/Android/data/org.xbmc.kodi/files/.kodi