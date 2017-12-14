rem adb -s %device% push ../xposed-v87-sdk22-arm.zip

adb devices

@echo "Did you run this with `SCRIPT.bat <serial>`? If not, hit CTRL+C and copy and paste the SERIAL NUMBER above into notepad (you'll need it later) then run it again. Otherwise, go to WIPE > ADVANCED and select all then click Swipe... DO NOT REBOOT!! Hit ENTER here after it completes"

pause

@echo Installing prerooted zip
rem adb -d push -p ../"prerooted zips"/montoya-5.2.1.1-rooted_r1.zip /sdcard/montoya-5.2.1.1-rooted_r1.zip
rem adb -s %device% shell 'mkdir -p '

@echo "Type `mouse`, then go to INSTALL and select montoya-5.2.1.1-rooted_r1.zip in /sdcard. When it completes hit ENTER to CTRL+C then type `exit`"

rem adb -d shell

rem adb -d reboot

@echo "When the TWRP screen appears, press enter. Then type `mouse` and press D to select LAUNCH RECOVERY. After you select it, press CTRL+C here to exit mouse, then type `exit`"

rem pause

rem adb -d shell

rem adb -d shell "rm -f /sdcard/montoya-5.2.1.1-rooted_r1.zip"

@echo Installing backup
SET local_backup="F:\kodi\TWRP\BACKUPS\firetvstick\1970-01-01--19-01-30_LVY48F"
SET remote_backup="/sdcard/TWRP/BACKUPS/%1%/1970-01-01--19-01-30_LVY48F"

adb -d shell "rm -rf %remote_backup%"
adb -d shell "mkdir -p %remote_backup%"
adb -d push -p %local_backup% %remote_backup%

@echo "Type `mouse`, then go to RESTORE and choose the backup. When it completes hit CTRL+C then type `exit`"

pause

@echo Deleting backup...

adb -d shell "rm -rf %remote_backup%"

@echo Run ftv0_update_kodi.bat

pause

@echo Run ftvstick1_04_enable_otg_adapter.bat

rem @echo Uploading Kodi...

rem adb -d shell "mkdir -p /sdcard/Android/data/org.xbmc.kodi/files/.kodi/"
rem adb -d shell "rm -rf /sdcard/Android/data/org.xbmc.kodi/files/.kodi"
rem adb -d  push -p "../.kodi/." "/sdcard/Android/data/org.xbmc.kodi/files/.kodi/"
rem adb -d shell "chmod 777 /sdcard/Android/data/org.xbmc.kodi/files/.kodi/"

@echo "Boot fire tv stick completely. Connect remote by removing/reinserting batteries, then hold HOME button for roughly 20 seconds until it connects. Register the fire tv. When it boots up, go to SETTINGS by holding HOME until SETTINGS appears. Go to SETTINGS > DEVELOPER > Disable ADB, Disable Apps from Unknown."

@echo "Hit ENTER to exit and reboot"

pause

adb -d shell reboot