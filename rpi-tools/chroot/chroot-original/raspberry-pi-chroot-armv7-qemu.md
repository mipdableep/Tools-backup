## install dependecies
apt-get install qemu qemu-user-static binfmt-support

## download raspbian image
wget https://downloads.raspberrypi.org/raspbian_latest

## extract raspbian image
unzip raspbian_latest

## extend raspbian image by 1gb
dd if=/dev/zero bs=1M count=1024 >> 2016-05-27-raspbian-jessie.img

## set up image as loop device
losetup /dev/loop0 2016-05-27-raspbian-jessie.img

## check file system
e2fsck -f /dev/loop0p2

#expand partition
resize2fs /dev/loop0p2

## mount partition
mount -o rw /dev/loop0p2  /mnt
mount -o rw /dev/loop0p1 /mnt/boot

## mount binds
mount --bind /dev /mnt/dev/
mount --bind /sys /mnt/sys/
mount --bind /proc /mnt/proc/
mount --bind /dev/pts /mnt/dev/pts

## ld.so.preload fix
sed -i 's/^/#/g' /mnt/etc/ld.so.preload

## copy qemu binary
cp /usr/bin/qemu-arm-static /mnt/usr/bin/

## chroot to raspbian
chroot /mnt /bin/bash
	# do stuff...
	exit

## revert ld.so.preload fix
sed -i 's/^#//g' /mnt/etc/ld.so.preload

## unmount everything
umount /mnt/{dev/pts,dev,sys,proc,boot,}

## unmount loop device
losetup -d /dev/loop0

# source
https://wiki.debian.org/RaspberryPi/qemu-user-static