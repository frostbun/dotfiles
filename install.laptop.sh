#!/usr/bin/env bash

source ./common.sh


echo "Installing laptop packages..."
install < packages/required.laptop.txt


sudo systemctl enable --now tlp.service
