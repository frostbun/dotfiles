#!/usr/bin/env sh

source ./common.sh


echo "Installing Hyprland packages..."
install - < packages/hyprland.txt


link hypr ~/.config/hypr
link waybar ~/.config/waybar
link wofi ~/.config/wofi
