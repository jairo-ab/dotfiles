#!/bin/bash
batticon=(    )
grep -q 1 /sys/class/power_supply/AC/online && batt="%{F#FFFFFF}%{F-}"
for ((i=0; i<=$(($(ls -d /sys/class/power_supply/BAT0 | wc -l) - 1)); i++)); do
	source /sys/class/power_supply/BAT$i/uevent 2> /dev/null
	for j in {0..9}; do
		[ $POWER_SUPPLY_CAPACITY -lt $((j * 10)) ] && batt+="%{F#8$((10 - j))$((j * 10))$((j * 10))}${batticon[((j + 1))/ 2]}%{F-} $POWER_SUPPLY_CAPACITY% " && break
	done
done
echo "$batt" | xargs