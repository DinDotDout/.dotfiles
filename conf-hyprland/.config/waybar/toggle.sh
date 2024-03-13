#!/bin/sh
if pgrep -x "waybar" >/dev/null; then
	killall waybar
	hyprctl keyword general:gaps_in 0
	hyprctl keyword general:gaps_out 0
else
	waybar &
	hyprctl reload
fi
