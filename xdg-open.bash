#!/bin/bash

XDG_OPEN="/usr/bin/xdg-open"

if [[ ! -z "$XDG_CONFIG_HOME" ]]; then
    rule_path=$XDG_CONFIG_HOME"/xdg-rules"
else
    rule_path=$HOME"/.config/xdg-rules"
fi
if [[ -e "$rule_path" ]]; then
    source "$rule_path"
else
    echo "No rules file found, create one at $rule_path if you want to use xdg-open-filter."
    eval "$XDG_OPEN $1"
    exit $?
fi

for regex in "${!XDG_RULES[@]}"; do
    if [[ "$1" =~ $regex ]]; then
        cmd="${XDG_RULES[$regex]}"
        eval "$cmd $1"
        [[ "$?" = "0" ]] && exit $?
    fi;
done

eval "$XDG_OPEN $1"
