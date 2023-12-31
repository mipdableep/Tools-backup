#! /bin/bash

if [[ "$(awk '$5=="/" {print $1}' </proc/1/mountinfo)" != "$(awk '$5=="/" {print $1}' </proc/$$/mountinfo)" ]]
then
    echo -e "\nin chroot, breaking\n"
else

    sleep 3
    python3 /home/pi/sshServer_boot/sshClient.py    
fi
