#!/bin/bash

dmenu_args="${*}"

result=$(echo -e "No\nYes" | dmenu -p "Really exit?" ${dmenu_args})

# printf "%s" $result

case "$result" in
	"Yes")
		killall .rundwm
		killall status.sh
		;;
	"No")
		notify-send "exit cancelled" "thank you for choosing dwm! ^w^"
		;;
	*)
		notify-send "confirm exit error" meow
		;;
esac
