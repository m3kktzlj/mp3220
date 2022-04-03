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
PREFIX="/vhs/kangle/ext/tpl_php52"
if [ -d "$PREFIX" ];then
wget $mrocdn_2231/opt/kangle/config/php/php52.ini -O $PREFIX/php-templete.ini
fi
PREFIX="/vhs/kangle/ext/php53"
if [ -d "$PREFIX" ];then
wget $mrocdn_2231/opt/kangle/config/php/php53.ini -O $PREFIX/php-templete.ini
fi
PREFIX="/vhs/kangle/ext/php54"
if [ -d "$PREFIX" ];then
wget $mrocdn_2231/opt/kangle/config/php/php54.ini -O $PREFIX/php-templete.ini
fi
PREFIX="/vhs/kangle/ext/php55"
if [ -d "$PREFIX" ];then
wget $mrocdn_2231/opt/kangle/config/php/php55.ini -O $PREFIX/php-templete.ini
fi
PREFIX="/vhs/kangle/ext/php56"
if [ -d "$PREFIX" ];then
wget $mrocdn_2231/opt/kangle/config/php/php56.ini -O $PREFIX/php-templete.ini
wget $mrocdn_2231/opt/kangle/config/php/php-node.ini -O $PREFIX/etc/php-node.ini
fi
PREFIX="/vhs/kangle/ext/php70"
if [ -d "$PREFIX" ];then
wget $mrocdn_2231/opt/kangle/config/php/php70.ini -O $PREFIX/php-templete.ini
fi
PREFIX="/vhs/kangle/ext/php71"
if [ -d "$PREFIX" ];then
wget $mrocdn_2231/opt/kangle/config/php/php71.ini -O $PREFIX/php-templete.ini
fi
PREFIX="/vhs/kangle/ext/php72"
if [ -d "$PREFIX" ];then
wget $mrocdn_2231/opt/kangle/config/php/php72.ini -O $PREFIX/php-templete.ini
fi
PREFIX="/vhs/kangle/ext/php73"
if [ -d "$PREFIX" ];then
wget $mrocdn_2231/opt/kangle/config/php/php73.ini -O $PREFIX/php-templete.ini
fi
PREFIX="/vhs/kangle/ext/php74"
if [ -d "$PREFIX" ];then
wget $mrocdn_2231/opt/kangle/config/php/php74.ini -O $PREFIX/php-templete.ini
fi
PREFIX="/vhs/kangle/ext/php80"
if [ -d "$PREFIX" ];then
wget $mrocdn_2231/opt/kangle/config/php/php80.ini -O $PREFIX/php-templete.ini
fi
PREFIX="/vhs/kangle/ext/php81"
if [ -d "$PREFIX" ];then
wget $mrocdn_2231/opt/kangle/config/php/php81.ini -O $PREFIX/php-templete.ini
fi
/vhs/kangle/bin/kangle -r
echo -e "————————————————————————————————————————————————————
安装完成
————————————————————————————————————————————————————"