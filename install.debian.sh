#!/usr/bin/env bash

source ./common.sh


curl -fsSL https://yazi-rs.github.io/builds/yazi-keyring.gpg | sudo tee /usr/share/keyrings/yazi-keyring.gpg >/dev/null
echo 'deb [signed-by=/usr/share/keyrings/yazi-keyring.gpg] https://yazi-rs.github.io/builds/ stable main' | sudo tee /etc/apt/sources.list.d/yazi.list >/dev/null


echo "Updating system..."
sudo apt update
sudo apt upgrade


echo "Installing required packages..."
sudo apt install -y $(cat packages/required.debian.txt)

curl -fsSL https://opencode.ai/install | bash
curl -fsSL https://claude.ai/install.sh | bash


echo "Enabling required services..."
sudo systemctl enable --now ssh.service


if prompt "Install Zsh"; then
    ./install.zsh.sh
fi


if prompt "Install Vim"; then
    ./install.vim.sh
fi


if prompt "Install Tmux"; then
    ./install.tmux.sh
fi


echo "Creating symlinks for dotfiles..."
link systemd ~/.config/systemd
link .gitconfig ~/.gitconfig
link lazygit ~/.config/lazygit
link bat ~/.config/bat
link btop ~/.config/btop
link fastfetch ~/.config/fastfetch
link opencode ~/.config/opencode


echo "Cleaning up..."
sudo apt autoremove --purge -y
sudo apt clean -y


if prompt "Reboot now"; then
    reboot
fi
