#!/bin/bash
id=1

# Check if redshift is running
if pgrep -x "redshift" >/dev/null; then
	pkill -x "redshift"
	notify-send -r "$id" "Redshift   "
else
	redshift -O 5000k &
	notify-send -r "$id" "Redshift   "
fi
