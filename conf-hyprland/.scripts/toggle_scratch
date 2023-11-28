#!/bin/bash

if [ -z "$1" ] || [ -z "$2" ]; then
	echo "No parameter provided."
	exit 1
fi
app="$1"
scratch_name="$2"

if ! pgrep -fx "$app" >/dev/null; then
	hyprctl dispatch exec pypr toggle "$scratch_name"
	echo "create"
	exit 0
fi

# If no telegram spawn
if ! hyprctl clients | grep -q "$scratch_name"; then
	hyprctl dispatch exec "$app"
	echo "send"
else
	hyprctl dispatch exec pypr toggle "$scratch_name"
	echo "toggle"
fi
