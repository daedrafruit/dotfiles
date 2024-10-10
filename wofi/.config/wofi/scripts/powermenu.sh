#!/bin/sh

wofi_running=$(pgrep wofi)
if [ -z "$wofi_running" ]; then

	# use zero-width spaces to manipulate alphabetical sorting
	Z=$'\u200B'
	options=$( echo -e "${Z}${Z}${Z}${Z}${Z}${Z}  Tasks\n${Z}${Z}${Z}${Z}${Z}󰋊  Hibernate\n${Z}${Z}${Z}${Z}  Sleep\n${Z}${Z}${Z}  Restart\n${Z}${Z}  Logout\n${Z}  Poweroff")

	op=$(echo -e "$options" | wofi -i --dmenu --sort-order alphabetical --width 300 --height 275)

	op=$(echo "$op" | awk '{print tolower($2)}')

	case $op in
		"tasks")
			kitty -e btop
			;;
		"hibernate")
			systemctl hibernate
			;;
		"poweroff")
			systemctl poweroff
			;;
		"restart")
			systemctl reboot
			;;
		"sleep")
			systemctl suspend
			;;
		"logout")
			hyprctl dispatch exit
			;;
	esac

else
    killall wofi
fi
#  Lock\n
  #"lock")
  #  swaylock -f -c 000000
  #  ;;
