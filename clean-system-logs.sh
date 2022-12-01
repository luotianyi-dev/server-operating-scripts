#!/bin/bash

journalctl --rotate
journalctl --vacuum-time=1s
rm -rf /var/log/nginx
mkdir -p /var/log/nginx
touch /var/log/nginx/access.log
touch /var/log/nginx/error.log

rm -rf /var/log/auth.log* /var/log/ufw.log* /var/log/dmesg*
> /var/log/auth.log
> /var/log/ufw.log
> /var/log/dmesg
> /var/log/faillog

