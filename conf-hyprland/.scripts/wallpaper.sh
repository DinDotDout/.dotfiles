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

	# selected=$(find -L ~/wallpaper -type f | grep -E "\.jpg$|\.jpeg$|\.png$" | rofi -dmenu -replace -config ~/.config/rofi/config-wallpaper.rasi -p "Wallpapers")
	selected=$(find -L "$HOME/wallpaper" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" \) -exec basename {} \; | while read rfile; do
		echo -en "$rfile\x00icon\x1f$HOME/wallpaper/${rfile}\n"
	done | rofi -dmenu -replace -config ~/.config/rofi/config-wallpaper.rasi)

	echo $selected
	if [ ! "$selected" ]; then
		echo "No wallpaper selected"
		exit
	fi
	wal $wal_flags ~/wallpaper/"$selected"
	;;

# Randomly select wallpaper
*)
	wal --recursive $wal_flags ~/wallpaper/
	;;

esac

echo "Changing theme..."
# Find the process ID (PID) of the kitty instance you want to reload
PIDS=$(pgrep kitty)

# Send the SIGUSR1 signal (reload config) to all kitty processes
for PID in $PIDS; do
	kill -SIGUSR1 $PID
done

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
pkill dunst
dunst -conf ~/.cache/wal/colors-dunstrc &
# -----------------------------------------------------
# Set the new wallpaper
# -----------------------------------------------------
transition_type="wipe"
swww img "$wallpaper" \
	--transition-bezier 0.4,1.10,0.9,0.5 \
	--transition-type=$transition_type \
	--transition-duration=1.0 \
	--transition-fps=60

pywalfox update
walogram

# -----------------------------------------------------
# Send notification
# -----------------------------------------------------
notify-send "Colors and Wallpaper updated" "with image $newwall"
echo "Done."
