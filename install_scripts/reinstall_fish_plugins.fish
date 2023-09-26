#! /usr/bin/fish
function ask_yes_or_no
    while true
        echo "$argv (y/n) " 
        read yn
        if string match -q -r '^[Yy]' $yn
            return 0
        else if string match -q -r '^[Nn]' $yn
            return 1
        else
        end
    end
end

#  Enter Fish and install Fisher and plugins
if ask_yes_or_no "Enter Fish shell and install Fisher and plugins?"
    fish -c "curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher"
end

# Install Lambda theme
if ask_yes_or_no "Install Lambda theme?"
    fish -c "fisher install netologist/theme-lambda"
end

# Install z (improved cd)
if ask_yes_or_no "Install z (improved cd)?"
    fish -c "fisher install jethrokuan/z"
end
