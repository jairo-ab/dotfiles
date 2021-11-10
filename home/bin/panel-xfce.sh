#!/bin/bash

package='xfce4-panel-profiles'
icon='/home/jairo/.local/share/icons/elementary/monitor.svg'
if [ 'xrandr | grep "HDMI2 connected"' ]; then
  $package load /home/jairo/.local/share/xfce4-panel-profiles/work-panel2.tar.bz2
  notify-send -i $icon 'Painel duplo aplicado'
else 
  $package load /home/jairo/.local/share/xfce4-panel-profiles/Pessoal-Panel.tar.bz2
  notify-send -i $icon 'Painel primário aplicado'
fi
