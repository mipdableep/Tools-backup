#!/usr/bin/env fish

set session_name 'Ros-alate'

tmux kill-session -t $session_name
tmux new-session -d -s $session_name

tmux split-window -v
tmux split-window -h
tmux select-pane -t 0
tmux split-window -h

tmux select-pane -t 0 -T ros_alate_runner
tmux select-pane -t 1 -T ros_alate_sub
tmux select-pane -t 2 -T ros_1
tmux select-pane -t 3 -T ros_2

tmux send-keys -t 0 'cd /home/fares/rbd/projects/HALEHAKA/zip_swarm_middleware/swarm_middleware && ./docker/run_docker.fish' Enter

tmux send-keys -t 1 'cd /home/fares/rbd/projects/HALEHAKA/zip_swarm_middleware/swarm_middleware && ./docker/run_docker.fish' Enter

tmux send-keys -t 2 "docker start -i ros_1" Enter
tmux send-keys -t 2 "./setup_ros-alate.sh && source ~/.bashrc" Enter

tmux send-keys -t 3 "docker start -i ros_2" Enter
tmux send-keys -t 3 "./setup_ros-alate.sh && source ~/.bashrc" Enter


gnome-terminal -- tmux attach-session -t $session_name &