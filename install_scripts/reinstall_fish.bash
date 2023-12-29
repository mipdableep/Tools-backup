#!/bin/bash

# Given Ubuntu:
sudo nala install fish -y

# Set fish as default shell
echo /usr/bin/fish | sudo tee -a /etc/shells
chsh -s /usr/bin/fish
