#!/bin/bash
while [[ "$#" -gt 0 ]]; do
	case $1 in
	--wallpaper)
		selected="$2"
		shift
		;;
	*)
		echo "Unknown parameter passed: $1"
		exit 1
		;;
	esac
	shift
done

# If no --wallpaper flag, use the current method to select wallpaper
if [ -z "$selected" ]; then
	selected=$(find -L ~/wallpaper -type f | grep -E "\.jpg$|\.jpeg$|\.png$" | rofi -dmenu -config ~/.config/rofi/config-wallpaper.rasi -p "Wallpapers")
fi

if [ "$selected" ]; then

	echo "Changing theme..."
	# -----------------------------------------------------
	# Update wallpaper with pywal
	# -----------------------------------------------------
	# wal -q -i $selected
	wal --backend colorz -q -i $selected

	# -----------------------------------------------------
	# Get new theme
	# -----------------------------------------------------
	source "$HOME/.cache/wal/colors.sh"

	# -----------------------------------------------------
	# Copy selected wallpaper into .cache folder
	# -----------------------------------------------------
	cp $wallpaper ~/.cache/current_wallpaper.jpg

	newwall=$(echo $wallpaper | sed "s|$HOME/wallpaper/||g")

	# -----------------------------------------------------
	# Set the new wallpaper
	# -----------------------------------------------------
	swww img $wallpaper \
		--transition-bezier .43,1.19,1,.4 \
		--transition-fps=60 \
		--transition-type="random" \
		--transition-duration=0.7 \
		--transition-pos "$(hyprctl cursorpos)"

	pywalfox update
	walogram

	~/.config/waybar/launch.sh
	sleep 1

	# -----------------------------------------------------
	# Send notification
	# -----------------------------------------------------
	notify-send "Colors and Wallpaper updated" "with image $newwall"

	echo "Done."
fi
