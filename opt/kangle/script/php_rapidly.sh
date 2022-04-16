#!/bin/bash

#Configure workdir
dir01="/root/kangle_install_tmp"
dir02="/root/kangle_install_log"

<<<<<<< HEAD:storage/opt/kangle/script/php_rapidly.sh
#Source Config
source ${dir01}/kangle_install_ver
source ${dir01}/kangle_install_url
=======
source $dir02/kangle10_install_url
source $dir02/kangle10_install_ver
>>>>>>> parent of 6037f62 (update):storage/opt/kangle10/script/php_rapidly.sh

#start
PREFIX="/vhs/kangle/ext/"
intallphpv=$1
force_install=$2
ARCH="x86"
if test `arch` = "x86_64"; then
	ARCH="x86_64"
fi
release=`cat /etc/*release /etc/*version 2>/dev/null | grep -Eo '([0-9]{1,2}\.){1,3}' | cut -d '.' -f1 | head -1`;

if [ "$intallphpv" = "php74" ] && [ "$release" = "6" ]; then
	echo "你的操作系统CentOS ${release} 不支持安装 PHP-7.4，已跳过" && exit 1;
fi
if [ "$intallphpv" = "php80" ] && [ "$release" = "6" ]; then
	echo "你的操作系统CentOS ${release} 不支持安装 PHP-8.0，已跳过" && exit 1;
fi
if [ "$intallphpv" = "php81" ] && [ "$release" = "6" ]; then
	echo "你的操作系统CentOS ${release} 不支持安装 PHP-8.1，已跳过" && exit 1;
fi

