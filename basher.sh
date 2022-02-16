#!/usr/bin/env bash
Color_Off='\033[0m'       # Text Reset
Red='\033[0;31m'          # Red
Green='\033[0;32m'        # Green
Yellow='\033[0;33m'       # Yellow
Blue='\033[0;34m'         # Blue
Purple='\033[0;35m'       # Purple
BRed='\033[1;31m'         # Red
BGreen='\033[1;32m'       # Green
BYellow='\033[1;33m'      # Yellow
BBlue='\033[1;34m'        # Blue
BPurple='\033[1;35m'      # Purple
BWhite='\033[1;37m'       # White
OS=$(grep -Em2 'NAME=' < /etc/os-release)
KERNEL=$(uname -r)
FREE_SPACE=$(df -h / | awk '{print $3}' | grep "^[0-9]")
TOTAL_SPACE=$(df -h /home | awk '{print $2}' | grep "^[0-9]")
SPACE=$(echo ${FREE_SPACE}/${TOTAL_SPACE})
CPU=$(grep -m 1 'model name' /proc/cpuinfo)
GPU=$(sudo lshw -c video | grep -Em2 'product:')
RAM=$(egrep 'MemTotal|MemAvailable' /proc/meminfo)
PACK=$(sudo pacman -Qq --color never > arch-pacman && dpkg-query -l | less > debian-dpkg && ls -d /var/db/pkg/*/*| cut -f5- -d/ > gentoo-pkg && wc -l arch-pacman && wc -l debian-dpkg && wc -l gentoo-pkg)
clear
echo -e "$BRed------------OS VER------------$Red"
echo "$OS"
echo -e "$BYellow------------KERNEL------------$Yellow"
echo "$KERNEL"
echo -e "$BWhite-------------DE/WM-------------$White"
echo "$DESKTOP_SESSION"
echo -e "$BGreen----------FREE SPACE----------$Green"
echo "$SPACE"
echo -e "$BBlue----------CPU MODEL-----------$Blue"
echo "${CPU:13}"
echo -e "$BPurple----------GPU MODEL-----------$Purple"
echo "${GPU:12}"
echo -e "$BRed-----------RAM INFO-----------$Red"
echo "$RAM"
echo -e "$BYellow------------SHELL-------------$Yellow"
echo "$SHELL"
echo -e "$BGreen-----------PACKAGES-----------$Green"
echo "$PACK"
echo -e "$BWhite------------------------------"
