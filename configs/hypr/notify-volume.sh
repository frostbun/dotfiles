#!/usr/bin/env sh

info=$(wpctl get-volume @DEFAULT_AUDIO_SINK@)

volume=$(echo $info | awk '{print int($2*100)}')

if echo "$info" | grep -q MUTED; then
    status="Muted"
    icon="$HOME/.icons/candy-icons/status/scalable/audio-volume-muted-symbolic.svg"
else
    status="$volume%"
    if [ "$volume" -gt 100 ]; then
        icon="$HOME/.icons/candy-icons/status/scalable/audio-volume-overamplified-symbolic.svg"
    elif [ "$volume" -gt 70 ]; then
        icon="$HOME/.icons/candy-icons/status/scalable/audio-volume-high-symbolic.svg"
    elif [ "$volume" -gt 30 ]; then
        icon="$HOME/.icons/candy-icons/status/scalable/audio-volume-medium-symbolic.svg"
    else
        icon="$HOME/.icons/candy-icons/status/scalable/audio-volume-low-symbolic.svg"
    fi
fi

name=$(wpctl inspect @DEFAULT_SINK@ | grep node.description | awk -F'"' '{print $2}')
[ ${#name} -gt 16 ] && name="${name:0:13}..." 

notify-send -a "notify-volume" -r 50 "Volume: $status" "$name" -h int:value:$volume -i $icon
