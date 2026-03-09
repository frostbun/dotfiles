#!/usr/bin/env sh

source ./common.sh


echo "Installing dev packages..."
install - < packages/dev.txt


sudo systemctl enable --now sshd.service
sudo systemctl enable --now docker.service


[ ! -d ~/.local/share/unity3d ] && mkdir -p ~/.local/share/unity3d


~/.vim/bundle/youcompleteme/install.py --all
