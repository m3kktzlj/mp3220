#!/bin/bash

#Configure workdir
dir01="/root/kangle_install_tmp"
dir02="/root/kangle_install_log"

<<<<<<< HEAD:storage/opt/kangle/script/php_compile.sh
#Source Config
source ${dir01}/kangle_install_ver
source ${dir01}/kangle_install_url
=======
source $dir02/kangle10_install_url
source $dir02/kangle10_install_ver
>>>>>>> parent of 6037f62 (update):storage/opt/kangle10/script/php_compile.sh

#start
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH

release=`cat /etc/*release /etc/*version 2>/dev/null | grep -Eo '([0-9]{1,2}\.){1,3}' | cut -d '.' -f1 | head -1`;
Cpunum=`cat /proc/cpuinfo | grep 'processor' | wc -l`;
if [ -z "${Cpunum}" ]; then
	Cpunum="1"
fi
ZEND_ARCH="i386"
if test `arch` = "x86_64"; then
	ZEND_ARCH="x86_64"
fi

PHP_VER=$1
PHP_VER_D=""
force_install=$2
php_version=$3
if [ "$php_version" = "" ]; then
	php_version=$(eval echo '$'{PHP${PHP_VER}})
fi
PREFIX="/vhs/kangle/ext/php${PHP_VER}"
file="php-${php_version}.tar.bz2"

case "$PHP_VER" in
'52')PHP_VER_D="5.2";;
'53')PHP_VER_D="5.3";;
'54')PHP_VER_D="5.4";;
'55')PHP_VER_D="5.5";;
'56')PHP_VER_D="5.6";;
'70')PHP_VER_D="7.0";;
'71')PHP_VER_D="7.1";;
'72')PHP_VER_D="7.2";;
'73')PHP_VER_D="7.3";;
'74')PHP_VER_D="7.4";;
'80')PHP_VER_D="8.0";;
'81')PHP_VER_D="8.1";;
*)echo "Unknown PHP Version!";exit 1;;
esac

if [ "$release" = "6" ]; then
	if [ "${PHP_VER}" = "74" ] || [ "${PHP_VER}" = "80" ] || [ "${PHP_VER}" = "81" ]; then
		echo "你的操作系统CentOS ${release} 不支持安装 PHP-${PHP_VER_D}，已跳过" && exit 1;
	fi
fi

with_openssl='--with-openssl';
with_curl='--with-curl';

function Install_curl()
{
if ! openssl version | grep -i "openssl 1.0"; then
	if [ ! -f /usr/local/openssl-1.0.2u/bin/openssl ]; then
<<<<<<< HEAD:storage/opt/kangle/script/php_compile.sh
		wget ${mpcdn_3821}/files/completed/openssl-1.0.2u.tar.gz -O ${dir01}/openssl-1.0.2u.tar.gz;
=======
		wget $mpcdn_3821/files/completed/openssl-1.0.2u.tar.gz -O openssl-1.0.2u.tar.gz;
>>>>>>> parent of 6037f62 (update):storage/opt/kangle10/script/php_compile.sh
		tar -zxvf openssl-1.0.2u.tar.gz;
		cd openssl-1.0.2u;
		./config -fPIC --prefix=/usr/local/openssl-1.0.2u --openssldir=/usr/local/openssl-1.0.2u;
		make && make install;
		cd ..
	fi;
	with_openssl='--with-openssl=/usr/local/openssl-1.0.2u';
	if [ ! -f /usr/local/curl-7.61.1/bin/curl ]; then
<<<<<<< HEAD:storage/opt/kangle/script/php_compile.sh
		wget ${mpcdn_3821}/files/completed/curl-7.61.1.tar.bz2 -O ${dir01}/curl-7.61.1.tar.bz2;
=======
		wget $mpcdn_3821/files/completed/curl-7.61.1.tar.bz2 -O curl-7.61.1.tar.bz2;
>>>>>>> parent of 6037f62 (update):storage/opt/kangle10/script/php_compile.sh
		tar -xvf curl-7.61.1.tar.bz2;
		cd curl-7.61.1;
		./configure --prefix=/usr/local/curl-7.61.1 --with-ssl=/usr/local/openssl-1.0.2u --enable-ldap --enable-ldaps;
		make && make install;
		cd ..
	fi;
	with_curl='--with-curl=/usr/local/curl-7.61.1';
fi;
}

