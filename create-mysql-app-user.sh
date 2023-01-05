#!/bin/bash
username=$1
password=$(uuidgen)
mysql_version="$(mysql -V | grep -i mariadb)"
auth_statement=""

if [ "$mysql_version" = "" ]; then
	echo "Server is MySQL"
	auth_statement="WITH caching_sha2_password"
else
	echo "Server is MariaDB"
fi

mysql -e "CREATE USER '$username' IDENTIFIED $auth_statement BY '$password';"
mysql -e "CREATE DATABASE $username;"
mysql -e "GRANT ALL PRIVILEGES ON $username.* TO $username WITH GRANT OPTION;"
mysql -e "flush privileges;";
mysql -e "select Host, User, plugin from mysql.user;"

echo "Username: $username"
echo "Password: $password"
