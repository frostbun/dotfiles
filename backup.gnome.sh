#!/usr/bin/env sh

echo "Backing up settings..."
dconf dump /org/gnome/shell/ > dconf/shell.dconf
dconf dump /org/gnome/mutter/ > dconf/mutter.dconf
dconf dump /org/gnome/desktop/ > dconf/desktop.dconf
dconf dump /org/gnome/settings-daemon/ > dconf/settings-daemon.dconf


echo "Backing up GNOME extensions..."
gext ls -a | awk -F'[()]' '{print $2}' | sort > packages/gnome.extensions.txt
