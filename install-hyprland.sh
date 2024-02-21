#!/bin/bash
#(C) 2023 Joan Dot Saster, GPL v2.0 or later. No warranty.
pacman_packages=(
	hyprland wl-clipboard xdg-desktop-portal-hyprland
	waybar grim slurp cliphist
)

sudo pacman --noconfirm --needed -S "${pacman_packages[@]}"
pywalfox install

paru_packages=(swww swaylock pyprland hyprpicker-git wlogout wlr-randr sway-audio-idle-inhibit-git)
paru --noconfirm --needed -S "${paru_packages[@]}"
# paru --noconfirm --needed -S swww swaylock-effects pyprland hyprpicker wlogout wlr-randr

stow -R conf-hyprland

confirm() {
	read -r -p "${1:-(yY/nN)} " response
	case "$response" in
	[yY][eE][sS] | [yY] | "")
		true
		;;
	*)
		false
		;;
	esac
}

isnvidia=$(lspci -k | grep -A 2 -E "nvidia")
if [ -z "$isnvidia" ]; then
	exit
fi

msg="Do you want the command to be coppied to your vim clipboard?"
# add hyprand needed modifications
# open files to edit manually with instructions
echo "Add nvidia_drm.modeset=1 to GRUB_CMDLINE_LINUX_DEFAULT= in /etc/default/grub"
(confirm "$msg" && sudo vim -c "let @\"='GRUB_CMDLINE_LINUX_DEFAULT=\"nvidia_drm.modeset=1\"'" /etc/default/grub) || sudo vim /etc/default/grub
sudo grub-mkconfig -o /boot/grub/grub.cfg

echo "In /etc/mkinitcpio.conf add nvidia nvidia_modeset nvidia_uvm nvidia_drm to your MODULES"
(confirm "$msg" && sudo vim -c "let @\"='nvidia nvidia_modeset nvidia_uvm nvidia_drm'" /etc/mkinitcpio.conf) || sudo vim /etc/mkinitcpio.conf
sudo mkinitcpio --config /etc/mkinitcpio.conf --generate /boot/initramfs-custom.img

echo "Add a new line to /etc/modprobe.d/nvidia.conf (make it if it does not exist) and add the line options nvidia-drm modeset=1"
(confirm "$msg" && sudo vim -c "let @\"='options nvidia-drm modeset=1'" /etc/modprobe.d/nvidia.conf) || sudo vim /etc/modprobe.d/nvidia.conf
echo "Done!"
echo "You can reboot to see the changes"
