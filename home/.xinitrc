#!/bin/sh

userresources=$HOME/.Xresources

sysresources=/etc/X11/xinit/.Xresources

# merge in defaults and keymaps

xrdb -merge ~/.Xresources

twm &
xclock -geometry 50x50-1+1 &
xterm -geometry 80x50+494+51 &
#xterm -geometry 80x20+494-0 &
exec xterm -geometry 80x66+0+0 -name login

