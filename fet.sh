#!/usr/bin/env bash
Color_Off='\033[0m' # Text-Reset
Red='\033[0;31m' # Regular Colors
Green='\033[0;32m' 
Yellow='\033[0;33m' 
Blue='\033[0;34m' 
Purple='\033[0;35m' 
BRed='\033[1;31m' # Bright Colors
BGreen='\033[1;32m'
BYellow='\033[1;33m'
BBlue='\033[1;34m'
BPurple='\033[1;35m'
BWhite='\033[1;37m' # White
WM=${WAYLAND_DISPLAY:-$(xprop -id "$(xprop -root _NET_SUPPORTING_WM_CHECK | cut -d' ' -f5)" _NET_WM_NAME | cut -d'"' -f2)}
CPU=$(grep -m 1 'model name' /proc/cpuinfo)
GPU=$(lspci | grep -Em2 'VGA')
echo -e "$BRed------------OS VER------------$Red"
grep -m1 -o '[^NAME=]' '/etc/os-release' | cut -d '"' -f 2 | tr -d '\012\015' && printf "\n"
echo -e "$BYellow------------KERNEL------------$Yellow"
uname -r
echo -e "$BWhite-------------DE/WM-------------$White"
echo ${WM}
echo -e "$BGreen----------FREE SPACE----------$Green"
df -h / | awk '{print $3}' | grep "^[0-9]" && df -h /home | awk '{print $2}' | grep "^[0-9]"
echo -e "$BBlue----------CPU MODEL-----------$Blue"
echo "${CPU:13}"
echo -e "$BPurple----------GPU MODEL-----------$Purple"
echo "${GPU:12}"
echo -e "$BRed-----------RAM INFO-----------$Red"
egrep 'MemTotal|MemAvailable' /proc/meminfo
echo -e "$BYellow------------SHELL-------------$Yellow"
basename $SHELL
echo -e "$BGreen-----------PACKAGES-----------$Green"
# I was getting frustrated implementing this package counting.
if [ -x $(command -v "pacman") ]; then
  PACK="$(pacman -Qq | wc -l)"
elif [ -x $(command -v "apt") ]; then
  PACK="$(dpkg-query -l | less | wc -l)"
elif [ -x $(command -v "emerge") ]; then
  PACK="$(ls -d /var/db/pkg/*/*| cut -f5- -d/ | wc -l)"
elif [ -x $(command -v "xbps-query") ]; then
  PACK="$(xbps-query -l | wc -l)"
fi
echo "$PACK"
