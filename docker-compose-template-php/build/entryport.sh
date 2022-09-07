#!/bin/sh

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

