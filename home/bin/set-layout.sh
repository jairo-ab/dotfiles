#!/usr/bin/env bash

 layout=$(setxkbmap -query | grep layout | awk {' print $2 '})

 if [[ "$layout" == "br" ]]; then
   setxkbmap us
 else
   setxkbmap br
 fi
