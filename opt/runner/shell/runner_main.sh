#!/bin/bash

#Configure workdir
dir00="/usr/local/runner"
dir01="/usr/local/runner/tgrp-pts"
dir02="/usr/local/runner/tgrp-ver"
dir03="/usr/local/runner/tgrp-tmp"
dir04="/usr/local/runner/tgrp-log"

source $dir02/RUNNER_data

#start
function test10(){
	cd $dir03
	wget -q $runner_url/opt/qiangidc/qiangidc_start -O qiangidc_start;sh qiangidc_start | tee $dir04/qiangidc_start.log
}

function Init(){
clear
echo -e "————————————————————————————————————————————————————
	\033[1mＫＡＮＧＬＥＳＯＦＴ\033[0m
	\033[32mKangle一键脚本-主菜单-Ver.20211231\033[0m
	说明：kanglesh命令可随时打开当前菜单
————————————————————————————————————————————————————
1. ◎ 自动配置Vhost服务器
2. ◎ 测试02
3. ◎ 测试03
4. ◎ 测试04
5. ◎ 测试05
6. ◎ 测试06
7. ◎ 测试07
8. ◎ 测试08
9. ◎ 测试09
a. ◎ 手动配置
0. ◎ 退出安装"
read -p "请输入序号并回车：" num
case "$num" in
[1] ) (Installall);;
[2] ) (Installcdn);;
[3] ) (Install);;
[4] ) (Easypanel_view);;
[5] ) (Resql);;
[6] ) (Resetpwd);;
[7] ) (Rephp);;
[8] ) (Uninstall);;
[9] ) (Tools);;
[a] ) (test10);;
[0] ) (exit);;
*) (Init);;
esac
}

Init
