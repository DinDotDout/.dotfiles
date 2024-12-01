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

add_tty_login() {
	sudo cp resources/login_issue /etc/issue
}

install_pacman_pcks() {
    # TODO: Separate into devtools, win manager stuff, gaming, etc
	pacman_pcks=(python-pywal dunst otf-font-awesome ttf-roboto-mono-nerd ttf-hack-nerd noto-fonts-cjk inotify-tools yazi qt5ct zoxide syncthing 
        papis
        gammastep # redshift wayland
        tree-sitter tree-sitter-cli # neovim
        rofi-wayland # app launcher
        discord
        github-cli
        calc
        obsidian syncthing
        nwg-look # kde tool for cursor/icon setting

        python-pipx
        fd # file finder
    )
    gh config set git_protocol ssh
    mkdir Documents/papers # For papis
	sudo pacman --noconfirm --needed -S "${pacman_pcks[@]}" || {
		echo 'Failed to install pacman packages.'
		exit 1
	}
	echo "DONE!"
}

# Needed to ensure tmux has package manager
add_tmux() {
    echo "Adding tmux"
    sudo pacman --noconfirm --needed -S tmux || {
        echo 'Failed to install tmux.'
        exit 1
    }
    echo "DONE!"
    mkdir -p $HOME/.config/tmux/plugins # Just in case
    git clone https://github.com/tmux-plugins/tpm $HOME/.config/tmux/plugins/tpm
    bash $HOME/.config/tmux/plugins/tpm/scripts/install_plugins.sh
}

install_paru_and_aur_pcks() {
	echo "Installing paru"
	git clone https://aur.archlinux.org/paru-bin.git
	(cd paru-bin && makepkg -sic)
	# Remove paru-bin as it is unneeded
	rm -rf paru-bin
	echo "DONE!"

	echo "Installing Paru pckgs!"
	paru_packages=(neovim-remote stow starship noto-fonts-emoji
		catppuccin-gtk-theme-macchiato catppuccin-cursors-mocha nodejs
		protonup-qt timeshift zram-generator preload pywal rofi-calc
		sddm-sugar-candy-git autofirma-bin vlc flatpak libreoffice-still pokemon-colorscripts-git
		python-pywalfox colorz walogram fzf
        # pywal-16-colors
	)

	paru --noconfirm --needed -S "${paru_packages[@]}" || {
		echo 'Failed to install paru packages.'
		exit 1
	}
    pipx install colorz # Pywal backend for brighter colors
	echo "DONE!"
	pywalfox install

}

configure_timeshift() {
	echo "Configuring timeshift"
	# sudo sed -i 's/"include_btrfs_home_for_backup": "false"/"include_btrfs_home_for_backup": "true"/g' /etc/timeshift/timeshift.json
	# sudo sed -i 's/"schedule_weekly": "false"/"schedule_weekly": "true"/g' /etc/timeshift/timeshift.json
	# sudo sed -i 's/"schedule_monthly": "false"/"schedule_monthly": "true"/g' /etc/timeshift/timeshift.json
	# sudo sed -i 's/"count_monthly": "[0-9]*"/"count_monthly": "6"/g' /etc/timeshift/timeshift.json
	# sudo sed -i 's/"count_weekly": "[0-9]*"/"count_weekly": "4"/g' /etc/timeshift/timeshift.json

    sudo sed -i -e 's/"include_btrfs_home_for_backup": "false"/"include_btrfs_home_for_backup": "true"/g' \
           -e 's/"schedule_weekly": "false"/"schedule_weekly": "true"/g' \
           -e 's/"schedule_monthly": "false"/"schedule_monthly": "true"/g' \
           -e 's/"count_monthly": "[0-9]*"/"count_monthly": "6"/g' \
           -e 's/"count_weekly": "[0-9]*"/"count_weekly": "4"/g' /etc/timeshift/timeshift.json


	# Make grub track and update on timeshift snapshots
	sudo sed -i 's|ExecStart=/usr/bin/grub-btrfsd --syslog /.snapshots|ExecStart=/usr/bin/grub-btrfsd --syslog --timeshift-auto|' /etc/systemd/system/grub-btrfsd.service
	# Start service if not already running
	# sudo systemctl start grub-btrfsd
	# Reload config
	sudo systemctl daemon-reload
	# Restart the service
	sudo systemctl restart grub-btrfsd
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

	# Move zsh config to .config/zsh
	grep -qxF 'export ZDOTDIR="$HOME"/.config/zsh' /etc/zsh/zshenv || echo 'export ZDOTDIR="$HOME"/.config/zsh' | sudo tee -a /etc/zsh/zshenv

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
	echo "Installing hyprland"
	source install-hyprland.sh
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
	welcome_message
	add_tty_login
	install_pacman_pcks
    systemctl --user enable syncthing.service # Enable syncthing
    add_tmux
	install_paru_and_aur_pcks
	configure_timeshift
	configure_flatpak_and_add_repos
	add_zram
	prepare_dotfiles
	change_to_zsh_shell
	# change_display_manager # No diplay manager for now
	add_window_manager
	create_snapshot

	echo "Finished"
	echo "All options will be enabled after rebooting"
}

main
