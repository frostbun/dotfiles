#!/usr/bin/env sh

echo "Backing up settings..."
dconf dump /org/gnome/shell/ > dconf/shell.dconf
dconf dump /org/gnome/mutter/ > dconf/mutter.dconf
dconf dump /org/gnome/desktop/ > dconf/desktop.dconf
dconf dump /org/gnome/settings-daemon/plugins/media-keys/ > dconf/settings-daemon/plugins/media-keys.dconf

echo "Backing up GNOME extensions..."
gext | awk -F'[()]' '{print $2}' > packages/gnome.extensions.txt
