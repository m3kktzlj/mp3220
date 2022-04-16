#!/bin/bash

#Configure workdir
dir00="/usr/local/runner"
dir01="/usr/local/runner/tgrp-pts"
dir02="/usr/local/runner/tgrp-ver"
dir03="/usr/local/runner/tgrp-tmp"
dir04="/usr/local/runner/tgrp-log"

source $dir02/kangle10_install_url
source $dir02/kangle10_install_ver

#start
PREFIX="/vhs/kangle/ext/tpl_php52"
if [ -d "$PREFIX" ];then
wget $runner_url/opt/kangle10/conf/php/php52.ini -O $PREFIX/php-templete.ini
fi
PREFIX="/vhs/kangle/ext/php53"
if [ -d "$PREFIX" ];then
wget $runner_url/opt/kangle10/conf/php/php53.ini -O $PREFIX/php-templete.ini
fi
PREFIX="/vhs/kangle/ext/php54"
if [ -d "$PREFIX" ];then
wget $runner_url/opt/kangle10/conf/php/php54.ini -O $PREFIX/php-templete.ini
fi
PREFIX="/vhs/kangle/ext/php55"
if [ -d "$PREFIX" ];then
wget $runner_url/opt/kangle10/conf/php/php55.ini -O $PREFIX/php-templete.ini
fi
PREFIX="/vhs/kangle/ext/php56"
if [ -d "$PREFIX" ];then
wget $runner_url/opt/kangle10/conf/php/php56.ini -O $PREFIX/php-templete.ini
wget $runner_url/opt/kangle10/conf/php/php-node.ini -O $PREFIX/etc/php-node.ini
fi
PREFIX="/vhs/kangle/ext/php70"
if [ -d "$PREFIX" ];then
wget $runner_url/opt/kangle10/conf/php/php70.ini -O $PREFIX/php-templete.ini
fi
PREFIX="/vhs/kangle/ext/php71"
if [ -d "$PREFIX" ];then
wget $runner_url/opt/kangle10/conf/php/php71.ini -O $PREFIX/php-templete.ini
fi
PREFIX="/vhs/kangle/ext/php72"
if [ -d "$PREFIX" ];then
wget $runner_url/opt/kangle10/conf/php/php72.ini -O $PREFIX/php-templete.ini
fi
PREFIX="/vhs/kangle/ext/php73"
if [ -d "$PREFIX" ];then
wget $runner_url/opt/kangle10/conf/php/php73.ini -O $PREFIX/php-templete.ini
fi
PREFIX="/vhs/kangle/ext/php74"
if [ -d "$PREFIX" ];then
wget $runner_url/opt/kangle10/conf/php/php74.ini -O $PREFIX/php-templete.ini
fi
PREFIX="/vhs/kangle/ext/php80"
if [ -d "$PREFIX" ];then
wget $runner_url/opt/kangle10/conf/php/php80.ini -O $PREFIX/php-templete.ini
fi
PREFIX="/vhs/kangle/ext/php81"
if [ -d "$PREFIX" ];then
wget $runner_url/opt/kangle10/conf/php/php81.ini -O $PREFIX/php-templete.ini
fi
/vhs/kangle/bin/kangle -r
echo -e "————————————————————————————————————————————————————
安装完成
————————————————————————————————————————————————————"