#!/bin/bash

#Configure workdir

source kangle_install_ver
source kangle_install_url

#start
PREFIX="/vhs/kangle/ext/tpl_php52"
if [ -d "$PREFIX" ];then
wget ${mpcdn_2220}/opt/kangle/conf/php/php52.ini -O $PREFIX/php-templete.ini
fi
PREFIX="/vhs/kangle/ext/php53"
if [ -d "$PREFIX" ];then
wget ${mpcdn_2220}/opt/kangle/conf/php/php53.ini -O $PREFIX/php-templete.ini
fi
PREFIX="/vhs/kangle/ext/php54"
if [ -d "$PREFIX" ];then
wget ${mpcdn_2220}/opt/kangle/conf/php/php54.ini -O $PREFIX/php-templete.ini
fi
PREFIX="/vhs/kangle/ext/php55"
if [ -d "$PREFIX" ];then
wget ${mpcdn_2220}/opt/kangle/conf/php/php55.ini -O $PREFIX/php-templete.ini
fi
PREFIX="/vhs/kangle/ext/php56"
if [ -d "$PREFIX" ];then
wget ${mpcdn_2220}/opt/kangle/conf/php/php56.ini -O $PREFIX/php-templete.ini
wget ${mpcdn_2220}/opt/kangle/conf/php/php-node.ini -O $PREFIX/etc/php-node.ini
fi
PREFIX="/vhs/kangle/ext/php70"
if [ -d "$PREFIX" ];then
wget ${mpcdn_2220}/opt/kangle/conf/php/php70.ini -O $PREFIX/php-templete.ini
fi
PREFIX="/vhs/kangle/ext/php71"
if [ -d "$PREFIX" ];then
wget ${mpcdn_2220}/opt/kangle/conf/php/php71.ini -O $PREFIX/php-templete.ini
fi
PREFIX="/vhs/kangle/ext/php72"
if [ -d "$PREFIX" ];then
wget ${mpcdn_2220}/opt/kangle/conf/php/php72.ini -O $PREFIX/php-templete.ini
fi
PREFIX="/vhs/kangle/ext/php73"
if [ -d "$PREFIX" ];then
wget ${mpcdn_2220}/opt/kangle/conf/php/php73.ini -O $PREFIX/php-templete.ini
fi
PREFIX="/vhs/kangle/ext/php74"
if [ -d "$PREFIX" ];then
wget ${mpcdn_2220}/opt/kangle/conf/php/php74.ini -O $PREFIX/php-templete.ini
fi
PREFIX="/vhs/kangle/ext/php80"
if [ -d "$PREFIX" ];then
wget ${mpcdn_2220}/opt/kangle/conf/php/php80.ini -O $PREFIX/php-templete.ini
fi
PREFIX="/vhs/kangle/ext/php81"
if [ -d "$PREFIX" ];then
wget ${mpcdn_2220}/opt/kangle/conf/php/php81.ini -O $PREFIX/php-templete.ini
fi
/vhs/kangle/bin/kangle -r
echo -e "————————————————————————————————————————————————————
安装完成
————————————————————————————————————————————————————"