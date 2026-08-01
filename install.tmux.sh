#!/usr/bin/env bash

source ./common.sh


echo "Installing Tmux..."
git clone --depth 1 https://github.com/tmux-plugins/tpm.git ~/.tmux/plugins/tpm
link .tmux.conf ~/.tmux.conf
~/.tmux/plugins/tpm/bin/install_plugins
