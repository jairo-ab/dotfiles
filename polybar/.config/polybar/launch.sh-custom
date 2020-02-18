#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar 

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

polybar -q top -r &
polybar -q bottom -r &
polybar -q top2 -r &
polybar -q bottom2 -r &

echo "Bars launched..."