#!/usr/bin/env bash

source ./common.sh


./install.arch.sh
./install.dev.sh


echo "Cleaning up..."
yay -Ycc --noconfirm
yay -Scc --noconfirm


if prompt "Reboot now"; then
    reboot
fi
