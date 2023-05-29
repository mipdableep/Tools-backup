#!/bin/bash

tmux rename-session sshServer
tmux select-pane -T PI-ROS_alate_1
tmux send-keys 'sudo ssh pi@10.3.141.93' Enter
tmux select-layout even-horizontal
tmux select-pane -R

tmux new-window -n sshfs 
tmux select-pane -T sshFS-ROS_alate_1
tmux send-keys 'sudo sshfs -o allow_other pi@10.3.141.93:/home/pi/ /home/fares/rbd/tools/Tools-backups/rpi-tools/sshDirs/ROS_alate_1 && cd /home/fares/rbd/tools/Tools-backups/rpi-tools/sshDirs/ROS_alate_1' Enter
tmux select-layout even-horizontal
