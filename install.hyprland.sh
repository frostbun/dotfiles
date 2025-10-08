#!/usr/bin/env sh

source ./common.sh


echo "Installing Hyprland packages..."
yay -Rcns --noconfirm $(comm -12 <(yay -Qq | sort) <(sort packages/hyprland.bloatwares.txt))
install - < packages/hyprland.txt


echo "Installing Hyprland plugins..."
hyprpm update
hyprpm add https://github.com/hyprwm/hyprland-plugins
hyprpm enable hyprexpo


echo "Creating symlinks for dotfiles..."
mkdir $dotfiles/configs/hypr/hyprland/custom
touch $dotfiles/configs/hypr/hyprland/custom/custom.conf
link hypr ~/.config/hypr
link waybar ~/.config/waybar
link wofi ~/.config/wofi
link dunst ~/.config/dunst


dconf write /com/github/stunkymonkey/nautilus-open-any-terminal/terminal "'kitty'"
dconf write /org/gnome/desktop/interface/color-scheme "'prefer-dark'"
dconf write /org/gnome/desktop/interface/accent-color "'purple'"
dconf write /org/gnome/desktop/interface/icon-theme "'candy-icons'"
