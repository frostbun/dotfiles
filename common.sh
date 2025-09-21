export dotfiles=$(pwd)

alias install="yay -S --needed --noconfirm"

prompt() {
    read -p "$1? [y/N]: " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        return 0
    else
        return 1
    fi
}

pkg_installed() {
    if pacman -Q $1 &>/dev/null; then
        return 0
    else
        return 1
    fi
}

link() {
    rm -rf $2
    ln -s $dotfiles/configs/$1 $2
}
