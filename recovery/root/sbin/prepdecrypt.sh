#!/sbin/sh

suffix=$(getprop ro.boot.slot_suffix)
if [ -z "$suffix" ]; then
    suf=$(getprop ro.boot.slot)
    suffix="_$suf"
fi

venpath="/dev/block/bootdevice/by-name/vendor$suffix"
mkdir /v
mount -t ext4 -o ro "$venpath" /v

syspath="/dev/block/bootdevice/by-name/system$suffix"
mkdir /s
mount -t ext4 -o ro "$syspath" /s

is_fastboot_twrp=$(getprop ro.boot.fastboot)
venpatchlevel=$(grep -i 'ro.vendor.build.security_patch=' "/v/build.prop"  | cut -f2 -d'=' -s)
osver=$(grep -i 'ro.build.version.release=' "/s/system/build.prop"  | cut -f2 -d'=' -s)
patchlevel=$(grep -i 'ro.build.version.security_patch=' "/s/system/build.prop"  | cut -f2 -d'=' -s)

if [ "$is_fastboot_twrp" != "1" ]; then   
    resetprop "ro.vendor.build.security_patch" "$venpatchlevel"
    resetprop "ro.build.version.release" "$osver"
    resetprop "ro.build.version.security_patch" "$patchlevel"
fi

umount /v
umount /s
rmdir /v
rmdir /s
setprop crypto.ready 1
exit 0
