#!/usr/bin/env bash

if [[ "$1" == "" ]]; then
	echo ./`basename "$0"` file.apk
	exit 1
fi

APKPATH=$1
APKFILE=$(basename -- "$APKPATH")
APPNAME="${APKFILE%.*}"

# apktool
apktool -f d $APKPATH -o 10_apktool-output/$APPNAME.out

# jadx
#jadx $APKPATH -d 11_jadx-output/$APPNAME.out

# extract certinfo
keytool -printcert -file 10_apktool-output/$APPNAME.out/original/META-INF/*.RSA > $APPNAME.certinfo.txt

