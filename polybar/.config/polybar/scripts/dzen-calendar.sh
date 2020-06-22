#!/bin/bash

# cor
C1="#cdae9c"

# font bold e normal
BOLD="Literation_Mono_NF:bold:size=7"
NORMAL="Literation_Mono_NF:size=7"

(
echo "^fn($BOLD)^fg($C1)Calendário^fg()"; echo
echo "^fn($BOLD)^fg($C1)Jairo Abreu^fg()"; echo
echo "$(date +'%B          %Y')"
cal | awk 'NR==2' | sed "s/\(.*\)/^bg($C1)^fg(#000000) \1 ^fg()^bg()/g"; echo
cal | awk 'NR>2'  | sed "s/ \([0-9]\) /0\1 /g;s/\($(date +%d)\)/^bg($C1)^fg(#000000)\1^fg()^bg()/"
) | dzen2 -p -fn "$NORMAL" -x "2" -y "30" -bg "#202020" -fg "#666666" -l "11" -w "150" -sa "c" -e "onstart=uncollapse;button3=exit"
