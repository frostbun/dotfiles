#!/usr/bin/env bash

source ./common.sh


echo "Installing games..."
sudo sed -i "/^#\[multilib\]/,/Include/"'s/^#//' /etc/pacman.conf
install < packages/games.txt
