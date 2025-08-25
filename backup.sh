#!/usr/bin/env sh

echo "Backing up settings..."
dconf dump /org/gnome/shell/ > dconf/shell.dconf
dconf dump /org/gnome/mutter/ > dconf/mutter.dconf

echo "Backing up keybinds..."
dconf dump /org/gnome/desktop/wm/keybindings/ > dconf/desktop/wm/keybindings.dconf
dconf dump /org/gnome/settings-daemon/plugins/media-keys/ > dconf/settings-daemon/plugins/media-keys.dconf

echo "Backing up themes..."
dconf dump /org/gnome/desktop/interface/ > dconf/desktop/interface.dconf
dconf dump /org/gnome/desktop/wm/preferences/ > dconf/desktop/wm/preferences.dconf

echo "Backing up GNOME extensions..."
gext | awk -F'[()]' '{print $2}' > packages/gnome.extensions.txt
