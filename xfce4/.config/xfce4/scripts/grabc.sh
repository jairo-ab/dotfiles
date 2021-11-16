#!/usr/bin/env bash

sleep .5
cor=$(DISPLAY=:0 grabc)
icon="/home/jairo/.icons/ePapirus/24x24/actions/color-picker-white.svg"

if [[ "$cor" =~ '#' ]] && [[ ${#cor} == 7 ]]; then
	echo $cor | xclip -sel clipboard
	notify-send -i $icon "cor copiada $cor"
else
	notify-send "erro"
fi
