#!/bin/bash

if [ $1 ]; then
	bash -c "$HOME/bin/videodown.sh" &
fi

downloads=$(ps -A | grep youtube-dl | wc -l)

if [ $downloads -gt 0 ]; then
	echo "%{F#D08770}%{F-} $downloads"
else
	echo "%{F#D08770}%{F-}"
fi