#!/bin/bash

XDG_OPEN="/usr/bin/xdg-open"

if [[ $XDG_CONFIG_HOME ]]; then
    rule_path=$XDG_CONFIG_HOME"/xdg-rules"
else
    rule_path=$HOME"/.config/xdg-rules"
fi
source "$rule_path"

for regex in "${!XDG_RULES[@]}"; do
    if [[ "$1" =~ $regex ]]; then
        cmd="${XDG_RULES[$regex]}"
        eval "$cmd $1"
        exit 1
    fi;
done

eval "$XDG_OPEN $1"
