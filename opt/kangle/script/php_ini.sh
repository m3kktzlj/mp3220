#!/bin/bash

#Configure workdir
dir01="/root/kangle_install_tmp"
dir02="/root/kangle_install_log"

#Source Config
source ${dir01}/kangle_install_ver
source ${dir01}/kangle_install_url

#start
PREFIX="/vhs/kangle/ext/tpl_php52"
if [ -d "$PREFIX" ];then
wget ${mpcdn_2220}/opt/kangle/conf/php/php52.ini -O ${dir01}/$PREFIX/php-templete.ini
fi
PREFIX="/vhs/kangle/ext/php53"
if [ -d "$PREFIX" ];then
wget ${mpcdn_2220}/opt/kangle/conf/php/php53.ini -O ${dir01}/$PREFIX/php-templete.ini
fi
PREFIX="/vhs/kangle/ext/php54"
if [ -d "$PREFIX" ];then
wget ${mpcdn_2220}/opt/kangle/conf/php/php54.ini -O ${dir01}/$PREFIX/php-templete.ini
fi
PREFIX="/vhs/kangle/ext/php55"
if [ -d "$PREFIX" ];then
wget ${mpcdn_2220}/opt/kangle/conf/php/php55.ini -O ${dir01}/$PREFIX/php-templete.ini
fi
PREFIX="/vhs/kangle/ext/php56"
if [ -d "$PREFIX" ];then
wget ${mpcdn_2220}/opt/kangle/conf/php/php56.ini -O ${dir01}/$PREFIX/php-templete.ini
wget ${mpcdn_2220}/opt/kangle/conf/php/php-node.ini -O ${dir01}/$PREFIX/etc/php-node.ini
fi
PREFIX="/vhs/kangle/ext/php70"
if [ -d "$PREFIX" ];then
wget ${mpcdn_2220}/opt/kangle/conf/php/php70.ini -O ${dir01}/$PREFIX/php-templete.ini
fi
PREFIX="/vhs/kangle/ext/php71"
if [ -d "$PREFIX" ];then
wget ${mpcdn_2220}/opt/kangle/conf/php/php71.ini -O ${dir01}/$PREFIX/php-templete.ini
fi
PREFIX="/vhs/kangle/ext/php72"
if [ -d "$PREFIX" ];then
wget ${mpcdn_2220}/opt/kangle/conf/php/php72.ini -O ${dir01}/$PREFIX/php-templete.ini
fi
PREFIX="/vhs/kangle/ext/php73"
if [ -d "$PREFIX" ];then
wget ${mpcdn_2220}/opt/kangle/conf/php/php73.ini -O ${dir01}/$PREFIX/php-templete.ini
fi
PREFIX="/vhs/kangle/ext/php74"
if [ -d "$PREFIX" ];then
wget ${mpcdn_2220}/opt/kangle/conf/php/php74.ini -O ${dir01}/$PREFIX/php-templete.ini
fi
PREFIX="/vhs/kangle/ext/php80"
if [ -d "$PREFIX" ];then
wget ${mpcdn_2220}/opt/kangle/conf/php/php80.ini -O ${dir01}/$PREFIX/php-templete.ini
fi
PREFIX="/vhs/kangle/ext/php81"
if [ -d "$PREFIX" ];then
wget ${mpcdn_2220}/opt/kangle/conf/php/php81.ini -O ${dir01}/$PREFIX/php-templete.ini
fi
/vhs/kangle/bin/kangle -r
echo -e "————————————————————————————————————————————————————
安装完成
————————————————————————————————————————————————————"