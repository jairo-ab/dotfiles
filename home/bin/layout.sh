#!/usr/bin/env bash

layout=$(setxkbmap -query | grep layout | awk {' print $2 '})
dir="$HOME/bin/set-layout.sh"

function __auto__play(){
  if [[ "$layout" == "br" ]]; then
    echo "<txt>Layout: $layout</txt>" 
    echo "<click>bash -c $dir</click>"
  else
    echo "<txt>Layout: $layout</txt>"
    echo "<click>bash -c $dir</click>"
  fi
}

__auto__play
