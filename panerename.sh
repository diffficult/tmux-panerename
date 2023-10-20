#!/bin/bash

# Declare the custom renames using an associative array
declare -A custom_renames

# Define your custom renames here
# custom_renames["zsh"]="🐢"
# custom_renames["example"]="\uE795"  # Unicode character for your example
custom_renames["nvim"]="neo"
custom_renames["zsh"]=" "
custom_renames["btop"]=" btop"
custom_renames["yay"]=" yay"
custom_renames["vim"]="im"
custom_renames["nano"]=" nano"

# Function to rename the window pane
rename_pane() {
    local current_title
    current_title=$(tmux display-message -p '#W')
    local new_title
    new_title="${custom_renames[$current_title]}"

    # If a custom title exists, rename the window pane
    if [[ ! -z $new_title ]]; then
        tmux rename-window "$new_title"
    fi
}

# Call the rename_pane function
panerename

