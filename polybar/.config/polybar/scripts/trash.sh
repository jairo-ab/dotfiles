#!/usr/bin/env bash

cor=$(awk -F# '/secondary/{print $2;exit}' ${HOME}/.config/polybar/config)
trash_dir="${HOME}/.local/share/Trash"
trash_temp="/tmp/lixo"
icone="${HOME}/.local/share/icons/elementary/user-trash.png"

if [[ "${trash_dir}" = "" ]]; then
  trash_dir=${XDG_DATA_HOME:-"${HOME}/.local/share/Trash"}
fi

if [[ "${1}" == "-x" ]]; then
	if [ ! -d $trash_temp ]; then
		mkdir $trash_temp
	fi

	cp -rf ${trash_dir}/files ${trash_temp}/
	cp -rf ${trash_dir}/info ${trash_temp}/

	rm -rf ${trash_dir}/files
	rm -rf ${trash_dir}/info

	mkdir ${trash_dir}/files
	mkdir ${trash_dir}/info

	if xset q &>/dev/null; then
		# ls /usr/share/sounds/freedesktop/stereo/
		export DISPLAY=:0 ; canberra-gtk-play -i trash-empty 2>&1
		export DISPLAY=:0 ; notify-send -i $icone "Lixeira" "Lixeira limpa!"
	fi
elif [[ "${1}" == "-o" ]]; then
	xdg-open $trash_dir/files
fi

TRASH_COUNT=$(ls -U -1 "${trash_dir}/files" | wc -l)

if [[ ${TRASH_COUNT} -gt 0 ]]; then
	s="%{F#${cor}}%{F-} ${TRASH_COUNT}"
else
	s=""
fi

echo "${s}"
