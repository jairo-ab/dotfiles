#!/usr/bin/env bash

host=$(hostnamectl | grep hostname | awk {' print $3 '})
os=$(hostnamectl | grep System | cut -d":" -f2)
kernel=$(uname -r)
packages=$(pacman -Q | wc -l)

clear
echo
echo
echo -e "    hello" "\e[1;34m$USER\e[0m", "i'm" "\e[1;36m$host\e[0m"
echo

echo -e "  _( )_ "      
echo -e " (_(%)_) "     "       \e[1;33mDistro\e[0m" "\e[1;37m$os\e[0m"
echo -e "   (_)\ "      "        \e[1;33mKernel\e[0m" " \e[1;37m$kernel\e[0m"
echo -e "       | __ "  "   \e[1;33mPacotes\e[0m" " \e[1;37m$packages\e[0m"
echo -e "       |/_/ "  "        \e[1;33mWm\e[0m" " \e[1;37m$DESKTOP_SESSION\e[0m"
echo -e "       | "
echo -e "       | "

echo