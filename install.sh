#!/usr/bin/env bash

source ./common.sh


./install.arch.sh


echo "Installing required packages..."
install < packages/main.txt


if [[ $(hostnamectl chassis) =~ "laptop" ]]; then
    echo "Laptop detected"
    ./install.laptop.sh
fi


if prompt "Copy default background"; then
    cp configs/background ~/.config/background
fi


echo "Creating symlinks for dotfiles..."
link kitty ~/.config/kitty
link fcitx5 ~/.config/fcitx5
link cava ~/.config/cava
link .icons ~/.icons

dconf write /com/github/stunkymonkey/nautilus-open-any-terminal/terminal "'custom'"
dconf write /com/github/stunkymonkey/nautilus-open-any-terminal/custom-local-command "'xdg-terminal-exec'"
dconf write /com/github/stunkymonkey/nautilus-open-any-terminal/custom-remote-command "'xdg-terminal-exec %s'"


if prompt "Install toy packages"; then
    echo "Installing toy packages..."
    install < packages/toys.txt
fi


if prompt "Install dev packages"; then
    ./install.dev.sh
fi


if prompt "Install games"; then
    ./install.games.sh
fi


if prompt "Install GNOME packages"; then
    ./install.gnome.sh
fi


if prompt "Install Hyprland packages"; then
    ./install.hyprland.sh
fi


if prompt "Install Waydroid"; then
    ./install.waydroid.sh
fi


if prompt "Install Aseprite"; then
    echo "Installing Aseprite..."
    install aseprite
    link aseprite ~/.config/aseprite
fi


if prompt "Config sddm autologin"; then
    echo -e "[Autologin]\nUser=$USER" | sudo tee /etc/sddm.conf
fi


if prompt "Update firmware"; then
    install fwupd

    sudo cp -f configs/fwupd.conf /etc/fwupd/fwupd.conf

    if [ -f /etc/kernel/secure-boot-private-key.pem ] && [ ! -f /usr/lib/fwupd/efi/fwupdx64.efi.signed ]; then
        sudo /usr/lib/systemd/systemd-sbsign sign \
            --private-key /etc/kernel/secure-boot-private-key.pem \
            --certificate /etc/kernel/secure-boot-certificate.pem \
            --output /usr/lib/fwupd/efi/fwupdx64.efi.signed \
            /usr/lib/fwupd/efi/fwupdx64.efi
    fi

    fwupdmgr refresh
    fwupdmgr update
fi


echo "Cleaning up..."
yay -Ycc --noconfirm
yay -Scc --noconfirm


if prompt "Reboot now"; then
    reboot
fi
