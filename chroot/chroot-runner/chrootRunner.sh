#cd to a directory with the chroot-to-pi.sh script
a=$(sudo fdisk -l | grep "Disk /dev/sd" | cut -b 13)

b="/dev/sd$a"

sudo ./chroot-to-pi.sh $b
