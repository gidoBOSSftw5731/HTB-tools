#!/bin/bash
#change this to be whatever htb gave you
export destip=1.1.1.1:12345

wget --load-cookies /tmp/cookies $destip -O - -q --post-data $(
	echo hash=`
		wget --keep-session-cookies --save-cookies /tmp/cookies $destip -O - -q 2>/dev/null|
		grep post |
		perl -ne '/([\w\d]{20})/ && print "$1";' |
		md5sum -z |
		cut -c -32`
)
