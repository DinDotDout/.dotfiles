sudo pacman --needed --noconfirm -S polybar i3-gaps picom flameshot arandr xorg-xrandr xclip
sudo paru --needed --noconfirm -S i3lock-color
stow -R i3-conf
echo "Addin permissions to lock screen script"
chmod +x $HOME/.local/bin/lock
