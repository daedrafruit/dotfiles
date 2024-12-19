#!/bin/sh
wofi_running=$(pgrep wofi)
if [ -z "$wofi_running" ]; then
		WOFI_LOG_LEVEL=debug wofi -I --show=drun > ~/wofi_debug.log 2>&1
else
    killall wofi
fi
