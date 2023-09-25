pacman --needed --noconfrim -S polybar i3-wm i3-status picom flameshot arandr xorg-xrandr xclip
paru --needed --noconfrim i3lock-color
stow i3-conf
echo "Addin permissions to lock screen script"
chmod +x $HOME/.config/i3lock/lock
