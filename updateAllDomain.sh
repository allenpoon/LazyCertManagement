#!/bin/bash

date=`date +%Y%m%d`

ALL_CERT=$(ls cert)
CUR_DIR=$(pwd)


for CN in ${ALL_CERT[@]}; do
	cd $CUR_DIR/cert/$CN
	if [ ! -f ${date}.csr.pem ]; then
		openssl req -new -key .key -out ${date}.csr.pem -subj "/C=HK/ST=Hong Kong/L=Hong Kong/O=Home/OU=Home/CN=${CN}/emailAddress=a1b2c3d42003hongkong@hotmail.com"
	fi
	echo CN=$CN
	cat ${date}.csr.pem
	echo
done

echo "Go to http://www.freessl.su/ to get the new cert (Apache/ModSSL)"
