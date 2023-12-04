#!/bin/bash

function ask_yes_or_no {
    while true; do
        read -p "$1 (y/n) " yn
        case $yn in
            [Yy]* ) return 0;;
            [Nn]* ) return 1;;
            * ) echo "Please answer yes or no.";;
        esac
    done
}

# Given Ubuntu:

if ask_yes_or_no "Install fish shell?"; then
    sudo nala install fish -y
fi

# Set fish as default shell
if ask_yes_or_no "Set fish as the default shell?"; then
    echo /usr/bin/fish | sudo tee -a /etc/shells
    chsh -s /usr/bin/fish
fi
