#!/bin/sh

rm -rfv /etc/php/php.ini
rm -rfv /etc/php/php-fpm.conf
rm -rfv /etc/nginx/nginx.conf

ln -sv /data/php.ini         /etc/php/php.ini
ln -sv /data/php-fpm.conf    /etc/php/php-fpm.conf
ln -sv /data/nginx.conf      /etc/nginx/nginx.conf

echo "======================================="
echo "Starting PHP-FPM + Nginx Docker Image"
echo "Testing nginx config..."
nginx -t
echo "Starting PHP-FPM"
php-fpm -R
echo "======================================="
ps -ef
echo "Starting Nginx"
nginx
echo "======================================="
echo "Stopped PHP-FPM + Nginx Docker Image"
echo "======================================="

