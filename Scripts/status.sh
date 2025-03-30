#!/bin/bash

# redshift -p | grep Period | tail -c +9
# gets period of day i.e. Daytime

stdin="${*}"

while true; do
	day_of_week=$(date +%u)
	case $day_of_week in
		1)
			day_of_week_kanji="月"
			;;
		2)
			day_of_week_kanji="火"
			;;
		3)
			day_of_week_kanji="水"
			;;
		4)
			day_of_week_kanji="木"
			;;
		5)
			day_of_week_kanji="金"
			;;
		6)
			day_of_week_kanji="土"
			;;
		7)
			day_of_week_kanji="日"
			;;
		*)
			day_of_week_kanji="?"
			;;
	esac
	month=$(date +%m)
	day=$(date +%d)
	year=$(date +%Y)
	hour=$(date +%H)
	minute=$(date +%M)
	second=$(date +%S)
	bat_per=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep percentage | tail -c 5)
	japanese_date="${year}年${month}月${day}日（${day_of_week_kanji}） ${hour}時${minute}分"
	xsetroot -name "󱓧 ${stdin} 󰃰 ${japanese_date} 󰁹 ${bat_per}"
	sleep 1m    # Update time every minute
done &

