#!/usr/bin/env sh

source ./common.sh


echo "Installing dev packages..."
install - < packages/dev.txt


link opencode ~/.config/opencode


sudo usermod -aG docker $USER
sudo systemctl enable --now docker.service


[ ! -d ~/.local/share/unity3d ] && mkdir -p ~/.local/share/unity3d
