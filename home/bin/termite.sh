#!/bin/env bash
# currently is not placing alacritty in the actual X and Y, trying to get it right

# drawing a rectangle with slop
read -r X Y W H < <(slop -f "%x %y %w %h" -b 4 -t 0 -q)

# Depends on font width & height
(( W /= 8 ))
(( H /= 14 ))

# for debug the size
#echo $W $H $X $Y
termite -v --title "aladraw" --dimensions $W $H --position $X $Y