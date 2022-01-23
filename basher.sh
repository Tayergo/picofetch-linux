#!/bin/bash
LOGO=$(tiv -h 25 -w 25 ~/picofetch/snak.png)
OS1=$(grep '^VERSION' /etc/os-release)
OS2=$(grep -E '^(VERSION|NAME)=' /etc/os-release)
KERNEL=$(uname -r)
SPACE=$(df -h /dev/sdb3)
CPU=$(grep -m 1 'model name' /proc/cpuinfo)
GPU=$(glxinfo | grep "Device")
RAM=$(free -h)

clear
echo "------LOGO--------"
echo "$LOGO"
echo "------OS VER------"
echo "$OS1"
echo "$OS2"
echo "------KERNEL------"
echo "$KERNEL"
echo "------FREE SPACE------"
echo "$SPACE"
echo "-----CPU MODEL------"
echo "$CPU"
echo "------GPU MODEL-----"
echo "$GPU"
echo "------RAM INFO-----"
echo "$RAM"
echo "-------SHELL----"
echo "$SHELL"
echo "----------PACKAGES----"
# The next command needs to have the .txt cleared before running for accuracy.
pacman -Qq --color never > packnum.txt
wc -l packnum.txt
echo "------------------"