#!/usr/bin/env fish

set session_name 'Ros_quad'

tmux kill-session -t $session_name
tmux new-session -d -s $session_name

tmux split-window -v
tmux split-window -h
tmux select-pane -t 0
tmux split-window -h

tmux select-pane -t 0 -T ros_1
tmux select-pane -t 1 -T ros_2
tmux select-pane -t 2 -T ros_3
tmux select-pane -t 3 -T ros_4

tmux send-keys -t 0 "docker start -i ros_quad_1" Enter
tmux send-keys -t 0 "./setup_ros-alate.sh && source ~/.bashrc" Enter
tmux send-keys -t 0 "printenv | grep ROS_DOMAIN" Enter

tmux send-keys -t 1 "docker start -i ros_quad_2" Enter
tmux send-keys -t 1 "./setup_ros-alate.sh && source ~/.bashrc" Enter
tmux send-keys -t 1 "printenv | grep ROS_DOMAIN" Enter

tmux send-keys -t 2 "docker start -i ros_quad_3" Enter
tmux send-keys -t 2 "./setup_ros-alate.sh && source ~/.bashrc" Enter
tmux send-keys -t 2 "printenv | grep ROS_DOMAIN" Enter

tmux send-keys -t 3 "docker start -i ros_quad_4" Enter
tmux send-keys -t 3 "./setup_ros-alate.sh && source ~/.bashrc" Enter
tmux send-keys -t 3 "printenv | grep ROS_DOMAIN" Enter


gnome-terminal -- tmux attach-session -t $session_name &