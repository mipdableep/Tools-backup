#!/usr/bin/env fish

set script_path (realpath (dirname (status --current-filename)))

docker run \
    -e ROS_DOMAIN_ID=0 \
    -v $script_path/bash/bash_aliases.sh:/root/.bash_aliases \
    -v $script_path/bash/bashrc.sh:/root/.bashrc \
    -v $script_path/../ws_ros:/ws_ros \
    # --rm \
    --network=host \
    --ipc=host \
    --pid=host \
    --privileged \
    --cap-add=NET_ADMIN \
    --user=root \
    --name ros_0 \
    -it myros:deps_and_code_extentions
