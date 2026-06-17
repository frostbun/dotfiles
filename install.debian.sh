#!/usr/bin/env bash

source ./common.sh


echo "Updating system..."
sudo apt update
sudo apt upgrade


echo "Installing required packages..."
sudo apt install -y $(cat packages/required.debian.txt)

curl -fsSL https://opencode.ai/install | bash
curl -fsSL https://claude.ai/install.sh | bash


echo "Enabling required services..."
sudo systemctl enable --now ssh.service
sudo systemctl enable --now docker.service

sudo usermod -aG docker $USER


if [ ! -d ~/.oh-my-zsh ]; then
    echo "Installing Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    touch configs/.zshrc.local
    link .zshrc ~/.zshrc
    link .zshrc.local ~/.zshrc.local
fi


if [ ! -d ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k ]; then
    echo "Installing powerlevel10k..."
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
    link .p10k.zsh ~/.p10k.zsh
fi


if [ ! -d ~/.vim/bundle/Vundle.vim ]; then
    echo "Installing Vundle..."
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    link .vimrc ~/.vimrc
    vim +PluginInstall +qall
    ~/.vim/bundle/youcompleteme/install.py

    sudo rm -rf /root/.vim
    sudo rm -f /root/.vimrc
    sudo cp -r ~/.vim /root/.vim
    sudo cp ~/.vimrc /root/.vimrc
fi


if [ ! -d ~/.tmux/plugins/tpm ]; then
    echo "Installing TPM..."
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    link .tmux.conf ~/.tmux.conf
fi


echo "Creating symlinks for dotfiles..."
link systemd ~/.config/systemd
link .gitconfig ~/.gitconfig
link lazygit ~/.config/lazygit
link bat ~/.config/bat
link btop ~/.config/btop
link fastfetch ~/.config/fastfetch
link ranger ~/.config/ranger
link opencode ~/.config/opencode


echo "Cleaning up..."
sudo apt autoremove --purge -y
sudo apt clean -y


if prompt "Reboot now"; then
    reboot
fi
