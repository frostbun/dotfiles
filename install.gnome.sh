#!/usr/bin/env sh

source ./common.sh

echo "Removing GNOME bloatwares..."
yay -Rcns --noconfirm $(comm -12 <(pacman -Qq | sort) <(sort packages/gnome.bloatwares.txt))

echo "Installing GNOME extensions..."
install extension-manager gnome-extensions-cli
sudo rm -f /usr/share/applications/org.gnome.Extensions.desktop
gext install $(cat packages/gnome.extensions.txt)
link burn-my-windows ~/.config/burn-my-windows

echo "Installing 'Open Kitty here' extension..."
install nautilus-open-any-terminal
dconf write /com/github/stunkymonkey/nautilus-open-any-terminal/terminal "'kitty'"

if prompt "Reset settings"; then
    dconf reset -f /org/gnome/shell/
    dconf reset -f /org/gnome/mutter/
    dconf reset -f /org/gnome/desktop/
    dconf reset -f /org/gnome/settings-daemon/plugins/
fi

echo "Copying settings..."
dconf load /org/gnome/shell/ < dconf/shell.dconf
dconf load /org/gnome/mutter/ < dconf/mutter.dconf
dconf load /org/gnome/desktop/ < dconf/desktop.dconf
dconf load /org/gnome/settings-daemon/plugins/ < dconf/settings-daemon/plugins.dconf
