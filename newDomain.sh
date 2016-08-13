#!/bin/bash

if [ "$1" = "" ]; then
	echo "Domain should not be empty."
	echo "Usage: $0 <Domain>"
	exit
fi

. config.sh

if [ -d cert/$1 ]; then
	echo "Domain is already exist."
	cd cert/$1
else
	mkdir cert/$1
	cd cert/$1
	openssl genrsa 2048 > .key
	echo "Private Key is generated."
fi

date=`date +%Y%m%d`

if [ ! -f ${date}.csr.pem ]; then
	openssl req -new -key .key -out ${date}.csr.pem -subj "/C=${YOUR_COUNTRY_NAME}/ST=${YOUR_STATE_OR_PROVINCE_NAME}/L=${YOUR_LOCALITY}/O=${YOUR_ORGANIZATION}/OU=${YOUR_ORGANIZATION_UNIT}/CN=${1}/emailAddress=${YOUR_EMAIL}"
	echo "Certificate Signing Request is generated."
	echo
else
	echo "Certificate Signing Request is already exist."
	echo
fi
echo "Go to http://www.freessl.su/ to get the new cert (Apache/ModSSL)"
echo
cat ${date}.csr.pem
