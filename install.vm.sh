#!/usr/bin/env bash

source ./common.sh


./install.arch.sh


echo "Installing required packages..."
install < packages/vm.txt


echo "Enabling required services..."
sudo touch /etc/containers/nodocker
echo -e "[engine]\ncompose_warning_logs = false" | sudo tee /etc/containers/containers.conf
systemctl --user enable --now podman-restart.service


echo "Creating symlinks for dotfiles..."
link opencode ~/.config/opencode


echo "Cleaning up..."
yay -Ycc --noconfirm
yay -Scc --noconfirm


if prompt "Reboot now"; then
    reboot
fi
