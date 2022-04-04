#!/bin/bash

#Configure workdir
dir00="/usr/local/runner"
dir01="/usr/local/runner/tgrp-pts"
dir02="/usr/local/runner/tgrp-ver"
dir03="/usr/local/runner/tgrp-tmp"
dir04="/usr/local/runner/tgrp-log"

source $dir02/RUNNER_data
source $dir02/qiangidc_install_url
source $dir02/qiangidc_install_ver

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
	wget $DOWN_URL -O $WGET_NEW_NAME -c

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
