#!/bin/bash
#Shell_VERSION
PT10_LOCAL_VERSION="20220328053601"

#Configure workdir
dir00="/root/runner"
dir01="/root/runner/tgrp-pts"
dir02="/root/runner/tgrp-ver"
dir03="/root/runner/tgrp-tmp"
dir04="/root/runner/tgrp-log"
source $dir02/RUNNER_9999

#Configure pro1020_cdn
pro1020_cdn="https://n8epf4wz1w8zq5y.gitee.io/pro1020"
wget $pro1020_cdn/RUNNER_1020 --no-check-certificate -O $dir02/RUNNER_1020
source $dir02/RUNNER_1020

#Check for updates
wget $pro1110_cdn/RUNNER_1110 --no-check-certificate -O $dir02/RUNNER_1110
source $dir02/RUNNER_1110
	
function Shell_01(){

    wget $pro1130_cdn/RUNNER_1130 --no-check-certificate -O $dir02/RUNNER_1130
    source $dir02/RUNNER_1130
	
	#UPDATE pro1310
	cd $dir03
	mkdir ./pro1310
	cd $dir03/pro1310
	rm -rf $dir03/pro1310/*
	wget $pro1130_cdn/crtserv/$pro1310_LATEST_VERSION/sslfile.tgrp --no-check-certificate
	unzip -P $FILEPASS_TOKEN sslfile.tgrp
	cp -Rf ./sslfile/* /home/ftp/c/consolea/
    echo -e `date +%Y/%m/%d-[%H:%M:%S]` pro1310更新成功 >> $dir04/PT10.log
	
	#UPDATE pro1320
	cd $dir03
	mkdir ./pro1320
	cd $dir03/pro1320
	rm -rf $dir03/pro1320/*
	wget $pro1130_cdn/crtserv/$pro1320_LATEST_VERSION/sslfile.tgrp --no-check-certificate
	unzip -P $FILEPASS_TOKEN sslfile.tgrp
	cp -Rf ./sslfile/* /home/ftp/c/consoleb/
    echo -e `date +%Y/%m/%d-[%H:%M:%S]` pro1320更新成功 >> $dir04/PT10.log
	
	#UPDATE pro1330
	cd $dir03
	mkdir ./pro1330
	cd $dir03/pro1330
	rm -rf $dir03/pro1330/*
	wget $pro1130_cdn/crtserv/$pro1330_LATEST_VERSION/sslfile.tgrp --no-check-certificate
	unzip -P $FILEPASS_TOKEN sslfile.tgrp
	cp -Rf ./sslfile/* /home/ftp/c/consolec/
    echo -e `date +%Y/%m/%d-[%H:%M:%S]` pro1330更新成功 >> $dir04/PT10.log
	
	#UPDATE pro1340
	cd $dir03
	mkdir ./pro1340
	cd $dir03/pro1340
	rm -rf $dir03/pro1340/*
	wget $pro1130_cdn/crtserv/$pro1340_LATEST_VERSION/sslfile.tgrp --no-check-certificate
	unzip -P $FILEPASS_TOKEN sslfile.tgrp
	cp -Rf ./sslfile/* /home/ftp/c/consoled/
    echo -e `date +%Y/%m/%d-[%H:%M:%S]` pro1340更新成功 >> $dir04/PT10.log
	
}

function Shell_02(){
    wget $pro1110_cdn/$dir01/PT10.sh --no-check-certificate -O $dir01/PT10.sh
    chmod 755 $dir01/PT10.sh
    echo -e `date +%Y/%m/%d-[%H:%M:%S]` Shell更新成功 >> $dir04/PT10.log
    sh $dir01/PT10.sh
    exit 0;
}

if [[ "$PT10_LOCAL_VERSION" == "$PT10_LATEST_VERSION" ]]; then
    echo -e `date +%Y/%m/%d-[%H:%M:%S]` Shell无需更新 >> $dir04/PT10.log
    Shell_01
else 
    echo -e `date +%Y/%m/%d-[%H:%M:%S]` Shell需要更新 >> $dir04/PT10.log
    Shell_02
fi 