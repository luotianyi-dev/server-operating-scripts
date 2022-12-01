#!/bin/bash
username=$1
password=$(uuidgen)

if [ "$1" = "" ]; then
        echo "usage: $0 <username>"
        exit 2
fi

mysql -e "CREATE USER '$username' IDENTIFIED WITH caching_sha2_password BY '$password';"
mysql -e "CREATE DATABASE $username;"
mysql -e "GRANT ALL PRIVILEGES ON $username.* TO $username WITH GRANT OPTION;"
mysql -e "flush privileges;";
mysql -e "select Host, User, plugin from mysql.user;"

echo "Username: $username"
echo "Password: $password"
