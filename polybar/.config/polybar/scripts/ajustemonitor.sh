#!/bin/bash
#
# Conectar Monitor Secundário
#
# Credits: Jairo Abreu
# Telegram: @jairoabreeu

app="xrandr"

selecao=(
	'Conectar HDMI'
	'Desconetar HDMI'
	'Espelhar HDMI'
	'Conectar VGA'
	'Desconectar VGA'
	'Espelhar VGA'
)

res=$(printf "%s\n" "${selecao[@]}" | rofi $tema -dmenu -p "Rofi Config" -bw 0 -lines "${#selecao[@]}" -separator-style none -location 0 -width 180 -hide-scrollbar -padding 5)

if [ "$res" ]; then
	case $res in
		'Conectar HDMI') [ exec $app --output HDMI1 --mode 1920x1080 --primary --output eDP1 --mode 1366x768 --right-of HDMI1 ] || exec i3-msg restart ;;
		'Desconectar HDMI') exec $app --output HDMI1 --off && exec i3-msg restart ;;
		'Espelhar HDMI') exec $app --output eDP1 --mode 1366x768 --output HDMI1 --same-as eDP1 && exec i3-msg restart ;;
		'Conectar VGA') exec $app --output DP1 --mode 1024x768 --primary --output eDP1 --mode 1366x768 --right-of DP1 && exec i3-msg restart ;;
		'Desconectar VGA') exec $app --output DP1 --off && exec i3-msg restart ;;
		'Espelhar VGA') exec $app --output eDP1 --output DP1 --same-as eDP1 && exec i3-msg restart ;; 
	esac
fi