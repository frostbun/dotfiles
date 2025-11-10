#!/usr/bin/env sh

source ./common.sh


echo "Installing games..."
sudo cp -f configs/pacman.conf /etc/pacman.conf
install - < packages/games.txt
