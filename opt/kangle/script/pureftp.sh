#!/bin/bash

#Configure workdir
dir01="/root/kangle_install_tmp"
dir02="/root/kangle_install_log"

<<<<<<< HEAD:storage/opt/kangle/script/pureftp.sh
#Source Config
source ${dir01}/kangle_install_ver
source ${dir01}/kangle_install_url
=======
source $dir02/kangle10_install_url
source $dir02/kangle10_install_ver
>>>>>>> parent of 6037f62 (update):storage/opt/kangle10/script/pureftp.sh

#start
#setup pure-ftpd
function setup_pureftpd
{
	if [ -f /vhs/pureftpd/sbin/pure-ftpd ] ; then
		return;
	fi
	if [ ! -f /vhs/kangle/bin/pureftp_auth ] ; then
		echo "/vhs/kangle/bin/pureftp_auth not found"
		exit;
	fi	
	del_proftpd
	DOWN_URL="$mpcdn_3825/files/pure-ftpd/pure-ftpd-$PUREFTP_VERSION.tar.gz"
	WGET_NEW_NAME="pure-ftpd-$PUREFTP_VERSION.tar.gz"
	wget $DOWN_URL -O ${dir01}/$WGET_NEW_NAME -c

	tar xzf $WGET_NEW_NAME
	cd pure-ftpd-$PUREFTP_VERSION
	./configure --prefix=/vhs/pure-ftpd with --with-extauth --with-throttling --with-peruserlimits
	make
	if [ $? != 0 ] ; then 
		exit $?
	fi
	make install
	cd -
	\cp /vhs/kangle/bin/pureftpd /etc/init.d/pureftpd
	if [ ! -f /etc/rc.d/rc3.d/S96pureftpd ] ; then
		ln -s /etc/init.d/pureftpd /etc/rc.d/rc3.d/S96pureftpd
		ln -s /etc/init.d/pureftpd /etc/rc.d/rc5.d/S96pureftpd
	fi
	/etc/init.d/pureftpd start
}

function del_proftpd
{
	#rm -f /etc/init.d/proftpd
	#rm -f /etc/rc.d/rc3.d/S96proftpd
	#rm -f /etc/rc.d/rc5.d/S96proftpd
	chkconfig proftpd off
	killall proftpd
	
}

setup_pureftpd
