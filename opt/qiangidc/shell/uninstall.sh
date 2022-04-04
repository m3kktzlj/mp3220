#!/bin/bash

#Configure workdir
dir00="/usr/local/runner"
dir01="/usr/local/runner/tgrp-pts"
dir02="/usr/local/runner/tgrp-ver"
dir03="/usr/local/runner/tgrp-tmp"
dir04="/usr/local/runner/tgrp-log"

source $dir02/RUNNER_data
source $dir02/qiangidc_install_url
source $dir02/qiangidc_install_ver

#start
clear
echo -e "————————————————————————————————————————————————————
卸载Kangle会删除Kangle自启动进程，但不会删除/vhs目录和mysql进程
如果您确认进行以下操作请输入 Y 进行卸载
如果否请按下Enter退出此操作
————————————————————————————————————————————————————"
input_enter=""
read -p "" input_enter
if [ "$input_enter" = "y" ] || [ "$input_enter" = "Y" ]; then
/vhs/kangle/bin/kangle -q
killall -9 kangle
sleep 3
rm -rf /var/cache/kangle
chkconfig kangle off
rm -f /etc/init.d/cdnbest 
rm -f /etc/init.d/kangle
rm -f /etc/rc3.d/S66kangle
rm -f /etc/rc3.d/S67cdnbest
rm -f /etc/rc5.d/S66kangle
rm -f /etc/rc5.d/S67cdnbest
echo -e "————————————————————————————————————————————————————
已完成卸载Kangle！
————————————————————————————————————————————————————"
exit
exit
else
clear
echo -e "————————————————————————————————————————————————————
已退出了卸载Kangle指令！
————————————————————————————————————————————————————"
fi

input_enter=""
read -p "(任意键返回主菜单)" input_enter
if [ "$input_enter"!="" ]; 
then
/usr/bin/qiangidc
fi
