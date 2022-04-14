#!/bin/bash

#Configure workdir
dir00="/usr/local/runner"
dir01="/usr/local/runner/tgrp-pts"
dir02="/usr/local/runner/tgrp-ver"
dir03="/usr/local/runner/tgrp-tmp"
dir04="/usr/local/runner/tgrp-log"

source ${dir02}/kangle10_install_url
source ${dir02}/kangle10_install_ver

#start
release=`cat /etc/*release /etc/*version 2>/dev/null | grep -Eo '([0-9]{1,2}\.){1,3}' | cut -d '.' -f1 | head -1`;

mysql_ver=$1
mysql_root_password=$2
if [ "$mysql_ver" = "" ]; then
mysql_ver="6"
fi
if [ "$mysql_root_password" = "" ]; then
mysql_root_password="mysql"
fi

echo $mysql_ver > /etc/mysql_ver

#killall mysqld

if [ "$release" = "8" ] && [ "$mysql_ver" != "8" ];then
	if [ "$mysql_ver" = "6" ]; then
		yum -y install ${mpcdn_3827}/files/mysql-yum/mysql56-community-el7/mysql-community-common-${MYSQL_VERSION56}.el7.x86_64.rpm
		yum -y install ${mpcdn_3827}/files/mysql-yum/mysql56-community-el7/mysql-community-libs-${MYSQL_VERSION56}.el7.x86_64.rpm
		yum -y install ${mpcdn_3827}/files/mysql-yum/mysql56-community-el7/mysql-community-devel-${MYSQL_VERSION56}.el7.x86_64.rpm
		yum -y install ${mpcdn_3827}/files/mysql-yum/mysql56-community-el7/mysql-community-client-${MYSQL_VERSION56}.el7.x86_64.rpm
		wget ${mpcdn_3827}/files/mysql-yum/mysql56-community-el7/mysql-community-server-${MYSQL_VERSION56}.el7.x86_64.rpm.00
		wget ${mpcdn_3827}/files/mysql-yum/mysql56-community-el7/mysql-community-server-${MYSQL_VERSION56}.el7.x86_64.rpm.01
		cat mysql-community-server-${MYSQL_VERSION56}.el7.x86_64.rpm.* >mysql-community-server-${MYSQL_VERSION56}.el7.x86_64.rpm 
		yum -y install mysql-community-server-${MYSQL_VERSION56}.el7.x86_64.rpm	
	elif [ "$mysql_ver" = "7" ]; then
		yum -y install ${mpcdn_3828}/files/mysql-yum/mysql57-community-el7/mysql-community-common-${MYSQL_VERSION57}.el7.x86_64.rpm
		yum -y install ${mpcdn_3828}/files/mysql-yum/mysql57-community-el7/mysql-community-libs-${MYSQL_VERSION57}.el7.x86_64.rpm
		yum -y install ${mpcdn_3828}/files/mysql-yum/mysql57-community-el7/mysql-community-devel-${MYSQL_VERSION57}.el7.x86_64.rpm
		yum -y install ${mpcdn_3828}/files/mysql-yum/mysql57-community-el7/mysql-community-client-${MYSQL_VERSION57}.el7.x86_64.rpm
		wget ${mpcdn_3828}/files/mysql-yum/mysql57-community-el7/mysql-community-server-${MYSQL_VERSION57}.el7.x86_64.rpm.00
		wget ${mpcdn_3828}/files/mysql-yum/mysql57-community-el7/mysql-community-server-${MYSQL_VERSION57}.el7.x86_64.rpm.01
		wget ${mpcdn_3828}/files/mysql-yum/mysql57-community-el7/mysql-community-server-${MYSQL_VERSION57}.el7.x86_64.rpm.02
		wget ${mpcdn_3828}/files/mysql-yum/mysql57-community-el7/mysql-community-server-${MYSQL_VERSION57}.el7.x86_64.rpm.03
		cat mysql-community-server-${MYSQL_VERSION57}.el7.x86_64.rpm.* >mysql-community-server-${MYSQL_VERSION57}.el7.x86_64.rpm 
		yum -y install mysql-community-server-${MYSQL_VERSION57}.el7.x86_64.rpm
	fi
else
	yum -y install mysql mysql-common mysql-libs mysql-devel mysql-server
fi;

if [ "$release" != "6" ] && [ `grep -c "LimitNOFILE=infinity" /usr/lib/systemd/system/mysqld.service` -eq '0' ];then
	echo "LimitNOFILE=infinity" >> /usr/lib/systemd/system/mysqld.service
	systemctl daemon-reload
fi;
chkconfig --level 2345 mysqld on

if [ "$mysql_ver" = "8" ]; then
	wget -q ${mpcdn_2220}/opt/kangle10/conf/mysql8.0/my-01.cnf -O /etc/my.cnf
	if [ "$release" = "8" ]; then
		mkdir /home/mysql
		chown -R mysql:mysql /home/mysql
	fi
elif [ "$mysql_ver" = "7" ]; then
	wget -q ${mpcdn_2220}/opt/kangle10/conf/mysql5.7/my-01.cnf -O /etc/my.cnf
else
	wget -q ${mpcdn_2220}/opt/kangle10/conf/mysql5.6/my-01.cnf -O /etc/my.cnf
fi

rm -f /home/mysql/ibdata1
rm -f /home/mysql/ibtmp1
rm -f /home/mysql/ib_logfile0
rm -f /home/mysql/ib_logfile1
service mysqld restart
#重置MySQL密码
wget -q ${mpcdn_2220}/opt/kangle10/script/mysql_password.sh -O mysql_password.sh;sh mysql_password.sh $mysql_root_password
