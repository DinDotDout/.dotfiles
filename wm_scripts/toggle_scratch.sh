#!/bin/bash
if [ -z "$1" ] || [ -z "$2" ]; then
	echo "No parameter provided."
	exit 1
fi

app="$1"
scratch_name="$2"

# If not running, toggle the scratch_name
if ! pgrep -fx "$app" >/dev/null; then
	hyprctl dispatch exec pypr toggle "$scratch_name"
	echo "create"
	exit 0
fi

# If the application is not running, start it
if ! hyprctl clients | grep -q "$scratch_name"; then
    killall -9 "$app"
	# hyprctl dispatch exec "$app"
	# echo "send"
else # If the application is running, toggle the scratch_name
	hyprctl dispatch exec pypr toggle "$scratch_name"
	echo "toggle"
fi
