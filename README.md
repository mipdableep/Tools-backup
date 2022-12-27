# rpi tools

this repo was created to store usefull tools that relate to work with rpi

## ipServer
the client runs on the rpi to send its ip to the server (that runs on the computer) which stores the the ips in a text file
in the futer it might have the functinality of controlling multiple rpi's remotly at once

## ssh_automation
the server runs on the computer, and waits for a spacific amount of devices to send their ip address, and opens an ssh and sshfs to each of them (thrugh terminal right now, needs a better solution - tmux?) make sure all paths are correct

## aliases.sh
usefull commands in cmd

## chroot and qemu
emulation tool for arm64 cpu, and rpi0w2

## chroot-runner
scripts for runing chroot automaticly