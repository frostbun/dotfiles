#!/usr/bin/env bash

source ./common.sh


echo "Installing Vim..."
git clone --depth 1 https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
link .vimrc ~/.vimrc
vim +PluginInstall +qall

sudo rm -rf /root/.vim
sudo rm -f /root/.vimrc
sudo cp -r ~/.vim /root/.vim
sudo cp ~/.vimrc /root/.vimrc
