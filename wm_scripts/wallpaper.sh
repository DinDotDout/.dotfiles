#!/bin/bash
WAL_FLAGS="--backend colorz -qt -i"

function load_wallpaper {
	if [ -f ~/.cache/current_wallpaper.jpg ]; then
		wal $WAL_FLAGS~/.cache/current_wallpaper.jpg
	else
		wal $WAL_FLAGS ~/wallpaper/
	fi
}

function select_wallpaper {
	selected=$(find -L "$HOME/wallpaper" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" \) -exec basename {} \; | while read rfile; do
		echo -en "$rfile\x00icon\x1f$HOME/wallpaper/${rfile}\n"
	done | rofi -dmenu -replace -config ~/.config/rofi/config-wallpaper.rasi)

	echo $selected
	if [ ! "$selected" ]; then
		echo "No wallpaper selected"
		exit
	fi
	wal $WAL_FLAGS ~/wallpaper/"$selected"
}

function random_wallpaper {
	wal --recursive $WAL_FLAGS ~/wallpaper/
}

function set_new_wallpaper {
	source "$HOME/.cache/wal/colors.sh" # Import colors and wallpaper
	cp "$wallpaper" ~/.cache/current_wallpaper.jpg
	transition_type="wipe"
	swww img "$wallpaper" \
		--transition-bezier 0.4,1.10,0.9,0.5 \
		--transition-type=$transition_type \
		--transition-duration=1.0 \
		--transition-fps=60
}

# Update telegram and firefox themes
function update_themes {
	~/.config/waybar/launch.sh # waybar theme

	# kitty theme
	# PIDS=$(pgrep kitty)
	# for PID in $PIDS; do
	# 	kill -SIGUSR1 $PID
	# done

	pywalfox update # firefox theme
	walogram        # telegram theme

	# dunst theme
	pkill dunst
	dunst -conf ~/.cache/wal/colors-dunstrc &
}

function send_notification {
	newwall=$(echo $wallpaper | sed "s|$HOME/wallpaper/||g")
	notify-send "Colors and Wallpaper updated" "with image $newwall"
	echo "Done."
}

case $1 in
"init")
	load_wallpaper
	;;
"select")
	select_wallpaper
	;;
*)
	random_wallpaper
	;;
esac

echo "Changing theme..."
set_new_wallpaper
update_themes
send_notification
