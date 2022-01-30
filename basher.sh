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
OS1=$(grep '^VERSION' /etc/os-release)
OS2=$(grep -E '^(VERSION|NAME)=' /etc/os-release)
KERNEL=$(uname -r)
SPACE=$(df -h /dev/sdb3)
CPU=$(grep -m 1 'model name' /proc/cpuinfo)
GPU=$(glxinfo | grep "Device")
RAM=$(egrep 'MemTotal|MemFree|MemAvailable' /proc/meminfo)

clear
# echo -e "$BWhite------------LOGO--------------$Color_Off"
# echo -e "$LOGO"

echo -e "$BRed------------OS VER------------$Red"
echo "$OS1"
echo "$OS2"
echo

echo -e "$BYellow------------KERNEL------------$Yellow"
echo "$KERNEL"
echo

echo -e "$BGreen----------FREE SPACE----------$Green"
echo "$SPACE"
echo

echo -e "$BBlue----------CPU MODEL-----------$Blue"
echo "$CPU"
echo

echo -e "$BPurple----------GPU MODEL-----------$Purple"
echo "$GPU"
echo

echo -e "$BRed-----------RAM INFO-----------$Red"
echo "$RAM"
echo

echo -e "$BYellow------------SHELL-------------$Yellow"
echo "$SHELL"
echo

echo -e "$BGreen-----------PACKAGES-----------$Green"
# The next command needs to have the .txt cleared before running for accuracy.
pacman -Qq --color never > packnum.txt
wc -l packnum.txt
echo -e "$BWhite------------------------------"
