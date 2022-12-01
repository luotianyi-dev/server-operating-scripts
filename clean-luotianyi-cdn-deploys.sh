#!/bin/bash

prefix=/home/edge-

echo "Hostname:" $(hostname)
read -p "Are you sure to delete [$prefix*] ? [y/n] " confirm
if [ "$confirm" != "y" ]; then
	echo "Abort."
	exit 1
fi

color_normal="\e[0m"
prefix_len=$(echo $prefix | wc -c)

for homepath in $prefix*; do
	account=$(echo $homepath | cut -c$prefix_len-)
	username=edge-$account
	echo -e "Handling account \e[01;36m$account ($homepath)$color_normal..."
	current_deploy=$(basename $(readlink -f $homepath/www))
	echo -e "Current deploy is \e[01;32m$current_deploy$color_normal"
	for deploy in $homepath/deploys/*; do
		deploy_hash=$(basename $deploy)
		echo -n " -> Found $deploy_hash"
		if [ "$deploy_hash" = "$current_deploy" ]; then
			echo -e "\e[01;32m [keep]$color_normal"
		else
			echo -e "\e[01;31m [delete]$color_normal"
			rm -rf $homepath/deploys/$deploy_hash
		fi
	done
done
