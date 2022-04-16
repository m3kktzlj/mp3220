#!/bin/bash

#Configure workdir

source kangle_install_ver
source kangle_install_url

#start

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
	
	wget -q ${mpcdn_2220}/opt/kangle/script/kangle.sh -O kangle.sh;sh kangle.sh $kangle_ver $kangle_completed | tee kangle.log
}
function installep(){
	
	wget -q ${mpcdn_2220}/opt/kangle/script/easypanel.sh -O easypanel.sh;sh easypanel.sh | tee easypanel.log
}
function installftp(){
	
	wget -q ${mpcdn_2220}/opt/kangle/script/pureftp.sh -O pureftp.sh;sh pureftp.sh | tee pureftp.log
}
function installsql(){
	
	wget -q ${mpcdn_2220}/opt/kangle/script/mysql_install.sh -O mysql_install.sh;sh mysql_install.sh $mysql_ver $mysql_root_password | tee mysql_install.log
}
function installpm(){
	
	wget -q ${mpcdn_2220}/opt/kangle/script/phpmyadmin.sh -O phpmyadmin.sh;sh phpmyadmin.sh | tee phpmyadmin.log
}
function install_php_compile(){
	
	wget -q ${mpcdn_2220}/opt/kangle/script/php_compile.sh -O php_compile.sh | tee php_compile-00.log
	sh php_compile.sh 56 | tee php56.log
	if [ "$select_ver" = "allc" ]; then
	sh php_compile.sh 53 | tee php53.log
	sh php_compile.sh 54 | tee php54.log
	sh php_compile.sh 55 | tee php55.log
	sh php_compile.sh 70 | tee php70.log
	sh php_compile.sh 71 | tee php71.log
	sh php_compile.sh 72 | tee php72.log
	sh php_compile.sh 73 | tee php73.log
	if [ "$release" != "6" ]; then
	sh php_compile.sh 74 | tee php74.log
	sh php_compile.sh 80 | tee php80.log
	sh php_compile.sh 81 | tee php81.log
	fi
	fi
	ln -s /vhs/kangle/ext/php56/bin/php /usr/bin/php
}
function install_php_rapidly(){
	
	wget -q ${mpcdn_2220}/opt/kangle/script/php_rapidly.sh -O php_rapidly.sh
	sh php_rapidly.sh php56 | tee php56.log
	if [ "$select_ver" = "all" ]; then
	sh php_rapidly.sh php53 | tee php53.log
	sh php_rapidly.sh php54 | tee php54.log
	sh php_rapidly.sh php55 | tee php55.log
	sh php_rapidly.sh php70 | tee php70.log
	sh php_rapidly.sh php71 | tee php71.log
	sh php_rapidly.sh php72 | tee php72.log
	sh php_rapidly.sh php73 | tee php73.log
	if [ "$release" != "6" ]; then
	sh php_rapidly.sh php74 | tee php74.log
	sh php_rapidly.sh php80 | tee php80.log
	sh php_rapidly.sh php81 | tee php81.log
	fi
	fi
	ln -s /vhs/kangle/ext/php56/bin/php /usr/bin/php
}
function installend(){
	wget -q ${mpcdn_2220}/opt/kangle/script/complete.sh -O complete.sh;sh complete.sh $mysql_root_password | tee complete.log
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