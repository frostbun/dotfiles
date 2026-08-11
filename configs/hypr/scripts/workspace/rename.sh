#!/usr/bin/env bash

active=$(hyprctl activeworkspace -j)

id=$(echo "$active" | jq -r ".id")

name=$(echo "$active" | jq -r ".name")

current=${name#"$id"}
current=${current#-}

new=$(wofi --dmenu --search="$current" --lines=1 --cache-file=/dev/null)

[ $? -ne 0 ] && exit 0

if [ -z "$new" ]; then
    hyprctl dispatch "hl.dsp.workspace.rename({ workspace = '$id', name = '$id' })"
else
    hyprctl dispatch "hl.dsp.workspace.rename({ workspace = '$id', name = '$id-$new' })"
fi
