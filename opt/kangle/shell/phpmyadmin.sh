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
PREFIX="/vhs/kangle/nodewww/dbadmin"
PMV="$PREFIX/mysql/pm$PHPMY"
DFILE="phpMyAdmin-$PHPMYADMIN-all-languages"

cd $PREFIX
wget $mpcdn_3826/files/phpMyAdmin/$DFILE.tar.gz -O $DFILE.tar.gz
tar zxf $DFILE.tar.gz
rm -rf $PREFIX/mysql
mv -f $PREFIX/$DFILE $PREFIX/mysql
rm -f $DFILE.tar.gz

find $PREFIX/mysql/ -type f -print |xargs chmod 644;
find $PREFIX/mysql/ -type d -print |xargs chmod 755;

wget -q $mpcdn_2220/opt/kangle/config/dbadmin.xml -O /vhs/kangle/ext/dbadmin.xml
if [ -f /vhs/kangle/ext/php73/bin/php ] ; then
	sed -i "s/cmd:php56/cmd:php73/" /vhs/kangle/ext/dbadmin.xml
fi

/vhs/kangle/bin/kangle -q
killall php-cgi
/vhs/kangle/bin/kangle --reboot

cd -
echo -e "
————————————————————————————————————————————————————
已为您安装完成 phpMyAdmin-"$PHPMY"
请在EP后台【服务器设置】直接点击保存，即可恢复使用HTTP认证方式登录phpMyAdmin
————————————————————————————————————————————————————"
