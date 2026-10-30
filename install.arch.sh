#!/usr/bin/env bash

source ./common.sh


echo "Configuring pacman & makepkg..."
sudo cp -f configs/pacman.conf /etc/pacman.conf
sudo cp -f configs/makepkg.conf /etc/makepkg.conf


if prompt "Enable multilib"; then
    sudo sed -i "/^#\[multilib\]/,/Include/"'s/^#//' /etc/pacman.conf
fi


if ! pkg_installed yay; then
    echo "Installing yay..."
    sudo pacman -S --needed --noconfirm base-devel
    git clone --depth 1 https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si
    cd ..
    rm -rf yay
    link yay ~/.config/yay
fi


if ! pkg_installed reflector; then
    echo "Installing reflector..."
    install reflector
    sudo cp -f configs/reflector.conf /etc/xdg/reflector/reflector.conf
    sudo systemctl enable --now reflector.timer
    sudo systemctl start reflector.service
fi


echo "Updating system..."
yay --noconfirm


if [ -f /boot/loader/loader.conf ]; then
    echo "Configuring systemd-boot..."

    sudo cp -f configs/loader.conf /boot/loader/loader.conf
    sudo cp -f configs/mkinitcpio.conf /etc/mkinitcpio.conf
    sudo cp -f configs/linux.preset /etc/mkinitcpio.d/linux.preset

    sudo rm -f /boot/EFI/Linux/arch-linux-fallback.efi

    for arg in "quiet" "loglevel=3"; do
        grep -qw "$arg" /etc/kernel/cmdline || sudo sed -i "s/\$/ $arg/" /etc/kernel/cmdline
    done

    sudo mkinitcpio -p linux
fi


echo "Installing required packages..."
install < packages/arch.txt

bun install -g @oh-my-pi/pi-coding-agent


echo "Enabling required services..."
sudo systemctl enable --now sshd.service


if prompt "Install Zsh"; then
    ./install.zsh.sh
fi


if prompt "Install LazyVim"; then
    git clone https://github.com/LazyVim/starter ~/.config/nvim
    sudo git clone https://github.com/LazyVim/starter /root/.config/nvim
fi


echo "Creating symlinks for dotfiles..."
link .gitconfig ~/.gitconfig
link fastfetch ~/.config/fastfetch

sudo cp -f configs/zram-generator.conf /etc/systemd/zram-generator.conf
sudo cp -f configs/logind.conf /etc/systemd/logind.conf
