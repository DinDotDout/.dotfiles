#!/bin/sh
timeswaylock=600
timeoff=660

if [ -f "/usr/bin/swayidle" ]; then
	sway-audio-idle-inhibit &
	swayidle -w timeout $timeswaylock "$HOME/.scripts/swaylock.sh" timeout $timeoff 'hyprctl dispatch dpms off'
	# resume 'hyprctl dispatch dpms on'
else
	echo "Swayidle not installed."
fi
