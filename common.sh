export dotfiles=$(pwd)


install() {
    if [[ ! -t 0 ]]; then
        pkgs=$(cat)
    else
        pkgs=$@
    fi
    echo $pkgs | yay -S --needed --noconfirm -
    yay -D --asexplicit --noconfirm $(comm -12 <(yay -Qdq | sort) <(echo $pkgs | sort))
}


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
