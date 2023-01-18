#costum
    
    remove_cmake_make(){
        if [[ $(ls . | grep ".cmake") ]]
        then
            echo -e "\ndeleating dir\n"
            rm -rf *
            cmake .. 
            make -j
        else
            echo "no cmake to delete"
        fi
        }



    #project arucoSwarm
    alias codePiAruco='code /media/fares/rootfs/home/pi/arucoSwarm/'
    alias runserver='python3 /home/fares/rbd/projects/aruco_swarm/arucoSwarm/server.py 0.0.0.0 9090 $1'

    alias copyexe="cp followAruco /home/fares/rbd/projects/aruco_swarm/"
    alias runsshServer="cd /home/fares/rbd/tools/rpi-Tools/ssh_automation && python3 sshServer.py $1"

    #system
    alias n='nautilus -w . &'
    alias getip='hostname -I | cut -d " " -f 1'
    alias gfp='git fetch && git pull'
    alias rcm=remove_cmake_make
    alias umountall='sudo umount /media/fares/*'
    alias copy='xclip -selection clipboard'
    alias pwdc='pwd | copy'
    alias py='python3'
    alias cp_progress='rsync -ah --progress'
    alias rcmc='echo "*rm -rf * && cmake .. && make -j" | copy'

    #rpi
    alias cdtopi='cd /media/fares/rootfs/home/pi/'
    alias rpipinout='eog /home/fares/rbd/tools/hardwere &'

    #bashrc related
    alias runbashrc='. ~/.bashrc'
    alias codebashrc='code /home/fares/.bashrc'