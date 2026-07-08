#!/usr/bin/env bash

source ./common.sh


echo "Installing Hyprland packages..."
yay -Rcns --noconfirm $(comm -12 <(yay -Qq | sort) <(sort packages/hyprland.bloatwares.txt))
install < packages/hyprland.txt


echo "Installing Hyprland plugins..."
hyprpm update
hyprpm add https://github.com/colonelpanic8/hyprexpo
hyprpm add https://github.com/KZDKM/Hyprspace
hyprpm add https://github.com/VirtCode/hypr-dynamic-cursors
hyprpm enable hyprexpo
hyprpm enable Hyprspace
hyprpm enable dynamic-cursors


if prompt "Fetch emoji list"; then
    ~/.config/hypr/scripts/clipboard/emoji-fetch
fi


echo "Creating symlinks for dotfiles..."
[ ! -d $dotfiles/configs/hypr/hyprland/custom ] && mkdir -p $dotfiles/configs/hypr/hyprland/custom
[ ! -f $dotfiles/configs/hypr/hyprland/custom/custom.conf ] && touch $dotfiles/configs/hypr/hyprland/custom/custom.conf
link hypr ~/.config/hypr
link waybar ~/.config/waybar
link wofi ~/.config/wofi
link dunst ~/.config/dunst


dconf write /org/gnome/desktop/interface/color-scheme "'prefer-dark'"
dconf write /org/gnome/desktop/interface/icon-theme "'candy-icons'"
