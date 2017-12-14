adb -d push ../scripts/aftv-initd-scripts/factoryadb.sh /sdcard/
adb -d push ../scripts/aftv-initd-scripts/enableotg /sdcard/
adb -d push ../scripts/aftv-initd-scripts/setup_initd.sh /sdcard/
adb -d shell "su -c 'chmod 755 /sdcard/setup_initd.sh'"
adb -d shell "su -c 'sh /sdcard/setup_initd.sh'"

@echo Now type 'su' and run /sdcard/setup_initd.sh

adb -d shell

pause

