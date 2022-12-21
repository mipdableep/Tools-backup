#$1 = ip of pi, $2 = path to sshfs ready folder

gnome-terminal -- sh -c "bash -c \"sudo ssh pi@$1; exec bash\""

function runsshfs(){
    sudo sshfs -o allow_other pi@$1:/home/pi/ $2
    cd $2
}
gnome-terminal -- sh -c "bash -c \"sudo sshfs -o allow_other pi@$1:/home/pi/ $2 && cd $2; exec bash\""