function Install_libzip()
{
if [ "$release" = "8" ]; then
	yum -y install libzip libzip-devel
else
	if [ ! -d /usr/local/lib/pkgconfig ]; then
		yum -y remove libzip libzip-devel
<<<<<<< HEAD:storage/opt/kangle/script/php_compile.sh
		wget --no-check-certificate -O ${dir01}/libzip-1.3.2.tar.gz ${mpcdn_3821}/files/completed/libzip-1.3.2.tar.gz
=======
		wget --no-check-certificate -O libzip-1.3.2.tar.gz $mpcdn_3821/files/completed/libzip-1.3.2.tar.gz
>>>>>>> parent of 6037f62 (update):storage/opt/kangle10/script/php_compile.sh
		tar xvf libzip-1.3.2.tar.gz
		cd libzip-1.3.2
		./configure
		make
		make install
		ln -s /usr/local/lib/libzip.so.5 /usr/lib64/libzip.so.5
		ln -s /usr/local/lib/libzip.so /usr/lib64/libzip.so
		cd ..
	fi
fi
}

function Install_oniguruma()
{
	yum -y install oniguruma oniguruma-devel;
}

function Download_file()
{
<<<<<<< HEAD:storage/opt/kangle/script/php_compile.sh
	wget ${mpcdn_3831}/files/php/compile/php-${php_version}.tar.bz2 -O ${dir01}/php-${php_version}.tar.bz2
=======
	wget $mpcdn_3831/files/php/compile/php-${php_version}.tar.bz2 -O php-${php_version}.tar.bz2
>>>>>>> parent of 6037f62 (update):storage/opt/kangle10/script/php_compile.sh
	tar xjf php-${php_version}.tar.bz2
	if [ "${PHP_VER}" == "52" ];then
		yum -y install patch
		cd php-${php_version}
<<<<<<< HEAD:storage/opt/kangle/script/php_compile.sh
		wget ${mpcdn_2220}/opt/kangle/conf/php/php5.3patch -O ${dir01}/php5.3patch
=======
		wget $runner_url/opt/kangle10/conf/php/php5.3patch -O php5.3patch
>>>>>>> parent of 6037f62 (update):storage/opt/kangle10/script/php_compile.sh
		patch -p1 < ./php5.3patch
		cd ..
	elif [ "${PHP_VER}" == "53" ];then
		yum -y install patch
		cd php-${php_version}
		patch -p1 < ./php5.2patch
		cd ..
	fi
}

