#!/bin/sh

HOST=1.1.1.1

if ! ping=$(ping -n -c 1 -W 1 $HOST 2> /dev/null); then
    echo "%{F#BF616A}%{F-} ?"
else
    rtt=$(echo "$ping" | sed -rn 's/.*time=([0-9]{1,})\.?[0-9]{0,} ms:w.*/\1/p')

    if [ $rtt -gt 100 ]; then
        #icon="%{F#A3BE8C}%{F-}"
        icon="%{F#A3BE8C}%{F-}"
    elif [ "$rtt" -lt 150 ]; then
        icon="%{F#D08770}%{F-}"
    else
        icon="%{F#EBCB8B}%{F-}"
    fi

    echo "$icon $rtt ms "
fi
