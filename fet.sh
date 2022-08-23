#!/usr/bin/env bash
WM=${WAYLAND_DISPLAY:-$(xprop -id "$(xprop -root _NET_SUPPORTING_WM_CHECK | cut -d' ' -f5)" _NET_WM_NAME | cut -d'"' -f2)}
CPU=$(grep -m 1 'model name' /proc/cpuinfo)
GPU=$(lspci | grep -Em2 'VGA' | cut -c 24-5000)
echo -e "------------OS VER------------"
grep -m1 -o '[^NAME=]' '/etc/os-release' | cut -d '"' -f 2 | tr -d '\012\015' && printf "\n"
echo -e "------------KERNEL------------"
uname -r
echo -e "-------------DE/WM-------------"
echo ${WM}
echo -e "----------DISKS----------"
df -h --output=source,size,used,avail | grep --color=never -e '^/' -e Filesystem
echo -e "----------CPU MODEL-----------"
echo "${CPU:13}"
echo -e "----------GPU MODEL-----------"
echo "${GPU:12}"
echo -e "-----------RAM INFO-----------"
egrep 'MemTotal|MemAvailable' /proc/meminfo
echo -e "------------SHELL-------------"
basename $SHELL
