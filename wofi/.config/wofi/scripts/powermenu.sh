#!/bin/sh
Z=$'\u200B'
options=$( echo -e "\
  Tasks
  Lock
󰤄  Sleep
󰋊  Hibernate
  Logout
  Reboot
  Shutdown
")

op=$(echo -e "$options" | wofi -i --dmenu --width 300 --height 310)

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
	"lock")
		hyprlock
		;;
esac
