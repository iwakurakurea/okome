#!/bin/bash

# script to handle f-key functions with dwm binds
# this is mostly redundant as I have made dmenu scripts for
# volume and brightness control but I want the keys to work still

action="${*}"

case "$action" in
	"mute_volume")
		pactl set-sink-mute @DEFAULT_SINK@ toggle
		notify-send "f-keys" "volume $(if [[ $(pactl list sinks | awk '/Mute:/{print $2}') == "no" ]]; then echo 'un'; fi)muted"
		;;
	"volume_up")
		pactl set-sink-volume @DEFAULT_SINK@ +10%
		notify-send "f-keys" "volume now $(pactl list sinks | head -n 10 | awk '/Volume:/{print $5}')"
		;;
	"volume_down")
		pactl set-sink-volume @DEFAULT_SINK@ -10%
		notify-send "f-keys" "volume now $(pactl list sinks | head -n 10 | awk '/Volume:/{print $5}')"
		;;
	"mute_mic")
		pactl set-source-mute @DEFAULT_SOURCE@ toggle
		notify-send "f-keys" "mic $(if [[ $(pactl list sources | tail -n 90 | awk '/Mute:/{print $2}') == "no" ]]; then echo 'un'; fi)muted"
		;;
	"brightness_down")
		brightnessctl set -10%
		
		;;
	"brightness_up")
		brightnessctl set +10%
		;;
	#"screenshot")
	#	this is already handled by dwm bind printscrn gnome-screenshot
	#	;;
	*)
		notify-send "error" "f-key action not recognized"
		;;
esac
