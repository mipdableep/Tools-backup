#project arucoSwarm
alias codePiAruco='code /media/fares/rootfs/home/pi/arucoSwarm/'
alias runserver='python3 /home/fares/rbd/projects/aruco_swarm/arucoSwarm/server.py 0.0.0.0 9090 $1'
alias copynewexe="cp runAruco /home/fares/rbd/projects/aruco_swarm/"
alias copyexe="cp /home/fares/rbd/projects/aruco_swarm/runAruco ."
alias cdProject="cd /home/fares/rbd/projects/aruco_swarm/"


#system
alias cling='/home/fares/rbd/tools/cling/inst/bin/cling'
alias codeTools='code /home/fares/rbd/tools/Tools-backups'
alias n='nautilus -w . &'
alias getip='hostname -I | cut -d " " -f 1'
alias gfp='git fetch && git pull'
alias rcm="rm -rf ../build/* && cmake .. && make -j"
alias Aumountall='sudo umount /media/fares/*'
alias Fumountall='sudo umount -f /media/fares/*'
alias copy='xclip -selection clipboard'
alias pwdc='pwd | copy'
alias py='python3'
alias cp_progress='rsync -ah --progress'
alias rcmc='echo "rm -rf ../build/* && cmake .. && make -j" | copy'


#rpi
alias emulateRpi='gnome-disk-image-mounter -w /home/fares/rbd/rpi_img_backup/emulate_lite_64.img'
alias cdtopi='cd /media/fares/rootfs/home/pi/'
alias rpipinout='eog /home/fares/rbd/tools/hardwere &'
alias runsshServer="cd /home/fares/rbd/tools/Tools-backups/rpi-Tools/ssh_automation && python3 sshServer.py $1"
alias Sumountsshfs="sudo umount /home/fares/rbd/tools/Tools-backups/rpi-Tools/ssh_automation/sshDirs/*"
alias internal-pi-chroot="sudo /home/fares/scripts/internal-chroot-to-pi.sh"

#bashrc related
alias runbashrc='. ~/.bashrc'
alias codebashrc='code /home/fares/.bashrc'