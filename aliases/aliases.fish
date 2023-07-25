# start conda
function start_conda
    if test -f /home/fares/rbd/tools/MambaForge/bin/conda
        eval /home/fares/rbd/tools/MambaForge/bin/conda "shell.fish" "hook" $argv | source
    end
end

function mkcdir
    mkdir -p -- $argv[1]
    cd $argv[1]
end

# fish
alias runfish='source ~/.config/fish/config.fish'
alias codefish='code /home/fares/rbd/tools/Tools-backups/aliases/aliases.fish'
alias codeFish_conf='code /home/fares/.config/fish/config.fish'

#system
alias n='nautilus -w . &'
alias gfp='git fetch && git pull'
alias Aumountall='sudo umount /media/fares/*'
alias Fumountall='sudo umount -f /media/fares/*'
alias copy='xclip -selection clipboard'
alias pwdc='pwd | copy'
alias pwdcc='echo "cd" (pwd) | copy'
alias cp_progress='rsync -ah --progress'
# destroy and build
alias rcm='rm -rf ../build/* && cmake .. && make -j'
# copy rcm
alias rcmc='echo "rm -rf ../build/* && cmake .. && make -j" | copy'
# get the time from google server
alias reset_time="sudo date -s (wget --method=HEAD -qSO- --max-redirect=0 google.com 2>&1 | sed -n 's/^ *Date: *//p')"
alias untar='tar -xzf'
# copy the fish shabang
alias cp_fish_shabang='echo "#!/usr/bin/env fish" | copy'
# matlab
alias matlab='/home/fares/rbd/tools/matlab/data/bin/matlab &'
alias n_tmux='gnome-terminal --command="tmux"'
alias run_ros_docker='./setup_ros-alate.sh && source ~/.bashrc | cp && cd /home/fares/rbd/projects/HALEHAKA/ros-libs/ && ./run_ros_docker.fish'
alias ros_tmux='/home/fares/rbd/tools/Tools-backups/scripts/tmux_ros.fish'
alias ros_quad_tmux='/home/fares/rbd/tools/Tools-backups/scripts/ros_quad.fish'

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
    firefox --private-window "https://drive.google.com/drive/u/0/my-drive" &

    # Wait for Firefox to open and load the page
    sleep 2

    guake --hide
    xdotool type "ifs.talmor"
    xdotool key Return
end
