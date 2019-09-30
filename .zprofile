#
# source ~/.zprofile
#

xrdb -merge ~/.Xresources

NEWGTKMOD="topmenu-gtk-module"

if [[ -z $GTK_MODULES ]]; 
  then
GTK_MODULES="$NEWGTKMOD"
  else
GTK_MODULES="$GTK_MODULES:$NEWGTKMOD"
fi

unset NEWGTKMOD
export GTK_MODULES
