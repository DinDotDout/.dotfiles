#!/bin/bash
wal_flags="--backend colorz -q -i"
case $1 in
# Load wallpaper from .cache of last session
"init")
	if [ -f ~/.cache/current_wallpaper.jpg ]; then
		wal $wal_flags~/.cache/current_wallpaper.jpg
	else
		wal $wal_flags ~/wallpaper/
	fi
	;;

# Select wallpaper with rofi
"select")
	selected=$(find -L ~/wallpaper -type f | grep -E "\.jpg$|\.jpeg$|\.png$" | rofi -dmenu -config ~/.config/rofi/config-wallpaper.rasi -p "Wallpapers")
	if [ ! "$selected" ]; then
		echo "No wallpaper selected"
		exit
	fi
	wal $wal_flags "$selected"
	;;

# Randomly select wallpaper
*)
	wal $wal_flags ~/wallpaper/
	;;

esac

echo "Changing theme..."
# -----------------------------------------------------
# Get new theme
# -----------------------------------------------------
source "$HOME/.cache/wal/colors.sh"
# -----------------------------------------------------
# Copy selected wallpaper into .cache folder
# -----------------------------------------------------
cp "$wallpaper" ~/.cache/current_wallpaper.jpg

newwall=$(echo $wallpaper | sed "s|$HOME/wallpaper/||g")

~/.config/waybar/launch.sh

# -----------------------------------------------------
# Set the new wallpaper
# -----------------------------------------------------
transition_type="wipe"
swww img "$wallpaper" \
	--transition-bezier .43,1.19,1,.4 \
	--transition-type=$transition_type \
	--transition-duration=0.7 \
	--transition-pos "$(hyprctl cursorpos)" \
	--transition-fps=60

pywalfox update
walogram

sleep 1

# -----------------------------------------------------
# Send notification
# -----------------------------------------------------
notify-send "Colors and Wallpaper updated" "with image $newwall"
echo "Done."