function install_libzip()
{
if [ "$release" = "8" ]; then
	if [ ! -f /usr/lib64/libzip.so ]; then
		yum -y install libzip libzip-devel
	fi
else
	if [ ! -d /usr/local/lib/pkgconfig ]; then
		yum -y remove libzip libzip-devel
<<<<<<< HEAD:storage/opt/kangle/script/php_rapidly.sh
		wget --no-check-certificate -O ${dir01}/libzip-1.3.2.tar.gz ${mpcdn_3821}/files/completed/libzip-1.3.2.tar.gz
=======
		wget --no-check-certificate -O libzip-1.3.2.tar.gz $mpcdn_3821/files/completed/libzip-1.3.2.tar.gz
>>>>>>> parent of 6037f62 (update):storage/opt/kangle10/script/php_rapidly.sh
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

function install_oniguruma()
{
	if [ ! -f /usr/include/oniguruma.h ]; then
		yum -y install oniguruma oniguruma-devel;
	fi
	yum -y install libsodium-devel libwebp-devel;
}

function install_libwebp()
{
	if [ ! -f /usr/lib64/libwebp.so ]; then
		yum -y install libwebp-devel;
	fi
}

function install_libicu()
{
	if [ ! -f /usr/lib64/libicudata.so ]; then
		yum -y install libicu-devel;
	fi
}

function install_curl()
{
if ! openssl version | grep -i "openssl 1.0"; then
	if [ ! -f /usr/local/openssl-1.0.2u/bin/openssl ]; then
<<<<<<< HEAD:storage/opt/kangle/script/php_rapidly.sh
		wget ${mpcdn_3821}/files/completed/openssl-1.0.2u.tar.gz -O ${dir01}/openssl-1.0.2u.tar.gz;
=======
		wget $mpcdn_3821/files/completed/openssl-1.0.2u.tar.gz -O openssl-1.0.2u.tar.gz;
>>>>>>> parent of 6037f62 (update):storage/opt/kangle10/script/php_rapidly.sh
		tar -zxvf openssl-1.0.2u.tar.gz;
		cd openssl-1.0.2u;
		./config -fPIC --prefix=/usr/local/openssl-1.0.2u --openssldir=/usr/local/openssl-1.0.2u;
		make && make install;
		cd ..
	fi;
	if [ ! -f /usr/local/curl-7.61.1/bin/curl ]; then
<<<<<<< HEAD:storage/opt/kangle/script/php_rapidly.sh
		wget ${mpcdn_3821}/files/completed/curl-7.61.1.tar.bz2 -O ${dir01}/curl-7.61.1.tar.bz2;
=======
		wget $mpcdn_3821/files/completed/curl-7.61.1.tar.bz2 -O curl-7.61.1.tar.bz2;
>>>>>>> parent of 6037f62 (update):storage/opt/kangle10/script/php_rapidly.sh
		tar -xvf curl-7.61.1.tar.bz2;
		cd curl-7.61.1;
		./configure --prefix=/usr/local/curl-7.61.1 --with-ssl=/usr/local/openssl-1.0.2u --enable-ldap --enable-ldaps;
		make && make install;
		cd ..
	fi;
fi;
}

if [ "$intallphpv" = "php52" ];then
	php_version="$PHP52"
	php_dir="tpl_php52"
    php_rapidly_ver="ver5"
    php_rapidly_url="$mpcdn_3841"
elif [ "$intallphpv" = "php53" ];then
	php_version="$PHP53"
	php_dir="php53"
    php_rapidly_ver="ver5"
    php_rapidly_url="$mpcdn_3841"
	install_curl
elif [ "$intallphpv" = "php54" ];then
	php_version="$PHP54"
	php_dir="php54"
    php_rapidly_ver="ver5"
    php_rapidly_url="$mpcdn_3841"
	install_libicu
elif [ "$intallphpv" = "php55" ];then
	php_version="$PHP55"
	php_dir="php55"
    php_rapidly_ver="ver5"
    php_rapidly_url="$mpcdn_3841"
elif [ "$intallphpv" = "php56" ];then
	php_version="$PHP56"
	php_dir="php56"
    php_rapidly_ver="ver5"
    php_rapidly_url="$mpcdn_3841"
	install_libicu
	install_curl
elif [ "$intallphpv" = "php70" ];then
	php_version="$PHP70"
	php_dir="php70"
    php_rapidly_ver="ver7"
    php_rapidly_url="$mpcdn_3842"
	install_libwebp
elif [ "$intallphpv" = "php71" ];then
	php_version="$PHP71"
	php_dir="php71"
    php_rapidly_ver="ver7"
    php_rapidly_url="$mpcdn_3842"
elif [ "$intallphpv" = "php72" ];then
	php_version="$PHP72"
	php_dir="php72"
    php_rapidly_ver="ver7"
    php_rapidly_url="$mpcdn_3842"
elif [ "$intallphpv" = "php73" ];then
	php_version="$PHP73"
	php_dir="php73"
    php_rapidly_ver="ver7"
    php_rapidly_url="$mpcdn_3842"
	install_libicu
	install_libzip
elif [ "$intallphpv" = "php74" ];then
	php_version="$PHP74"
	php_dir="php74"
    php_rapidly_ver="ver7"
    php_rapidly_url="$mpcdn_3842"
	install_libicu
	install_oniguruma
	install_libzip
elif [ "$intallphpv" = "php80" ];then
	php_version="$PHP80"
	php_dir="php80"
    php_rapidly_ver="ver8"
    php_rapidly_url="$mpcdn_3843"
	install_libicu
	install_oniguruma
	install_libzip
elif [ "$intallphpv" = "php81" ];then
	php_version="$PHP81"
	php_dir="php81"
    php_rapidly_ver="ver8"
    php_rapidly_url="$mpcdn_3843"
	install_libicu
	install_oniguruma
	install_libzip
else
	echo -e "————————————————————————————————————————————————————
未指定安装的PHP版本
————————————————————————————————————————————————————"
exit 1
fi

PREFIX="/vhs/kangle/ext/$php_dir"

phpv=""
if [ -f "${PREFIX}/bin/php" ]; then
	phpv=`"$PREFIX"/bin/php -v |grep "$php_version" -o`
fi

if [ "$php_version" = "$phpv" ]&&[ "$force_install" != "force" ]; then {
echo -e "————————————————————————————————————————————————————
检测到您已安装了 PHP-"$php_version" 
不需要重复再次安装
————————————————————————————————————————————————————"
exit 1
}
fi

file="php-${php_version}-${release}-${ARCH}.tar.bz2"
echo -e "正在下载$file"
wget -c $php_rapidly_url/files/php/rapidly/$php_rapidly_ver/$file -O ${dir01}/$file
echo -e "正在解压缩文件"
tar -xjf $file
/vhs/kangle/bin/kangle -q
echo -e "正在安装文件"
rm -rf $PREFIX
mv -f $php_dir /vhs/kangle/ext/
rm -f $file
rm -rf /tmp/*
/vhs/kangle/bin/kangle
echo -e "————————————————————————————————————————————————————
SUCCESS：已成功安装PHP-$php_version
————————————————————————————————————————————————————"