function Install_PHP()
{
	if [ "${PHP_VER}" -le "56" ];then
		Install_curl
	fi
	if [ "${PHP_VER}" -ge "73" ];then
		Install_libzip
		if [ "${PHP_VER}" -ge "74" ];then
			if [ "$release" != "8" ];then
				export PKG_CONFIG_PATH="/usr/local/lib/pkgconfig";
			fi
			Install_oniguruma
		fi
	fi
	cd php-${php_version}
	if [ "${PHP_VER}" == "53" ]; then
		./configure --prefix=$PREFIX --with-mysql=mysqlnd --with-mysqli=mysqlnd --with-pdo-mysql=mysqlnd --with-iconv-dir --with-freetype-dir --with-jpeg-dir --with-png-dir --with-zlib --with-libxml-dir=/usr/include/libxml2/libxml --enable-xml --enable-bcmath --enable-inline-optimization ${with_curl} --enable-mbregex --enable-mbstring --with-mcrypt --enable-ftp --with-gd --enable-gd-native-ttf ${with_openssl} --enable-sockets --with-xmlrpc --enable-zip --enable-soap --with-pear --with-gettext --enable-calendar
	elif [ "${PHP_VER}" == "54" ]; then
		./configure --prefix=$PREFIX --with-mysql=mysqlnd --with-mysqli=mysqlnd --with-pdo-mysql=mysqlnd --with-iconv-dir --with-freetype-dir --with-jpeg-dir --with-png-dir --with-zlib --with-libxml-dir=/usr/include/libxml2/libxml --enable-xml --enable-bcmath --enable-inline-optimization ${with_curl} --enable-mbregex --enable-mbstring --with-mcrypt --enable-ftp --with-gd --enable-gd-native-ttf ${with_openssl} --enable-sockets --with-xmlrpc --enable-zip --enable-soap --with-pear --with-gettext --enable-calendar --enable-intl
	elif [ "${PHP_VER}" == "55" ] || [ "${PHP_VER}" == "56" ]; then
		./configure --prefix=$PREFIX --with-mysql=mysqlnd --with-mysqli=mysqlnd --with-pdo-mysql=mysqlnd --with-iconv-dir --with-freetype-dir --with-jpeg-dir --with-png-dir --with-zlib --with-libxml-dir=/usr/include/libxml2/libxml --enable-xml --enable-bcmath --enable-inline-optimization ${with_curl} --enable-mbregex --enable-mbstring --with-mcrypt --enable-ftp --with-gd --enable-gd-native-ttf ${with_openssl} --enable-sockets --with-xmlrpc --enable-zip --enable-soap --with-pear --with-gettext --enable-calendar --enable-opcache --enable-intl
	elif [ "${PHP_VER}" == "70" ] || [ "${PHP_VER}" == "71" ]; then
		./configure --prefix=$PREFIX --enable-mysqlnd --with-mysqli=mysqlnd --with-pdo-mysql=mysqlnd --with-iconv-dir --with-freetype-dir --with-jpeg-dir --with-png-dir --with-webp-dir --with-zlib --with-libxml-dir=/usr/include/libxml2/libxml --enable-xml --enable-bcmath --enable-inline-optimization --with-curl --enable-mbregex --enable-mbstring --with-mcrypt --enable-ftp --with-gd --enable-gd-native-ttf --with-openssl --enable-sockets --with-xmlrpc --enable-zip --enable-soap --with-pear --with-gettext --enable-calendar --with-mhash --enable-opcache --enable-intl
	elif [ "${PHP_VER}" == "72" ] || [ "${PHP_VER}" == "73" ]; then
		./configure --prefix=$PREFIX --enable-mysqlnd --with-mysqli=mysqlnd --with-pdo-mysql=mysqlnd --with-iconv-dir --with-freetype-dir --with-jpeg-dir --with-png-dir --with-webp-dir --with-zlib --with-libxml-dir=/usr/include/libxml2/libxml --enable-xml --enable-bcmath --enable-inline-optimization --with-curl --enable-mbregex --enable-mbstring --enable-ftp --with-gd --with-openssl --enable-sockets --with-xmlrpc --enable-zip --enable-soap --with-pear --with-gettext --enable-calendar --with-mhash --enable-opcache --enable-intl
	elif [ "${PHP_VER}" == "74" ];then
		./configure --prefix=$PREFIX --enable-mysqlnd --with-mysqli=mysqlnd --with-pdo-mysql=mysqlnd --with-iconv --with-freetype --with-jpeg --with-webp --with-zlib --with-libxml --enable-xml --enable-bcmath --enable-inline-optimization --with-curl --enable-mbregex --enable-mbstring --enable-ftp --enable-gd --with-openssl --enable-sockets --with-xmlrpc --with-zip --enable-soap --with-pear --with-gettext --enable-calendar --with-mhash --enable-opcache --enable-intl --with-sodium
	elif [ "${PHP_VER}" == "80" ];then
		./configure --prefix=$PREFIX --enable-mysqlnd --with-mysqli=mysqlnd --with-pdo-mysql=mysqlnd --with-iconv --with-freetype --with-jpeg --with-webp --with-zlib --with-libxml --enable-xml --enable-bcmath --with-curl --enable-mbregex --enable-mbstring --enable-ftp --enable-gd --with-openssl --enable-sockets --with-zip --enable-soap --with-pear --with-gettext --enable-calendar --with-mhash --enable-opcache --enable-intl --with-sodium
	elif [ "${PHP_VER}" == "81" ];then
		./configure --prefix=$PREFIX --enable-mysqlnd --with-mysqli=mysqlnd --with-pdo-mysql=mysqlnd --with-iconv --with-freetype --with-jpeg --with-webp --with-zlib --with-libxml --enable-xml --enable-bcmath --with-curl --enable-mbregex --enable-mbstring --enable-ftp --enable-gd --with-openssl --enable-sockets --with-zip --enable-soap --with-pear --with-gettext --enable-calendar --with-mhash --enable-opcache --enable-intl --with-sodium
	fi
	if test $? != 0; then
		echo -e "————————————————————————————————————————————————————
已检测您的系统安装PHP-${php_version}失败！
————————————————————————————————————————————————————";
	exit 1
	fi
	make -j $Cpunum
	make install

<<<<<<< HEAD:storage/opt/kangle/script/php_compile.sh
	wget -q ${mpcdn_2220}/opt/kangle/conf/php/php${PHP_VER}.xml -O ${dir01}/$PREFIX/config.xml
	wget -q ${mpcdn_2220}/opt/kangle/conf/php/php${PHP_VER}.ini -O ${dir01}/$PREFIX/php-templete.ini
	if [ "${PHP_VER}" == "56" ];then
		wget ${mpcdn_2220}/opt/kangle/conf/php/php-node.ini -O ${dir01}/$PREFIX/etc/php-node.ini
=======
	wget -q $runner_url/opt/kangle10/conf/php/php${PHP_VER}.xml -O $PREFIX/config.xml
	wget -q $runner_url/opt/kangle10/conf/php/php${PHP_VER}.ini -O $PREFIX/php-templete.ini
	if [ "${PHP_VER}" == "56" ];then
		wget $runner_url/opt/kangle10/conf/php/php-node.ini -O $PREFIX/etc/php-node.ini
>>>>>>> parent of 6037f62 (update):storage/opt/kangle10/script/php_compile.sh
	fi
}

