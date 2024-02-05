#! /usr/bin/fish

#  Enter Fish and install Fisher and plugins
fish -c "curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher"
# Install Lambda theme
fish -c "fisher install netologist/theme-lambda"
# Install z (improved cd)
fish -c "fisher install jethrokuan/z"
