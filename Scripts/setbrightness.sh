#!/bin/bash

dmenu_args="${*}"

res=$(echo -e "10\n50\n100" | dmenu -p "Brightness" ${dmenu_args})

brightnessctl s ${res}%

notify-send "brightness changed" "now ${res}%"
