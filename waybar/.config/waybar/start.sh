#!/bin/sh
wofi_running=$(pgrep wofi)
if [ -z "$wofi_running" ]; then
	wofi -I --show drun
elif [ -n "$wofi_running" ]; then
	killall wofi
fi