function Install_zend()
{
	if [ "${PHP_VER}" == "52" ];then
		zip_file="ZendOptimizer-3.3.9-${ZEND_ARCH}.zip";
		o_file="ZendOptimizer.so";
	else
		zip_file="ZendGuardLoader-${ZEND_ARCH}-${PHP_VER_D}.zip";
		o_file="ZendGuardLoader.so";
	fi
<<<<<<< HEAD:storage/opt/kangle/script/php_compile.sh
	wget ${mpcdn_3821}/files/Zend/${zip_file} -O ${dir01}/${zip_file}
	unzip -O ${dir01}/${zip_file}
=======
	wget $mpcdn_3821/files/Zend/${zip_file} -O ${zip_file}
	unzip -o ${zip_file}
>>>>>>> parent of 6037f62 (update):storage/opt/kangle10/script/php_compile.sh
	mkdir -p $PREFIX/zend
	rm -f $PREFIX/zend/${o_file}
	mv -f ${o_file} $PREFIX/zend/${o_file}
}

function Install_sourceguardian()
{
	zip_file="ixed-${ZEND_ARCH}-${PHP_VER_D}.zip"
	o_file="ixed.${PHP_VER_D}.lin"
<<<<<<< HEAD:storage/opt/kangle/script/php_compile.sh
	wget ${mpcdn_3821}/files/ixed/${zip_file} -O ${dir01}/${zip_file}
=======
	wget $mpcdn_3821/files/ixed/${zip_file} -O ${zip_file}
>>>>>>> parent of 6037f62 (update):storage/opt/kangle10/script/php_compile.sh
	unzip ${zip_file}
	mkdir -p $PREFIX/ixed
	rm -f $PREFIX/ixed/${o_file}
	mv -f ${o_file} $PREFIX/ixed/${o_file}
}

function Install_ioncube()
{
	zip_file="ioncube-${ZEND_ARCH}-${PHP_VER_D}.zip"
	o_file="ioncube_loader_lin_${PHP_VER_D}.so"
<<<<<<< HEAD:storage/opt/kangle/script/php_compile.sh
	wget ${mpcdn_3821}/files/ioncube/${zip_file} -O ${dir01}/${zip_file}
=======
	wget $mpcdn_3821/files/ioncube/${zip_file} -O ${zip_file}
>>>>>>> parent of 6037f62 (update):storage/opt/kangle10/script/php_compile.sh
	unzip ${zip_file}
	mkdir -p $PREFIX/ioncube
	rm -f $PREFIX/ioncube/${o_file}
	mv -f ${o_file} $PREFIX/ioncube/${o_file}
}


php_v=`"$PREFIX"/bin/php -v |grep "$php_version" -o`
if [ "$php_version" = "$php_v" ]&&[ "$force_install" != "force"  ];
then {
clear
echo -e "————————————————————————————————————————————————————
检测到您已安装了 PHP-"$php_v" 
不需要重复编译安装
————————————————————————————————————————————————————"
exit 1
}
else
{

Download_file
Install_PHP
if [ "${PHP_VER}" -le "56" ];then
	Install_zend
fi
if [ "${PHP_VER}" -le "74" ];then
	Install_ioncube
fi
if [ "${PHP_VER}" -le "80" ];then
	Install_sourceguardian
fi

/vhs/kangle/bin/kangle -q
rm -rf /tmp/*
/vhs/kangle/bin/kangle
cd ..
echo -e "————————————————————————————————————————————————————
已检测您的系统成功安装PHP-${php_version}，感谢您的使用！
————————————————————————————————————————————————————"
exit 0
}
fi
