#!/bin/bash
#(C) 2023 Joan Dot Saster, GPL v2.0 or later. No warranty.

clear

welcome_message() {
	clear
	echo "  ____        _   ____        _    __ _ _           "
	echo " |  _ \  ___ | |_|  _ \  ___ | |_ / _(_) | ___  ___ "
	echo " | | | |/ _ \| __| | | |/ _ \| __| |_| | |/ _ \/ __|"
	echo " | |_| | (_) | |_| |_| | (_) | |_|  _| | |  __/\__ \\"
	echo ' |____/ \___/ \__|____/ \___/ \__|_| |_|_|\___||___/'
	echo "-----------------------------------------------------"
	echo ""
}

get_user_input() {
	window_manager=""
	while true; do
		read -rp "Do you want to install i3 or hyprland? (hH/iI/Xx(None)): " hin
		case $hin in
		[hH]*)
			echo "Hyprland configuration started."
			window_manager="install-hyprland.sh"
			break
			;;
		[iI]*)
			echo "I3 configuration started."
			window_manager="install-i3.sh"
			break
			;;
		[nN]*)
			break
			;;
		*) echo "Please answer i, h or x." ;;
		esac
	done
}

install_paru_and_aur_pcks() {
	echo "Installing paru"
	git clone https://aur.archlinux.org/paru-bin.git
	(cd paru-bin && makepkg -sic)
	echo "DONE!"

	echo "Installing Paru pckgs!"
	paru_packages=(neovim-remote stow
		catppuccin-gtk-theme-macchiato catppuccin-cursors-mocha
		protonup-qt timeshift zram-generator preload pywal rofi-calc
		sddm-sugar-candy-git autofirma-bin vlc flatpak libreoffice-still
		hyprpicker-git pywal-16-colors python-pywalfox
	) # May need java-8-openjdk
	pywalfox install

	paru --noconfirm --needed -S "${paru_packages[@]}" || {
		echo 'Failed to install paru packages.'
		exit 1
	}
	echo "DONE!"
}

configure_timeshift() {
	echo "Configuring timeshift"
	sudo sed -i 's/"include_btrfs_home_for_backup": "false"/"include_btrfs_home_for_backup": "true"/g' /etc/timeshift/timeshift.json
	sudo sed -i 's/"schedule_weekly": "false"/"schedule_weekly": "true"/g' /etc/timeshift/timeshift.json
	sudo sed -i 's/"schedule_monthly": "false"/"schedule_monthly": "true"/g' /etc/timeshift/timeshift.json
	sudo sed -i 's/"count_monthly": "[0-9]*"/"count_monthly": "6"/g' /etc/timeshift/timeshift.json
	sudo sed -i 's/"count_weekly": "[0-9]*"/"count_weekly": "4"/g' /etc/timeshift/timeshift.json
	echo "DONE!"
}

configure_flatpak_and_add_repos() {
	echo "Adding flatpak repos"
	flatpak remote-add --if-not-exists --user flathub https://flathub.org/repo/flathub.flatpakrepo
	flatpak install --user flathub com.github.tchx84.Flatseal
	flatpak install --user flathub com.microsoft.Edge
	echo "DONE!"
}

add_zram() {
	echo "Adding zram"
	if [ -f "/etc/systemd/zram-generator2.conf" ]; then
		echo "/etc/systemd/zram-generator.conf already exists!"
	else
		sudo touch /etc/systemd/zram-generator.conf
		sudo bash -c 'echo "[zram0]" >> /etc/systemd/zram-generator.conf'
		sudo bash -c 'echo "zram-size = ram / 2" >> /etc/systemd/zram-generator.conf'
		sudo systemctl daemon-reload
		sudo systemctl start /dev/zram0
	fi
	echo "DONE!"
}

prepare_dotfiles() {
	echo "Stowing dotfiles"
	stow -R conf-base
	xdg-user-dirs-update
	echo "DONE!"
}

change_to_zsh_shell() {
	echo "Changing to zsh shell"
	chsh -s /usr/bin/zsh
	zsh <(curl -s https://raw.githubusercontent.com/zap-zsh/zap/master/install.zsh) --branch release-v1 --keep
	echo "DONE!"
}

change_display_manager() {
	echo "Changing to sddm display manager"
	dpmpath='ExecStart=/usr/bin/'
	servicename=$(grep $dpmpath /etc/systemd/system/display-manager.service)
	if [ -n "$service" ]; then
		echo "Disabling current display manager service"
		servicename="${servicename#"$dpmpath"}.service"
		systemctl disable "$servicename"
	fi
	echo "Enabling new display manager service"
	systemctl enable sddm.service
	echo "DONE!"
}

add_window_manager() {
	echo "Adding selected windowmanager"
	if [[ -n $window_manager ]]; then
		# shellcheck disable=SC1090
		source "$window_manager"
	fi
	echo "DONE!"
}

create_snapshot() {
	while true; do
		read -rp "Do you want to create a Timeshift snapshot? (yY/nN) " yn
		case $yn in
		[yY]*)
			snapshot.sh
			break
			;;
		[nN]*)
			break
			;;
		*) echo "Please answer yY or nN." ;;
		esac
	done

}

install_mounter() {
	mkdir ~/.config/ranger/plugins
	git clone https://github.com/SL-RU/ranger_udisk_menu ~/.config/ranger/plugins/ranger_udisk_menu
}

main() {
	get_user_input
	install_paru_and_aur_pcks
	configure_timeshift
	configure_flatpak_and_add_repos
	add_zram
	prepare_dotfiles
	change_to_zsh_shell
	change_display_manager
	add_window_manager
	create_snapshot

	echo "Finished"
	echo "All options will be enabled after rebooting"
}
