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
alias codeFish_conf='code /home/ido/Tools/Tools-backup/aliases/config.fish'

# bat
alias cat='batcat'
alias bat='batcat'
# tmux
alias code_tmux_config='code /home/ido/Tools/Tools-backup/aliases/tmux.conf'
# thefuck tool
thefuck --alias | source 

# project
alias alate_launch='/home/ido/RBD/halehaka/Ant-Alate/RUN/scripts/global_launches.fish'
alias alate_global_tmux='/home/ido/RBD/halehaka/Ant-Alate/RUN/scripts/alate_global_tmux.fish'
alias ros_docker='/home/ido/RBD/halehaka/ROS_libs_revamped/Docker/ros_revamped_docker.fish'

function kill_all_alate_dockers
    docker kill (docker ps -a | awk '/drone_.*/{print $1}')
    docker kill ALL-ros_adaptor
end

function kill_alate_docker
    switch $argv[1]
        case 20
            docker kill (docker ps -a | awk '/drone_20.*/{print $1}')
        case 21
            docker kill (docker ps -a | awk '/drone_21.*/{print $1}')
        case 22
            docker kill (docker ps -a | awk '/drone_22.*/{print $1}')
        case 24
            docker kill (docker ps -a | awk '/drone_24.*/{print $1}')
        case '*'
            command ...
    end
end


#system
alias n='nautilus -w . &'
alias gfp='git fetch && git pull'
alias Aumountall='sudo umount /media/ido/*'
alias Fumountall='sudo umount -f /media/ido/*'
alias copy='xclip -selection clipboard'
alias pwdc='pwd | copy'
alias pwdcc='echo "cd" (pwd) | copy'
alias cp_progress='rsync -ah --progress'
alias untar='tar -xzf'
# destroy and build
alias rcm='rm -rf ../build/* && cmake .. && make -j'
# copy rcm
alias rcmc='echo "rm -rf ../build/* && cmake .. && make -j" | copy'
# get the time from google server
alias reset_time="sudo date -s (wget --method=HEAD -qSO- --max-redirect=0 google.com 2>&1 | sed -n 's/^ *Date: *//p')"
# copy the fish shabang
alias cp_fish_shabang='echo "#!/usr/bin/env fish" | copy'
alias n_tmux='gnome-terminal --command="tmux"'
alias matlab='/home/ido/Tools/matlab/R2023a/bin/matlab'
alias xyz2pcd='/home/ido/Tools/xyz2pcd/build/xyz2pcd'

# lsd - vscode terminal 'DroidSansM Nerd Font Mono'
alias ls='lsd' 
alias la='lsd -lA --date relative'
alias la='lsd -lA --total-size --date relative'
alias lt='lsd --tree'
alias ltd='lsd --tree --depth'

# z bind to fzf
alias zz='z -l | choose 1 | fzf | read cd_var && cd $cd_var'

alias config='/usr/bin/git --git-dir=/home/ido/dotfiles --work-tree=/home/ido'

function ifs
    firefox --private-window "https://drive.google.com/drive/u/0/my-drive" &
    guake --hide
    echo "ifs.talmor" | copy
end
