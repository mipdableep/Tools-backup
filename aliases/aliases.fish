# fish
alias runfish='source ~/.config/fish/config.fish'
alias codefish='code /home/fares/rbd/tools/Tools-backups/aliases/aliases.fish'

#system
alias cling='/home/fares/rbd/tools/cling/inst/bin/cling'
alias codeTools='code /home/fares/rbd/tools/Tools-backups'
alias n='nautilus -w . &'
alias getip='hostname -I | cut -d " " -f 1'
alias gfp='git fetch && git pull'
alias rcm=remove_cmake_make
alias Aumountall='sudo umount /media/fares/*'
alias Fumountall='sudo umount -f /media/fares/*'
alias copy='xclip -selection clipboard'
alias pwdc='pwd | copy'
alias py='python3'
alias cp_progress='rsync -ah --progress'
alias rcmc='echo "*rm -rf * && cmake .. && make -j" | copy'
