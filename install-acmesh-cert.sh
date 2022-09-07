#!/bin/bash
domain=$1
ecc=$2

if [ "$domain" = "" ]; then
	echo "usage: $0 <domain>"
	exit 2
fi

if [ "$ecc" != "--ecc" ]; then
	ecc=""
fi

prefix=/etc/ssl/private/$domain

nginx -t && mkdir -p $prefix && ~/.acme.sh/acme.sh --home ~/.acme.sh --install-cert \
	-d "$domain" $ecc \
	--key-file        $prefix/key.pem \
	--fullchain-file  $prefix/fullchain.pem \
	--cert-file       $prefix/cert.pem \
	--ca-file         $prefix/ca.pem \
	--reloadcmd       "service nginx force-reload" \
