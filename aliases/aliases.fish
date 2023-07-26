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
alias codefish='code /home/ido/Tools/Tools-backup/aliases/aliases.fish'
alias codeFish_conf='code ~/.config/fish/config.fish'

# bat
alias cat='batcat'

#system
alias n='nautilus -w . &'
alias gfp='git fetch && git pull'
alias Aumountall='sudo umount /media/ido/*'
alias Fumountall='sudo umount -f /media/ido/*'
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
alias n_tmux='gnome-terminal --command="tmux"'
alias run_ros_docker='./setup_ros-alate.sh && source ~/.bashrc | cp && cd /home/fares/rbd/projects/HALEHAKA/ros-libs/ && ./run_ros_docker.fish'

function ifs
    firefox --private-window "https://drive.google.com/drive/u/0/my-drive" &

    # Wait for Firefox to open and load the page
    sleep 2

    guake --hide
    xdotool type "ifs.talmor"
    xdotool key Return
end
