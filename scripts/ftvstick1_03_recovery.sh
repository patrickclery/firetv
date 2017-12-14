#!/bin/bash

device_name=`adb devices|egrep ^7|sed -e 's/\srecovery$//g'`
echo $device_name

echo "[CONNECTING]: Type 'mouse' press enter, then press 'd' to launch recovery:"
adb -s $device_name shell
