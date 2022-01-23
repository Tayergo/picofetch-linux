#!/bin/bash

clear
echo "------LOGO--------"
tiv -h 25 -w 25 ~/picofetch/snak.png
echo "------OS VER------"
grep '^VERSION' /etc/os-release
egrep '^(VERSION|NAME)=' /etc/os-release
echo "------KERNEL------"
uname -r
echo "------FREE SPACE------"
df -h /dev/sdb3
echo "-----CPU MODEL------"
grep -m 1 'model name' /proc/cpuinfo
echo "------GPU MODEL-----"
glxinfo | grep "Device"
echo "------RAM INFO-----"
free -h
echo "-------SHELL----"
echo $SHELL
echo "----------PACKAGES----"
# The next command needs to have the .txt cleared before running for accuracy.
pacman -Qq --color never > packnum.txt
wc -l packnum.txt
echo "------------------"
