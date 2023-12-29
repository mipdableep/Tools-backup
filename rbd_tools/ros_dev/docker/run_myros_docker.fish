#!/usr/bin/env fish

set script_path (realpath (dirname (status --current-filename)))

docker run \
    -e ROS_DOMAIN_ID=0 \
    -v $script_path/bash/bash_aliases.sh:/root/.bash_aliases \
    -v $script_path/bash/bashrc.sh:/root/.bashrc \
    -v $script_path/../ws_ros:/ws_ros \
    --ipc=host \
    --pid=host \
    # docker network named ros - use docker network --help
    --net=ros \
    # pipe gui apps to novnc
    -e DISPLAY=novnc:0.0 \
    # 
    --rm \
    # --name learning_ros \
    -it myros:learning

