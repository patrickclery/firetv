rem Adds OTG cable mouse support
rem adb -s %1 shell "echo 1 > /sys/devices/platform/bcmpmu_otg_xceiv/host"

echo 'Type "mouse" press [enter] then hit [D] until it selects recovery...'
adb -d shell

echo Installing prerooted zip
adb push -p ../"prerooted zips"/montoya-5.2.1.1-rooted_r1.zip /sdcard/montoya-5.2.1.1-rooted_r1.zip

echo Installing xposed zips
REM adb -d push ../xposed/xposed-v87-sdk22-arm.zip /sdcard/xposed-v87-sdk22-arm.zip
REM adb -d push ../xposed/xposed-uninstaller-20150831-arm.zip /sdcard/xposed-uninstaller-20150831-arm.zip
REM Adds OTG cable mouse support

rem Adds OTG cable mouse support
REM adb -d shell "mkdir -p /sdcard/Android/data/org.xbmc.kodi/files/"
REM adb -d shell "rm -rf /sdcard/Android/data/org.xbmc.kodi/files/.kodi"
REM adb -d push -p ../.kodi /sdcard/Android/data/org.xbmc.kodi/files/.kodi
