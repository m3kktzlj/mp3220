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
cd $dir03
kangle_ver=$1
kangle_completed=$2
select_ver=$3
mysql_ver=$4
mysql_root_password=$5
release=`cat /etc/*release /etc/*version 2>/dev/null | grep -Eo '([0-9]{1,2}\.){1,3}' | cut -d '.' -f1 | head -1`;

function stat_iptables
{
	if [ ! -f /etc/init.d/iptables ]&&[ ! -f /usr/lib/systemd/system/firewalld.service ] ; then
		return;
	fi
	service iptables stop
	service firewalld stop
	chkconfig iptables off
	chkconfig firewalld off
	return;
}
function installkangle(){
	cd $dir03
	wget -q $mrocdn_2231/opt/kangle/shell/kangle.sh -O kangle.sh;sh kangle.sh $kangle_ver $kangle_completed | tee $dir04/kangle.log
}
function installep(){
	cd $dir03
	wget -q $mrocdn_2231/opt/kangle/shell/easypanel.sh -O easypanel.sh;sh easypanel.sh | tee $dir04/easypanel.log
}
function installftp(){
	cd $dir03
	wget -q $mrocdn_2231/opt/kangle/shell/pureftp.sh -O pureftp.sh;sh pureftp.sh | tee $dir04/pureftp.log
}
function installsql(){
	cd $dir03
	wget -q $mrocdn_2231/opt/kangle/shell/mysql.sh -O mysql.sh;sh mysql.sh $mysql_ver $mysql_root_password | tee $dir04/mysql.log
}
function installpm(){
	cd $dir03
	wget -q $mrocdn_2231/opt/kangle/shell/phpmyadmin.sh -O phpmyadmin.sh;sh phpmyadmin.sh | tee $dir04/phpmyadmin.log
}
function install_php_compile(){
	cd $dir03
	wget -q $mrocdn_2231/opt/kangle/shell/php_compile.sh -O php_compile.sh | tee $dir04/php_compile-00.log
	sh php_compile.sh 56 | tee $dir04/php56.log
	if [ "$select_ver" = "allc" ]; then
	sh php_compile.sh 53 | tee $dir04/php53.log
	sh php_compile.sh 54 | tee $dir04/php54.log
	sh php_compile.sh 55 | tee $dir04/php55.log
	sh php_compile.sh 70 | tee $dir04/php70.log
	sh php_compile.sh 71 | tee $dir04/php71.log
	sh php_compile.sh 72 | tee $dir04/php72.log
	sh php_compile.sh 73 | tee $dir04/php73.log
	if [ "$release" != "6" ]; then
	sh php_compile.sh 74 | tee $dir04/php74.log
	sh php_compile.sh 80 | tee $dir04/php80.log
	sh php_compile.sh 81 | tee $dir04/php81.log
	fi
	fi
	ln -s /vhs/kangle/ext/php56/bin/php /usr/bin/php
}
function install_php_rapidly(){
	cd $dir03
	wget -q $mrocdn_2231/opt/kangle/shell/php_rapidly.sh -O php_rapidly.sh
	sh php_rapidly.sh php56 | tee $dir04/php56.log
	if [ "$select_ver" = "all" ]; then
	sh php_rapidly.sh php53 | tee $dir04/php53.log
	sh php_rapidly.sh php54 | tee $dir04/php54.log
	sh php_rapidly.sh php55 | tee $dir04/php55.log
	sh php_rapidly.sh php70 | tee $dir04/php70.log
	sh php_rapidly.sh php71 | tee $dir04/php71.log
	sh php_rapidly.sh php72 | tee $dir04/php72.log
	sh php_rapidly.sh php73 | tee $dir04/php73.log
	if [ "$release" != "6" ]; then
	sh php_rapidly.sh php74 | tee $dir04/php74.log
	sh php_rapidly.sh php80 | tee $dir04/php80.log
	sh php_rapidly.sh php81 | tee $dir04/php81.log
	fi
	fi
	ln -s /vhs/kangle/ext/php56/bin/php /usr/bin/php
}
function installend(){
	wget -q $mrocdn_2231/opt/kangle/shell/complete.sh -O complete.sh;sh complete.sh $mysql_root_password | tee $dir04/complete.log
	exit 0
}
stat_iptables
if [ "$mysql_root_password" != "no" ]; then
installsql
fi
installkangle
installep
installftp
if [ "$select_ver" = "allc" ]||[ "$select_ver" = "defaultc" ]; then
install_php_compile
else
install_php_rapidly
fi
installpm
installend