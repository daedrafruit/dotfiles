#!/bin/sh
wofi_running=$(pgrep wofi)
if [ -z "$wofi_running" ]; then
    wofi -I --show drun
else
    killall wofi
fi
