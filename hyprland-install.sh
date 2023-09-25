pacmanPckgs=(
    "hyprland"
    "wl-clipboard"
    "xdg-desktop-portal-hyprland" 
    "waybar" 
    "grim" 
    "slurp"
    "hyprpicker"
    "wofi"
);

paruPckgs=(
    "swww" 
    "swaylock-effects" 
    "wlogout"
    "pyprland"
);

pacman --noconfirm --needed -S pacmanPckgs
paru --noconfirm --needed -S paruPckgs

stow hyprland-conf

# add hyprand needed modifications
# open files to edit manually with instructions
echo "In /etc/default/grub add nvidia_drm.modeset=1 to GRUB_CMDLINE_LINUX_DEFAULT="
read -p "Open file on press" c
sudo nvim /etc/default/grub
grub-mkconfig -o /boot/grub/grub.cfg

echo "In /etc/mkinitcpio.conf add nvidia nvidia_modeset nvidia_uvm nvidia_drm to your MODULES"
read -p "Open file on press" c
sudo nvim /etc/default/grub
mkinitcpio --config /etc/mkinitcpio.conf --generate /boot/initramfs-custom.img

echo "add a new line to /etc/modprobe.d/nvidia.conf (make it if it does not exist) and add the line options nvidia-drm modeset=1"
read -p "Open file on press" c
sudo nvim /etc/modprobe.d/nvidia.conf
echo "Done!"
echo "You can reboot to see the changes"
