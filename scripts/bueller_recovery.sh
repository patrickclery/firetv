#!/bin/sh
# THANKS TO: rbox, maximus64, zenofex, everyone at exploitee.rs

# WARNING: Use at your own risk.

# Script to flash prerooted zip images to 1st Gen Amazon Fire TV
# Requires soldering and connecting to an eMMC reader found here https://shop.exploitee.rs/

# This is my folder where I put backups and the zip files
UNLOCKED="no"
SHARED="/media/sf_Shared"

# Unzip rbox's prerooted zips to your $SHARED folder then set this to the location of that folder
# Get those here: https://forum.xda-developers.com/fire-tv/development/prerooted-stock-images-t2882337
ZIP="${SHARED}/bueller-5.2.1.1-rooted_r1" 

# Location where the backups of the CURRENT image on the fire tv will go before it's overwritten
BACKUP="${SHARED}/backup" 

# Download here https://github.com/xpirt/sdat2img
# Then change this to the location of the python script
SDAT2IMG=~/Desktop/sdat2img/sdat2img.py

# This should be the same on most linux systems (tested on Kali linux)
DEVDIR="/dev/disk/by-partlabel"

# Where to mount the mmc partitions
MNT="/mnt/emmc" 
SYSTEM=$MNT/system


# Back everything up JUST IN CASE...

DATE=`date +"%Y-%m-%d-%H%M"`

echo -n "Unmounting system..."
umount $DEVDIR/system
echo "Done."

# echo "Backing up... "
mkdir -p $BACKUP/$DATE
dd if=$DEVDIR/system   | pv -s 805306368 | dd of=$BACKUP/$DATE/system.img
dd if=$DEVDIR/recovery | pv -s 9773056   | dd of=$BACKUP/$DATE/recovery.img

# Make sure to use unlocked bootloader when possible (UNTESTED!)
BOOT=$([ "$UNLOCKED" == "yes" ] && echo "boot_unlocked.img" || echo "boot.img")
dd if=$DEVDIR/boot     | pv -s 6627328   | dd of=$BACKUP/$DATE/$BOOT

echo "Done!"

# echo -n "Clearing data..."
mkfs.ext4 $DEVDIR/userdata
echo "Done."
echo -n "Clearing cache..."
mkfs.ext4 $DEVDIR/cache
echo "Done."


# WORKING
# Extract the image from the ZIP
if [ ! -e "${ZIP}/system_sdat2img.img" ]
then
	echo -n "Converting system.new.dat to img format... "
	$SDAT2IMG $ZIP/system.transfer.list $ZIP/system.new.dat $ZIP/system_sdat2img.img
	echo "Done!"
else
	echo "sdat2img already exists."
fi

# Write the images
# WORKING - Don't use bs=1024 ?? Stalled at 507mb
# dd if=/media/sf_Shared/system_sdat2img.img | pv -s 805306368 | dd of=/dev/disk/by-partlabel/system
dd if=$ZIP/system_sdat2img.img | pv -s 805306368 | dd of=$DEVDIR/system || exit 1
# dd if=/media/sf_Shared/images/boot.img | pv -s 6627328 | dd of=/dev/disk/by-partlabel/boot
dd if=$ZIP/boot.img | pv -s 6627328 | dd of=$DEVIR/boot
# dd if=/media/sf_Shared/images/recovery.img | pv -s 9773056 | dd of=/dev/disk/by-partlabel/recovery
dd if=$ZIP/recovery/recovery.img | pv -s 9773056 | dd of=$DEVIR/recovery

# Mount system

echo "Mounting system..."
mkdir -p $SYSTEM
mount -o rw $DEVDIR/system $SYSTEM || exit 1
if [ ! -e "${SYSTEM}/xbin" ]; then
	echo "ERROR: couldn't find /system/xbin - is the mount point correct?"
	exit 1
fi

# Now copy stuff and root it

echo "Installing TWRP..."
cp -r $ZIP/recovery $SYSTEM
rm -f $SYSTEM/recovery/recovery.img
echo "Chmodding and chconing RECOVERY..."
chown -R 0:0 $SYSTEM/recovery
chmod -R 0755 $SYSTEM/recovery
chcon -R --reference=$SYSTEM/bin $SYSTEM/recovery


# Backing up e2fsck and symlinking it to 2ndinitstub...
mv -i $SYSTEM/bin/e2fsck $SYSTEM/bin/e2fsck.real
echo "Symlink e2fsck to 2ndinitstub..."
ln -sf ../recovery/2ndinitstub $SYSTEM/bin/e2fsck
chcon --reference=$SYSTEM/bin/e2fsck.real -h $SYSTEM/bin/e2fsck

echo "Installing SU..."

cp -f $ZIP/su/su $ZIP/su/supolicy $SYSTEM/xbin/
chown 0:2000  $SYSTEM/xbin/su $SYSTEM/xbin/supolicy
chmod 0755 $SYSTEM/xbin/su $SYSTEM/xbin/supolicy
chcon --reference=$SYSTEM/xbin/trapz    $SYSTEM/xbin/su $SYSTEM/xbin/supolicy
ln -sf su $SYSTEM/xbin/daemonsu
chcon --reference=$SYSTEM/xbin/trapz -h $SYSTEM/xbin/daemonsu

cp $ZIP/su/libsupol.so $SYSTEM/lib/
chmod 0644 $SYSTEM/lib/libsupol.so
chown 0:0  $SYSTEM/lib/libsupol.so
chcon --reference=$SYSTEM/lib/libsuspend.so $SYSTEM/lib/libsupol.so

cp -r $ZIP/su/SuperSU $SYSTEM/app/
chown -R 0:0  $SYSTEM/app/SuperSU
chmod -R 0755 $SYSTEM/app/SuperSU
chcon --reference=$SYSTEM/app/Bluetooth -R $SYSTEM/app/SuperSU

echo "Unmounting system..."
umount $SYSTEM

echo "PWNED!"