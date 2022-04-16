#!/bin/bash

#Configure workdir
dir01="/root/kangle_install_tmp"
dir02="/root/kangle_install_log"

<<<<<<< HEAD:storage/opt/kangle/script/cdnbest.sh
#Source Config
source ${dir01}/kangle_install_ver
source ${dir01}/kangle_install_url
=======
source $dir02/kangle10_install_url
source $dir02/kangle10_install_ver
>>>>>>> parent of 6037f62 (update):storage/opt/kangle10/script/cdnbest.sh

#start
PREFIX="/vhs/kangle"

OS="6"
if [ -f /usr/bin/systemctl ] ; then
        OS="7"
        if [ -f /usr/bin/dnf ] ; then
                OS="8"
        fi
fi
if test `arch` != "x86_64"; then
	echo "only support arch x86_64..."
	exit 1
fi
ARCH="$OS-x64"

#https://www.cdnbest.com/download/cdnbest/cdnbest-4.6.4-8-x64.tar.gz
<<<<<<< HEAD:storage/opt/kangle/script/cdnbest.sh
URL="${mpcdn_3824}/files/cdnbest/cdnbest-$CDNBEST_VERSION-$ARCH.tar.gz"
wget $URL -O ${dir01}/cdnbest.tar.gz
=======
URL="$mpcdn_3824/files/cdnbest/cdnbest-$CDNBEST_VERSION-$ARCH.tar.gz"
wget $URL -O cdnbest.tar.gz
>>>>>>> parent of 6037f62 (update):storage/opt/kangle10/script/cdnbest.sh
ret=$?
if [ $ret != 0 ] ; then
	echo "cann't download file"
	exit $ret
fi
tar xzf cdnbest.tar.gz
service cdnbest stop
cd cdnbest
\cp bin $PREFIX -a
\cp init/cdnbest /etc/init.d/
chmod 700 /etc/init.d/cdnbest
if [ ! -f /etc/rc3.d/S67cdnbest ] ;then
	ln -s /etc/init.d/cdnbest /etc/rc3.d/S67cdnbest
fi
if [ ! -f /etc/rc5.d/S67cdnbest ] ;then
	ln -s /etc/init.d/cdnbest /etc/rc5.d/S67cdnbest
fi
if [ -f /usr/bin/systemctl ] ; then
	/usr/bin/systemctl daemon-reload
fi
service cdnbest start

cd ..
if [ $? != 0 ] ; then
	echo "cdnbest-$CDNBEST_VERSION 安装失败！"
	exit $ret
else
	echo "cdnbest-$CDNBEST_VERSION 安装成功！"
fi
