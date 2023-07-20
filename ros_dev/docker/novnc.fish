#!/usr/bin/env fish

firefox -new-window http://localhost:8080/vnc.html &

docker kill novnc

docker run \
    -d \
    --rm \
    --net=ros \
    -e DISPLAY_WIDTH=1848 \
    -e DISPLAY_HEIGHT=930 \
    -e RUN_XTERM=no \
    --name=novnc \
    -p=8080:8080 \
    theasp/novnc:latest

