#!/bin/bash
id=1

# Check if redshift is running
if pgrep -x "redshift" >/dev/null; then
	# Kill it if it is
	pkill -x "redshift"
	# Replace the notification with the defined ID
	notify-send -r "$id" "Redshift   "
else
	# Launch it if it's not
	redshift -O 5000k &
	# Replace the notification with the same ID
	notify-send -r "$id" "Redshift   "
fi
