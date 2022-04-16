#!/bin/bash

#Configure workdir
dir01="/root/kangle_install_tmp"
dir02="/root/kangle_install_log"

#Source Config
source ${dir01}/kangle_install_ver
source ${dir01}/kangle_install_url

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
	
	wget -q ${mpcdn_2220}/opt/kangle/script/kangle.sh -O ${dir01}/kangle.sh;sh kangle.sh $kangle_ver $kangle_completed | tee ${dir02}/kangle.log
}
function installep(){
	
	wget -q ${mpcdn_2220}/opt/kangle/script/easypanel.sh -O ${dir01}/easypanel.sh;sh easypanel.sh | tee ${dir02}/easypanel.log
}
function installftp(){
	
	wget -q ${mpcdn_2220}/opt/kangle/script/pureftp.sh -O ${dir01}/pureftp.sh;sh pureftp.sh | tee ${dir02}/pureftp.log
}
function installsql(){
	
	wget -q ${mpcdn_2220}/opt/kangle/script/mysql_install.sh -O ${dir01}/mysql_install.sh;sh mysql_install.sh $mysql_ver $mysql_root_password | tee ${dir02}/mysql_install.log
}
function installpm(){
	
	wget -q ${mpcdn_2220}/opt/kangle/script/phpmyadmin.sh -O ${dir01}/phpmyadmin.sh;sh phpmyadmin.sh | tee ${dir02}/phpmyadmin.log
}
function install_php_compile(){
	
	wget -q ${mpcdn_2220}/opt/kangle/script/php_compile.sh -O ${dir01}/php_compile.sh | tee ${dir02}/php_compile-00.log
	sh php_compile.sh 56 | tee ${dir02}/php56.log
	if [ "$select_ver" = "allc" ]; then
	sh php_compile.sh 53 | tee ${dir02}/php53.log
	sh php_compile.sh 54 | tee ${dir02}/php54.log
	sh php_compile.sh 55 | tee ${dir02}/php55.log
	sh php_compile.sh 70 | tee ${dir02}/php70.log
	sh php_compile.sh 71 | tee ${dir02}/php71.log
	sh php_compile.sh 72 | tee ${dir02}/php72.log
	sh php_compile.sh 73 | tee ${dir02}/php73.log
	if [ "$release" != "6" ]; then
	sh php_compile.sh 74 | tee ${dir02}/php74.log
	sh php_compile.sh 80 | tee ${dir02}/php80.log
	sh php_compile.sh 81 | tee ${dir02}/php81.log
	fi
	fi
	ln -s /vhs/kangle/ext/php56/bin/php /usr/bin/php
}
function install_php_rapidly(){
	
	wget -q ${mpcdn_2220}/opt/kangle/script/php_rapidly.sh -O ${dir01}/php_rapidly.sh
	sh php_rapidly.sh php56 | tee ${dir02}/php56.log
	if [ "$select_ver" = "all" ]; then
	sh php_rapidly.sh php53 | tee ${dir02}/php53.log
	sh php_rapidly.sh php54 | tee ${dir02}/php54.log
	sh php_rapidly.sh php55 | tee ${dir02}/php55.log
	sh php_rapidly.sh php70 | tee ${dir02}/php70.log
	sh php_rapidly.sh php71 | tee ${dir02}/php71.log
	sh php_rapidly.sh php72 | tee ${dir02}/php72.log
	sh php_rapidly.sh php73 | tee ${dir02}/php73.log
	if [ "$release" != "6" ]; then
	sh php_rapidly.sh php74 | tee ${dir02}/php74.log
	sh php_rapidly.sh php80 | tee ${dir02}/php80.log
	sh php_rapidly.sh php81 | tee ${dir02}/php81.log
	fi
	fi
	ln -s /vhs/kangle/ext/php56/bin/php /usr/bin/php
}
function installend(){
	wget -q ${mpcdn_2220}/opt/kangle/script/complete.sh -O ${dir01}/complete.sh;sh complete.sh $mysql_root_password | tee ${dir02}/complete.log
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