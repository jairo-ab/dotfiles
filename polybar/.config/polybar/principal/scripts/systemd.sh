#!/usr/bin/env bash

if [ $2 ]; then
    [ "$1" == "-u" ] && param="--user"

    if systemctl $param is-active --quiet $2; then
        if [ $3 ]; then
            systemctl $param stop $2
            echo " $2"
        else
            echo "%{F#eee8d5 }%{F-} $2"
        fi
    else
        if [ $3 ]; then
            systemctl $param start $2
            echo "%{F#eee8d5}%{F-} $2"
        else
            echo " $2"
        fi
    fi
fi
