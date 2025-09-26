#!/usr/bin/env sh

source ./common.sh


echo "Installing Hyprland packages..."
yay -Q dolphin && yay -Rcns --noconfirm dolphin
install - < packages/hyprland.txt


echo "Creating symlinks for dotfiles..."
link hypr ~/.config/hypr
link waybar ~/.config/waybar
link wofi ~/.config/wofi
link dunst ~/.config/dunst


dconf write /com/github/stunkymonkey/nautilus-open-any-terminal/terminal "'kitty'"
dconf write /org/gnome/desktop/interface/color-scheme "'prefer-dark'"
dconf write /org/gnome/desktop/interface/icon-theme "'candy-icons'"
