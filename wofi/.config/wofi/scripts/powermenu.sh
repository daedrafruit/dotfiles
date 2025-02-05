#!/bin/sh

wofi_running=$(pgrep wofi)
if [ -z "$wofi_running" ]; then

	# use zero-width spaces to manipulate alphabetical sorting
	Z=$'\u200B'
	options=$( echo -e "${Z}${Z}${Z}${Z}${Z}${Z}  Tasks\n${Z}${Z}${Z}${Z}${Z}󰋊  Hibernate\n${Z}${Z}${Z}${Z}  Sleep\n${Z}${Z}${Z}  Reboot\n${Z}${Z}  Logout\n${Z}  Shutdown")

	op=$(echo -e "$options" | wofi -i --dmenu --sort-order alphabetical --width 300 --height 275)

	op=$(echo "$op" | awk '{print tolower($2)}')

	case $op in
		"tasks")
			hyprctl dispatch exec "[float;size 50% 75%;]" ~/dotfiles/wofi/.config/wofi/scripts/btp.sh
			;;
		"hibernate")
			systemctl hibernate
			;;
		"shutdown")
			systemctl poweroff
			;;
		"reboot")
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
