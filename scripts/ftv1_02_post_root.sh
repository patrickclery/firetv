#!/bin/sh

# Upload and run recovery zip
adb push -p ../prerooted_zips/bueller-5.2.1.1-rooted_r1.zip /sdcard/
adb push -p ../recovery/bueller_recovery_v2.zip /sdcard/
adb shell su -c "sh /sdcard/bueller_recovery_v2.zip"