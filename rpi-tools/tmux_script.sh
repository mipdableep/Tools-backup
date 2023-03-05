#!/bin/bash

tmux rename-session sshServer
tmux select-pane -T PI-drone1
tmux send-keys 'sudo ssh pi@10.3.141.113' Enter

tmux split-window -h
tmux select-pane -T PI-drone2
tmux send-keys 'sudo ssh pi@10.3.141.207' Enter

tmux split-window -h
tmux select-pane -T PI-drone3
tmux send-keys 'sudo ssh pi@10.3.141.55' Enter

tmux split-window -h
tmux select-pane -T PI-drone4
tmux send-keys 'sudo ssh pi@10.3.141.70' Enter
tmux select-layout even-horizontal
tmux select-pane -R

tmux new-window -n sshfs 
tmux select-pane -T sshFS-drone1
tmux send-keys 'sudo sshfs -o allow_other pi@10.3.141.113:/home/pi/ /home/fares/rbd/tools/Tools-backups/rpi-Tools/ssh_automation/sshDirs/drone1 && cd /home/fares/rbd/tools/Tools-backups/rpi-Tools/ssh_automation/sshDirs/drone1' Enter

tmux split-window -h
tmux select-pane -T sshFS-drone2
tmux send-keys 'sudo sshfs -o allow_other pi@10.3.141.207:/home/pi/ /home/fares/rbd/tools/Tools-backups/rpi-Tools/ssh_automation/sshDirs/drone2 && cd /home/fares/rbd/tools/Tools-backups/rpi-Tools/ssh_automation/sshDirs/drone2' Enter

tmux split-window -h
tmux select-pane -T sshFS-drone3
tmux send-keys 'sudo sshfs -o allow_other pi@10.3.141.55:/home/pi/ /home/fares/rbd/tools/Tools-backups/rpi-Tools/ssh_automation/sshDirs/drone3 && cd /home/fares/rbd/tools/Tools-backups/rpi-Tools/ssh_automation/sshDirs/drone3' Enter

tmux split-window -h
tmux select-pane -T sshFS-drone4
tmux send-keys 'sudo sshfs -o allow_other pi@10.3.141.70:/home/pi/ /home/fares/rbd/tools/Tools-backups/rpi-Tools/ssh_automation/sshDirs/drone4 && cd /home/fares/rbd/tools/Tools-backups/rpi-Tools/ssh_automation/sshDirs/drone4' Enter
tmux select-layout even-horizontal
