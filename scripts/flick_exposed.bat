@echo off

echo Flicking the Xposed switches

rem Add 200 pixels to the Y axis to hit each check box

adb -d shell input touchscreen tap 1850 130
adb -d shell input touchscreen tap 1850 330

echo Done!
