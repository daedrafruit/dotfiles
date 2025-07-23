#!/bin/sh
# use zero-width spaces to manipulate alphabetical sorting
Z=$'\u200B'
options=$( echo -e "\
${Z}${Z}${Z}${Z}${Z}${Z}${Z}  Tasks
${Z}${Z}${Z}${Z}${Z}${Z}  Lock
${Z}${Z}${Z}${Z}${Z}󰤄  Sleep
${Z}${Z}${Z}${Z}󰋊  Hibernate
${Z}${Z}${Z}  Logout
${Z}${Z}  Reboot
${Z}  Shutdown
")

op=$(echo -e "$options" | wofi -i --dmenu --sort-order alphabetical --width 300 --height 255)

op=$(echo "$op" | awk '{print tolower($2)}')

case $op in
	"tasks")
		hyprctl dispatch exec "[float;size 50% 88%;]" ~/dotfiles/wofi/.config/wofi/scripts/btp.sh
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
	"lock")
		hyprlock
		;;
esac
