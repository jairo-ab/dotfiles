#!/usr/bin/env bash

command=$(mpc current)
status=$(mpc | grep playing | sed 's/|.*|/|/' | awk '{ print $3 }')

if [ "$command" ]; then
  echo "<txt>  ${command} - ${status}</txt>"
else
  echo "<txt></txt>"
fi
