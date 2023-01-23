run the next command to mount the img
```
gnome-disk-image-mounter -w <img/path>
```

then chroot as usual

use the next command to automate loop device selection
```
sudo /home/fares/scripts/chroot-to-pi.sh /dev/loop`sudo ls /dev/ | grep 'loop' | cut -b 5- | grep p1 | cut -b -2`p
```