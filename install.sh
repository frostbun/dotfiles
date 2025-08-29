#!/usr/bin/sh

dotfile=$(pwd)

sudo pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si && cd .. && rm -rf yay

yay -S --needed reflector

sudo systemctl enable --now reflector.timer
sudo systemctl start reflector.service

yay -S --needed - < packages.txt

ln -s $dotfile/.zshrc ~/.zshrc
ln -s $dotfile/.vimrc ~/.vimrc
ln -s $dotfile/.gitconfig ~/.gitconfig
ln -s $dotfile/kitty ~/.config/kitty
ln -s $dotfile/ranger ~/.config/ranger
ln -s $dotfile/btop ~/.config/btop
ln -s $dotfile/cava ~/.config/cava

sudo systemctl enable --now sshd
sudo systemctl enable --now docker
sudo systemctl enable --now warp-svc

mkdir -p ~/.local/share/unity3d
