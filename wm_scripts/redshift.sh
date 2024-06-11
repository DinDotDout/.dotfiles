#!/bin/bash
id=1
# Check if gammastep is running
if pgrep -x "gammastep" >/dev/null; then
	pkill -x "gammastep"
	notify-send -r "$id" "Gammastep   "
else
	gammastep -vO 5000k &
	notify-send -r "$id" "Gammastep   "
fi
