#!/usr/bin/env sh

source ./common.sh


echo "Configuring pacman & makepkg..."
sudo cp -f configs/pacman.conf /etc/pacman.conf
sudo cp -f configs/makepkg.conf /etc/makepkg.conf


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
install < packages/required.vm.txt


echo "Enabling required services..."
sudo systemctl enable --now sshd.service
sudo systemctl enable --now docker.service

sudo usermod -aG docker $USER


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


echo "Creating symlinks for dotfiles..."
link .bin ~/.bin
link .gitconfig ~/.gitconfig
link lazygit ~/.config/lazygit
link bat ~/.config/bat
link btop ~/.config/btop
link fastfetch ~/.config/fastfetch
link ranger ~/.config/ranger
link opencode ~/.config/opencode


echo "Cleaning up..."
yay -Rcns --noconfirm $(yay -Qdtq)
yay -Scc --noconfirm


if prompt "Reboot now"; then
    reboot
fi
