#!/bin/bash

# Check if redshift is running
if pgrep -x "redshift" >/dev/null; then
	# Kill it if it is
	pkill -x "redshift"
else
	# Launch it if it's not
	redshift -O 5000k
fi
