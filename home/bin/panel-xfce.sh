#!/bin/bash

package='xfce4-panel-profiles'
icon='/home/jairo/.local/share/icons/elementary/monitor.svg'
command=$(xrandr | awk '/HDMI2 / { print $2 }')
if [ $command == 'connected' ]; then
  $package load /home/jairo/.local/share/xfce4-panel-profiles/painel-principal.tar.bz2
  notify-send -i $icon 'Painel duplo aplicado'
else 
  $package load /home/jairo/.local/share/xfce4-panel-profiles/Pessoal-Panel.tar.bz2
  notify-send -i $icon 'Painel primário aplicado'
fi
