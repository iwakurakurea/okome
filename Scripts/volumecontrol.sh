#!/bin/bash

dmenu_args="${*}"

res=$( echo "togglemute" | dmenu -p "Enter a number to set as volume %" ${dmenu_args} )

case "$res" in
	"togglemute")
		pactl set-sink-mute @DEFAULT_SINK@ toggle
		notify-send "volume control" "mute toggled"
		;;
	*)
		pactl set-sink-volume @DEFAULT_SINK@ ${res}%
		notify-send "volume control" "now ${res}%"
		;;
esac
