#!/usr/bin/env sh

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
    git clone https://aur.archlinux.org/yay.git
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


if ! pkg_installed cloudflare-warp-bin; then
    echo "Installing Cloudflare Warp..."
    install cloudflare-warp-bin
    sudo systemctl enable --now warp-svc.service
    sleep 5
    yes | warp-cli registration new
fi


echo "Updating system..."
yay --noconfirm


if [ -f /boot/loader/loader.conf ]; then
    echo "Configuring systemd-boot..."

    echo "timeout 0" | sudo tee /boot/loader/loader.conf
    sudo cp -f configs/mkinitcpio.conf /etc/mkinitcpio.conf
    sudo cp -f configs/linux.preset /etc/mkinitcpio.d/linux.preset

    sudo rm -f /boot/EFI/Linux/arch-linux-fallback.efi

    for arg in "quiet" "loglevel=3"; do
        grep -qw "$arg" /etc/kernel/cmdline || sudo sed -i "s/\$/ $arg/" /etc/kernel/cmdline
    done

    if [ ! -f /etc/kernel/secure-boot-private-key.pem ] && prompt "Install secure boot"; then

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
    fi

    sudo mkinitcpio -p linux
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
install < packages/required.txt


if [[ $(hostnamectl chassis) =~ "laptop" ]]; then
    echo "Laptop detected"
    ./install.laptop.sh
fi


echo "Enabling required services..."
sudo systemctl enable --now sshd.service


if [ ! -d ~/.oh-my-zsh ]; then
    echo "Installing Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    link .zshrc ~/.zshrc
fi


if [ ! -d ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k ]; then
    echo "Installing powerlevel10k..."
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
    link .p10k.zsh ~/.p10k.zsh
fi


if [ ! -d ~/.vim/bundle/Vundle.vim ]; then
    echo "Installing Vundle..."
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    link .vimrc ~/.vimrc
    vim +PluginInstall +qall
    ~/.vim/bundle/youcompleteme/install.py
fi


if [ ! -d ~/.tmux/plugins/tpm ]; then
    echo "Installing TPM..."
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    link .tmux.conf ~/.tmux.conf
fi


if prompt "Install Vundle for superuser"; then
    sudo rm -rf /root/.vim
    sudo rm -f /root/.vimrc
    sudo cp -r ~/.vim /root/.vim
    sudo cp ~/.vimrc /root/.vimrc
fi


if prompt "Copy default background"; then
    cp configs/background ~/.config/background
fi


echo "Creating symlinks for dotfiles..."
link systemd ~/.config/systemd
link .bin ~/.bin
link .gitconfig ~/.gitconfig
link .icons ~/.icons
link lazygit ~/.config/lazygit
link bat ~/.config/bat
link btop ~/.config/btop
link cava ~/.config/cava
link fastfetch ~/.config/fastfetch
link fcitx5 ~/.config/fcitx5
link ranger ~/.config/ranger
link kitty ~/.config/kitty
link alacritty ~/.config/alacritty

dconf write /com/github/stunkymonkey/nautilus-open-any-terminal/terminal "'custom'"
dconf write /com/github/stunkymonkey/nautilus-open-any-terminal/custom-local-command "'xdg-terminal-exec'"

echo "Configuring Discord to skip host update..."
if [ -f ~/.config/discord/settings.json ]; then
    jq 'if has("SKIP_HOST_UPDATE") then . else . + {"SKIP_HOST_UPDATE": true} end' ~/.config/discord/settings.json > settings.json
    mv settings.json ~/.config/discord/settings.json
else
    mkdir -p ~/.config/discord
    echo '{"SKIP_HOST_UPDATE": true}' > ~/.config/discord/settings.json
fi


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
    echo "[Autologin]\nUser=$USER" | sudo tee /etc/sddm.conf
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
yay -Rcns --noconfirm $(yay -Qdtq)
yay -Scc --noconfirm


if prompt "Reboot now"; then
    reboot
fi
