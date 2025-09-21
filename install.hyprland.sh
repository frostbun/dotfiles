#!/usr/bin/env sh

source ./common.sh


echo "Installing Hyprland packages..."
install - < packages/hyprland.txt


echo "Creating symlinks for dotfiles..."
link hypr ~/.config/hypr
link waybar ~/.config/waybar
link wofi ~/.config/wofi
link dunst ~/.config/dunst
