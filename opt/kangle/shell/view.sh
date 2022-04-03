#!/bin/bash

#Configure workdir
dir00="/root/runner"
dir01="/root/runner/tgrp-pts"
dir02="/root/runner/tgrp-ver"
dir03="/root/runner/tgrp-tmp"
dir04="/root/runner/tgrp-log"

#source config
source $dir02/kangle_install_url
source $dir02/kangle_install_ver

#start
function install_template(){
	vfile=$1
	rm -rf /vhs/kangle/nodewww/webftp/vhost/view/default;
	rm -f ${vfile}.zip
	wget $mrocdn_3221/files/view/${vfile}.zip?$RANDOM -O ${vfile}.zip -c;
	unzip -q ${vfile}.zip -d /vhs/kangle/nodewww/webftp/vhost/view;
	rm -rf /vhs/kangle/nodewww/webftp/framework/templates_c/default/*;
	echo "————————————————————————————————————————————————————
模板更换成功！如模板显示有异常请在3312后台清除模板缓存，自己清除本地浏览器缓存后重试
————————————————————————————————————————————————————"
}

function install_menu(){
clear
echo -e "————————————————————————————————————————————————————
	\033[1mＫＡＮＧＬＥＳＯＦＴ\033[0m
	\033[32m更换Easypanel模板\033[0m
————————————————————————————————————————————————————
1. ◎ EP前台模板-EP原版默认模板
2. ◎ EP前台模板-蓝黑自适应模板
3. ◎ EP前台模板-基于原版美化模板
4. ◎ EP前台模板-YDHostV3自适应模板
5. ◎ EP前台模板-猫儿多彩自适应模板
0. ◎ 返回主菜单"
read -p "请输入序号并回车：" num
case "$num" in
[1] ) (install_template view1);;
[2] ) (install_template view2);;
[3] ) (install_template view3);;
[4] ) (install_template view4);;
[5] ) (install_template view5);;
[0] ) (sh main.sh);;
*) (install_menu);;
esac
}
install_menu
