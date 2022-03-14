#!/usr/bin/env bash

command=$(mpc current)
status=$(mpc | grep playing | sed 's/|.*|/|/' | awk '{ print $3 }')

directory="$HOME/.local/share/icons/elementary"

icon_next="${directory}/gtk-media-next-ltr.svg"
icon_prev="${directory}/gtk-media-next-rtl.svg"
icon_play="${directory}/player_start.svg"
icon_pause="${directory}/hb-pause.svg"

function _next(){
  echo "<click>mpc next</click>"
  echo "<img>${icon_next}</img>"
}

function _prev(){
  echo "<click>mpc prev</click>"
  echo "<img>${icon_prev}</img>"
}

function __auto_play(){
  if [[ "$status" ]]; then
    echo "<txt>${command} - ${status}</txt>"
  else 
    echo "<txt>${command}</txt>"
  fi
}

function _status_mpc(){
  if [[ !  "$status" ]]; then
    echo "<img>${icon_play}</img>"
  else  
    echo "<img>${icon_pause}</img>"
  fi
}

if [[ "$command" ]]; then
  echo "<click>bash -c $HOME/bin/mpc-toggle.sh</click>"
  _status_mpc
fi

_prev
_next
__auto_play
