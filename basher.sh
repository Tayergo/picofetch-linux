#!/bin/bash
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

# LOGO=$(snak.txt)
OS=$(grep -m1 "NAME=" < /etc/os-release | cut -d '"' -f 2)
KERNEL=$(uname -r)
FREE_SPACE=$(df -h / | awk '{print $3}' | grep "^[0-9]")
TOTAL_SPACE=$(df -h / | awk '{print $2}' | grep "^[0-9]")
SPACE=$(echo ${FREE_SPACE}/${TOTAL_SPACE})
CPU=$(grep -m 1 'model name' /proc/cpuinfo)
GPU=$(glxinfo | grep "Device")
RAM=$(free -h)

clear
# echo -e "$BWhite------------LOGO--------------$Color_Off"
# echo -e "$LOGO"

echo -e "$BRed------------OS VER------------$Red"
echo "$OS"
echo

echo -e "$BYellow------------KERNEL------------$Yellow"
echo "$KERNEL"
echo

echo -e "$BGreen----------FREE SPACE----------$Green"
echo "$SPACE"
echo

echo -e "$BBlue----------CPU MODEL-----------$Blue"
echo "${CPU:13}"
echo

echo -e "$BPurple----------GPU MODEL-----------$Purple"
echo "${GPU:12}"
echo

echo -e "$BRed-----------RAM INFO-----------$Red"
echo "$RAM"
echo

echo -e "$BYellow------------SHELL-------------$Yellow"
echo "$SHELL"
echo

echo -e "$BGreen-----------PACKAGES-----------$Green"
# The next command needs to have the .txt cleared before running for accuracy.
case $OS in
    arch)
        ARCH_PKG=$(pacman -Qq --color never > packnum.txt && wc -l packnum.txt)
        echo "${ARCH_PKG} (pacman)"
    ;;
    debian)
        DEB_PKG=$(dpkg-query -f '${binary:Package}\n' -W | wc -l)
        echo "${DEB_PKG} (dpkg)"
    ;;
    ubuntu)
        DEB_PKG=$(dpkg-query -f '${binary:Package}\n' -W | wc -l)
        echo "${DEB_PKG} (dpkg)"
    ;;
    Arch)
        ARCH_PKG=$(pacman -Qq --color never > packnum.txt && wc -l packnum.txt)
        echo "${ARCH_PKG} (pacman)"
    ;;
    Debian)
        DEB_PKG=$(dpkg-query -f '${binary:Package}\n' -W | wc -l)
        echo "${DEB_PKG} (dpkg)"
    ;;
    Ubuntu)
        DEB_PKG=$(dpkg-query -f '${binary:Package}\n' -W | wc -l)
        echo "${DEB_PKG} (dpkg)"
    ;;
esac
echo -e "$BWhite------------------------------"
