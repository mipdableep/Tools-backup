# fish
alias runfish='source ~/.config/fish/config.fish'
alias codefish='code /home/fares/rbd/tools/Tools-backups/aliases/aliases.fish'

#system
alias cling='/home/fares/rbd/tools/cling/inst/bin/cling'
alias codeTools='code /home/fares/rbd/tools/Tools-backups'
alias cdTools='cd /home/fares/rbd/tools'
alias n='nautilus -w . &'
alias getip='hostname -I | cut -d " " -f 1'
alias gfp='git fetch && git pull'
alias Aumountall='sudo umount /media/fares/*'
alias Fumountall='sudo umount -f /media/fares/*'
alias copy='xclip -selection clipboard'
alias pwdc='pwd | copy'
alias py='python3'
alias cp_progress='rsync -ah --progress'
alias rcm='rm -rf ../build/* && cmake .. && make -j'
alias rcmc='echo "rm -rf ../build/* && cmake .. && make -j" | copy'

#rpi
alias emulateRpi='gnome-disk-image-mounter -w /home/fares/rbd/rpi_img_backup/emulate_lite_64.img'
alias emulateROS_SWARM='gnome-disk-image-mounter -w /home/fares/rbd/rpi_img_backup/ROS_rasp_lite_64.img'
alias cdtopi='cd /media/fares/rootfs/home/pi/'
alias rpipinout='eog /home/fares/rbd/tools/hardwere &'
alias runsshServer="cd /home/fares/rbd/tools/Tools-backups/rpi-tools && python3 sshServer.py $1"
alias Sumountsshfs="sudo umount /home/fares/rbd/tools/Tools-backups/rpi-tools/sshDirs/*"
alias internal-pi-chroot="sudo /home/fares/scripts/internal-chroot-to-pi.sh"
alias external-pi-chroot="bash /home/fares/scripts/chrootRunner.sh"

function ifs
    firefox --private-window "https://drive.google.com/drive/u/0/my-drive"
    firefox --private-window "https://drive.google.com/drive/u/0/my-drive" &

    # Wait for Firefox to open and load the page
    while not wmctrl -l | grep -q "Google Drive:"
        sleep 0.1
    end
    sleep 0.3

    xdotool type "ifs.talmor"
    xdotool key Return
end
