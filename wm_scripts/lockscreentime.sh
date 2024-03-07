#!/bin/sh
timeswaylock=180
timeoff=300

if [ -f "/usr/bin/swayidle" ]; then
	swayidle -w timeout $timeswaylock "$HOME/.dotfiles/wm_scripts/swaylock.sh" timeout $timeoff 'hyprctl dispatch dpms off'
	# resume 'hyprctl dispatch dpms on'
else
	echo "Swayidle not installed."
fi
