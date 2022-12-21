#opens vs-code at the raspberry pi home folder
alias codePi='code /media/fares/rootfs/home/pi/'
#open ssh with the argumant being the ip of the pi
alias sshfspi="sudo sshfs -o allow_other pi@$1:/home/pi/ /media/fares/sshTest"
#cd to pi home dir
alias cdtopi='cd /media/fares/rootfs/home/pi/'