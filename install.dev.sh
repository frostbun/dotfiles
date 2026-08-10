#!/usr/bin/env bash

source ./common.sh


echo "Installing dev packages..."
install < packages/dev.txt


link opencode ~/.config/opencode


[ ! -d ~/.local/share/unity3d ] && mkdir -p ~/.local/share/unity3d
