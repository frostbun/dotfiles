#!/usr/bin/env sh

source ./common.sh


echo "Installing Hyprland packages..."
install - < packages/hyprland.txt


echo "Installing Nautilus..."
yay -Rcns --noconfirm dolphin
install nautilus nautilus-open-any-terminal
dconf write /com/github/stunkymonkey/nautilus-open-any-terminal/terminal "'kitty'"


echo "Creating symlinks for dotfiles..."
link hypr ~/.config/hypr
link waybar ~/.config/waybar
link wofi ~/.config/wofi
link dunst ~/.config/dunst
