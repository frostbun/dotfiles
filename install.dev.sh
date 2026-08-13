#!/usr/bin/env bash

source ./common.sh


echo "Installing dev packages..."
install < packages/dev.txt


sudo touch /etc/containers/nodocker
echo -e "[engine]\ncompose_warning_logs = false" | sudo tee /etc/containers/containers.conf
systemctl --user enable --now podman-restart.service


link opencode ~/.config/opencode


[ ! -d ~/.local/share/unity3d ] && mkdir -p ~/.local/share/unity3d
