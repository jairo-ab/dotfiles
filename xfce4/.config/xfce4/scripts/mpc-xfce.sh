#!/usr/bin/env bash

command=$(mpc current)
status=$(mpc | grep playing | sed 's/|.*|/|/' | awk '{ print $3 }')
#play=$(mpc toggle)

icon="$HOME/.local/share/icons/elementary/player_start.svg"

if [ "$command" ]; then
  echo "<click>bash -c $HOME/bin/mpc-toggle.sh</click>"
  echo "<img>${icon}</img>"
  echo "<txt> ${command} - ${status}</txt>"
else
  echo "<txt></txt>"
fi
