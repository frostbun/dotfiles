#!/usr/bin/env sh

dotfiles=$(pwd)

alias install="yay -S --needed --noconfirm"

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


if ! pkg_installed yay; then
    echo "Installing yay..."
    sudo pacman -S --needed --noconfirm git base-devel go
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si
    cd ..
    rm -rf yay
fi


if ! pkg_installed reflector; then
    echo "Installing reflector..."
    install reflector
    sudo systemctl enable --now reflector.timer
    sudo systemctl start reflector.service
fi


yay -Syu --noconfirm


if ! pkg_installed cloudflare-warp-bin; then
    echo "Installing Cloudflare Warp..."
    install cloudflare-warp-bin
    sudo systemctl enable --now warp-svc
    warp-cli registration new
fi


if [[ $(hostnamectl chassis) =~ "laptop" ]]; then
    if ! pkg_installed tlp; then
        echo "Laptop detected, installing tlp..."
        install tlp
        sudo systemctl enable --now tlp.service
    fi
fi


if [ -f /boot/loader/loader.conf ]; then
    echo "Configuring systemd-boot..."
    echo "timeout 0" | sudo tee /boot/loader/loader.conf

    read -p "Install secure boot? [y/N]: " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        echo "Installing secure boot..."
        install systemd-ukify
        sudo cp -f configs/uki.conf /etc/kernel/uki.conf
        sudo ukify genkey --config /etc/kernel/uki.conf
        sudo /usr/lib/systemd/systemd-sbsign sign \
            --private-key /etc/kernel/secure-boot-private-key.pem \
            --certificate /etc/kernel/secure-boot-certificate.pem \
            --output /usr/lib/systemd/boot/efi/systemd-bootx64.efi.signed \
            /usr/lib/systemd/boot/efi/systemd-bootx64.efi
        sudo bootctl install --secure-boot-auto-enroll yes \
            --certificate /etc/kernel/secure-boot-certificate.pem \
            --private-key /etc/kernel/secure-boot-private-key.pem
        echo "secure-boot-enroll force" | sudo tee -a /boot/loader/loader.conf
        sudo mkinitcpio -P
    fi
fi


if [ -f /etc/systemd/zram-generator.conf ]; then
    echo "Configuring zram-generator..."
    sudo cp -f configs/zram-generator.conf /etc/systemd/zram-generator.conf
fi


if [ -f /etc/systemd/logind.conf ]; then
    echo "Configuring logind..."
    sudo cp -f configs/logind.conf /etc/systemd/logind.conf
fi


echo "Installing required packages..."
install - < packages/required.txt


echo "Installing Oh My Zsh..."
install zsh
if [ ! -d ~/.oh-my-zsh ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi
link .zshrc ~/.zshrc


echo "Installing powerlevel10k..."
if [ ! -d ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k ]; then
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
fi
link .p10k.zsh ~/.p10k.zsh


echo "Installing Vundle..."
link .vimrc ~/.vimrc
if [ ! -d ~/.vim/bundle/Vundle.vim ]; then
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi
vim +PluginInstall +qall
read -p "Install youcompleteme? [y/N]: " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    ~/.vim/bundle/youcompleteme/install.py
fi


echo "Creating symlinks for dotfiles..."
link .gitconfig ~/.gitconfig
link fcitx5 ~/.config/fcitx5
link kitty ~/.config/kitty
link ranger ~/.config/ranger
link btop ~/.config/btop
link cava ~/.config/cava


read -p "Install dev packages? [y/N]: " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then

    echo "Installing dev packages..."
    install - < packages/dev.txt

    [ -f /opt/miniconda3/etc/profile.d/conda.sh ] && source /opt/miniconda3/etc/profile.d/conda.sh
    [ -f /usr/share/nvm/init-nvm.sh ] && source /usr/share/nvm/init-nvm.sh

    nvm install --lts

    sudo systemctl enable --now sshd
    sudo systemctl enable --now docker

    mkdir -p ~/.local/share/unity3d

    read -p "Install youcompleteme? [y/N]: " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        ~/.vim/bundle/youcompleteme/install.py --all
    fi
fi


read -p "Install GNOME packages? [y/N]: " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then

    echo "Removing GNOME bloatwares..."
    yay -Rcns --noconfirm $(comm -12 <(pacman -Qq | sort) <(sort packages/gnome.bloatwares.txt))

    echo "Installing themes..."
    link .themes ~/.themes
    link .icons ~/.icons

    echo "Copying settings..."
    dconf load /org/gnome/shell/ < dconf/shell.dconf
    dconf load /org/gnome/mutter/ < dconf/mutter.dconf
    dconf load /org/gnome/desktop/ < dconf/desktop.dconf
    dconf load /org/gnome/settings-daemon/plugins/ < dconf/settings-daemon/plugins.dconf

    echo "Installing GNOME extensions..."
    install extension-manager gnome-extensions-cli
    gext install $(cat packages/gnome.extensions.txt)
    link burn-my-windows ~/.config/burn-my-windows

    echo "Installing 'Open Kitty here' extension..."
    install nautilus-open-any-terminal
    dconf write /com/github/stunkymonkey/nautilus-open-any-terminal/terminal "'kitty'"
fi


echo "Cleaning up..."
yay -Rcns --noconfirm $(yay -Qdtq)
yay -Scc --noconfirm


read -p "Reboot now? [y/N]: " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    reboot
fi
