#!/usr/bin/env sh

source ./common.sh


if prompt "Remove GNOME bloatwares"; then
    yay -Rcns --noconfirm $(comm -12 <(yay -Qq | sort) <(sort packages/gnome.bloatwares.txt))
fi


echo "Installing GNOME extensions..."
install extension-manager gnome-extensions-cli
sudo rm -f /usr/share/applications/org.gnome.Extensions.desktop
gext install $(cat packages/gnome.extensions.txt)
link burn-my-windows ~/.config/burn-my-windows


echo "Copying settings..."
dconf write /com/github/stunkymonkey/nautilus-open-any-terminal/terminal "'kitty'"
dconf load /org/gnome/shell/ < dconf/shell.dconf
dconf load /org/gnome/mutter/ < dconf/mutter.dconf
dconf load /org/gnome/desktop/ < dconf/desktop.dconf
dconf load /org/gnome/settings-daemon/ < dconf/settings-daemon.dconf
