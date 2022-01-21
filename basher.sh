#!/bin/bash

clear

grep '^VERSION' /etc/os-release
egrep '^(VERSION|NAME)=' /etc/os-release
echo "------------------"
uname -r
echo "------------------"
df -h /dev/sdb3
echo "------------------"
grep -m 1 'model name' /proc/cpuinfo
echo "------------------"
glxinfo | grep "Device"
echo "------------------"
free -h
echo "------------------"
echo $SHELL
echo "------------------"
# The next command needs to have the .txt cleared before running for accuracy.
pacman -Qq --color never > packnum.txt
wc -l packnum.txt
echo "------------------"
