#!/bin/sh
mkdir -p /sdcard/Android/data/org.xbmc.kodi/files/

cd /sdcard/Android/data/org.xbmc.kodi/files/
rm -rf .kodi
cp -r /usb/.kodi .

