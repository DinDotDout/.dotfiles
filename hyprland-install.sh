#!/bin/bash
sudo pacman --noconfirm --needed -S hyprland wl-clipboard xdg-desktop-portal-hyprland waybar grim slurp wofi
paru --noconfirm --needed -S swww swaylock-effects wlogout pyprland hyprpicker

stow -R hyprland-conf

confirm() {
    read -r -p "${1:-Are you sure? [y/N]} " response
    # call with a prompt string or use a default
    # read -r -p "${1:(yY/nN)} " response
    case "$response" in
        [yY][eE][sS]|[yY]) 
            true
            ;;
        *)
            false
            ;;
    esac
}

# add hyprand needed modifications
# open files to edit manually with instructions
echo "In /etc/default/grub add nvidia_drm.modeset=1 to GRUB_CMDLINE_LINUX_DEFAULT="
confirm "Do you want the command to be coppied to your clipboard?" && wl-copy "GRUB_CMDLINE_LINUX_DEFAULT=nvidia_drm.modeset=1"
# echo -p "Do you want the command to be coppied to your clipboard? (yY/Nn)" yn
read -p "Open file on press" c
sudo nvim /etc/default/grub
grub-mkconfig -o /boot/grub/grub.cfg

echo "In /etc/mkinitcpio.conf add nvidia nvidia_modeset nvidia_uvm nvidia_drm to your MODULES"
confirm "Do you want the command to be coppied to your clipboard?" && wl-copy "nvidia nvidia_modeset nvidia_uvm nvidia_drm"
read -p "Open file on press" c
sudo nvim /etc/default/grub
mkinitcpio --config /etc/mkinitcpio.conf --generate /boot/initramfs-custom.img

echo "add a new line to /etc/modprobe.d/nvidia.conf (make it if it does not exist) and add the line options nvidia-drm modeset=1"
confirm "Do you want the command to be coppied to your clipboard?" && wl-copy "options nvidia-drm modeset=1"
read -p "Open file on press" c
sudo nvim /etc/modprobe.d/nvidia.conf
echo "Done!"
echo "You can reboot to see the changes"

