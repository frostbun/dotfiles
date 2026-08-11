#!/usr/bin/env bash

source ./common.sh


echo "Installing Hyprland packages..."
yay -Rcns --noconfirm $(comm -12 <(yay -Qq | sort) <(sort packages/hyprland.bloatwares.txt))
install < packages/hyprland.txt


echo "Creating symlinks for dotfiles..."
[ ! -d $dotfiles/configs/hypr/hyprland/custom ] && mkdir -p $dotfiles/configs/hypr/hyprland/custom
[ ! -f $dotfiles/configs/hypr/hyprland/custom/custom.lua ] && touch $dotfiles/configs/hypr/hyprland/custom/custom.lua
link hypr ~/.config/hypr


dconf write /org/gnome/desktop/interface/color-scheme "'prefer-dark'"
dconf write /org/gnome/desktop/interface/icon-theme "'candy-icons'"
