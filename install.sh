#!/bin/bash

IFS_ORI=$IFS
IFS=$'\n'

requirements="OK"

if [[ ! -f "/usr/bin/rg" ]];then
	requirements_status="ripgrep missing"
	requirements="KO"
else
	requirements_status="ripgrep OK"
fi

if [[ $(nvim -v 2>&1 | grep "NVIM v" | cut -d'.' -f 2) -lt 8 || ! -f "/usr/bin/nvim" ]];then
	requirements_status="$requirements_status\nNeoVim wrong version or missing (https://launchpad.net/~neovim-ppa/+archive/ubuntu/unstable)"
	requirements="KO"
else
	requirements_status="$requirements_status\nNeoVim OK"
fi

if [[ $(node -v 2>&1 | cut -d'.' -f1 | tail -c 3) -lt 18 || ! -f "/usr/bin/node" ]];then
	requirements_status="$requirements_status\nNode wrong version or missing (https://joshtronic.com/2022/04/24/how-to-install-nodejs-18-on-ubuntu-2004-lts/)"
        requirements="KO"
else
        requirements_status="$requirements_status\nNode OK"
fi

if [[ ! -f "/usr/bin/npm" ]];then
	requirements_status="$requirements_status\nnpm wrong version or missing (https://joshtronic.com/2022/04/24/how-to-install-nodejs-18-on-ubuntu-2004-lts/)"
        requirements="KO"
else
        requirements_status="$requirements_status\nnpm OK"
fi

if [[ $(php -v 2>&1 | head -n 1 | cut -d' ' -f2 | cut -d'.' -f1) -lt 8 || ! -f "/usr/bin/php" ]];then
	requirements_status="$requirements_status\nPHP wrong version or missing https://linuxize.com/post/how-to-install-php-8-on-ubuntu-20-04/)"
        requirements="KO"
else
        requirements_status="$requirements_status\nPHP OK"
fi

if [[ ! -f "/usr/bin/composer" ]];then
	requirements_status="$requirements_status\ncomposer wrong version or missing (https://getcomposer.org/download/)"
        requirements="KO"
else
        requirements_status="$requirements_status\ncomposer OK"
fi

echo -e $requirements_status

if [[ $requirements == "OK" ]];then
	echo -n "You are meeting the minimum requirements, Do you want to go on the the intallation ?  [(Y)/n]"
	read -r runInstallation
else
	echo -n "You are NOT meeting the minimum requirements, Do you want to go on nvim_optimizationsthe the intallation anyway?  [(Y)/n]"
	read -r runInstallation
fi

if [[ $runInstallation == "Y" || $runInstallation == "y" ]];then
	cd ~
	mkdir .config
	#mkdir -p .config/nvim/lua/core/plugin_config
	wget https://github.com/bellaichef/nvim_optimizations/archive/refs/heads/main.zip
	unzip main.zip && rm main.zip
	mv  nvim_optimizations-main/nvim .config/
	rm -r nvim_optimizations-main
	nvim
	nvim
  echo ""
  echo "---------------------------------------------------------------------------------------------------------
Done !!!!
---------------------------------------------------------------------------------------------------------"

else
	echo "You answered with n/N or any other chars than Y/y, we consider this as a N. ;-) !"
	exit
fi

IFS=$IFS_ORI
