#!/usr/bin/env bash

source ./common.sh


curl -fsSL https://yazi-rs.github.io/builds/yazi-keyring.gpg | sudo tee /usr/share/keyrings/yazi-keyring.gpg >/dev/null
echo 'deb [signed-by=/usr/share/keyrings/yazi-keyring.gpg] https://yazi-rs.github.io/builds/ stable main' | sudo tee /etc/apt/sources.list.d/yazi.list >/dev/null


echo "Updating system..."
sudo apt update
sudo apt upgrade


echo "Installing required packages..."
sudo apt install -y $(cat packages/debian.txt)

curl -fsSL https://herdr.dev/install.sh | bash
curl -fsSL https://bun.sh/install | bash
bun install -g @oh-my-pi/pi-coding-agent


echo "Enabling required services..."
sudo systemctl enable --now ssh.service


if prompt "Install Zsh"; then
    ./install.zsh.sh
fi


if prompt "Install LazyVim"; then
    git clone https://github.com/LazyVim/starter ~/.config/nvim
    sudo git clone https://github.com/LazyVim/starter /root/.config/nvim
fi


echo "Creating symlinks for dotfiles..."
link .gitconfig ~/.gitconfig
link fastfetch ~/.config/fastfetch


echo "Cleaning up..."
sudo apt autoremove --purge -y
sudo apt clean -y


if prompt "Reboot now"; then
    reboot
fi
