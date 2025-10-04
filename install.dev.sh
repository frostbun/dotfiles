#!/usr/bin/env sh

source ./common.sh


echo "Installing dev packages..."
install - < packages/dev.txt


[ -f /opt/miniconda3/etc/profile.d/conda.sh ] && source /opt/miniconda3/etc/profile.d/conda.sh
[ -f /usr/share/nvm/init-nvm.sh ] && source /usr/share/nvm/init-nvm.sh


nvm install --lts


sudo systemctl enable --now sshd.service
sudo systemctl enable --now docker.service


mkdir -p ~/.local/share/unity3d


if prompt "Install youcompleteme"; then
    ~/.vim/bundle/youcompleteme/install.py --all
fi
