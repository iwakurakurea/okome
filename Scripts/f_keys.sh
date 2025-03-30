#!/bin/bash

# script to handle f-key functions with dwm binds

action="${*}"

case "$action" in
	"mute_volume")
		;;
	"volume_up")
		;;
	"volume_down")
		;;
	"mute_mic")
		;;
	"brightness_down")
		;;
	"brightness_up")
		;;
	"screenshot")
		;;
	*)
		notify-send "error" "action not recognized"
		;;
