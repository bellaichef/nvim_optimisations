#!/bin/bash

IFS_ORI=$IFS
IFS=$'\n'

requirements="OK"

productName=("g++" "GIT" "ripgrep" "NeoVim" "NodeJS" "Composer")
productInstall=("\$gInstall" "\$gitInstall" "\$rgInstall" "\$nvInstall" "\$nodeInstall" "\$composerInstall")
productsArLength=${#productName[@]}


##########################################
#    Still working but in update work    #
# should be finished in January the 15th #
#              Or may be later ;-)       #
##########################################

if [[ ! -f "/usr/bin/g++" ]];then
	gInstall="sudo apt install g++ -y" 
	requirements_status="/!\\ \033[1mg++ missing\033[0m (run $gInstall)"
	requirements="KO"
else
	requirements_status="g++ OK"
fi

if [[ ! -f "/usr/bin/git" ]];then
	gitInstall="sudo apt install git -y"
	requirements_status="$requirements_status\n/!\\ \033[1mripgrep missing\033[0m (https://github.com/BurntSushi/ripgrep/releases)"
	requirements="KO"
else
	requirements_status="GIT OK"
fi

if [[ ! -f "/usr/bin/rg" ]];then
	rgInstall="wget https://github.com/BurntSushi/ripgrep/releases/download/13.0.0/ripgrep_13.0.0_amd64.deb -P ./packages/ && sudo apt install ./packages/ripgrep_13.0.0_amd64.deb -y"
	requirements_status="$requirements_status\n/!\\ \033[1mripgrep missing\033[0m (https://github.com/BurntSushi/ripgrep/releases)"
	requirements="KO"
else
	requirements_status="ripgrep OK"
fi

if [[ $(nvim -v 2>&1 | grep "NVIM v" | cut -d'.' -f 2) -lt 8 || ! -f "/usr/bin/nvim" ]];then
	nvInstall="sudo add-apt-repository ppa:neovim-ppa/unstable && sudo apt update && sudo apt install neovim"
	requirements_status="$requirements_status\n/!\\ \033[1mNeoVim\033[0m wrong version or missing (https://launchpad.net/~neovim-ppa/+archive/ubuntu/unstable)"
	requirements="KO"
else
	requirements_status="$requirements_status\nNeoVim OK"
fi

if [[ $(node -v 2>&1 | cut -d'.' -f1 | tail -c 3) -lt 16 || ! -f "/usr/bin/node" || -f "/usr/bin/npm" ]];then
	if [[ $(cat /etc/issue | cut -d' ' -f2 | cut -d -f1) -lt 18 ]];then
		nodeInstall="curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash - && sudo apt install nodejs -y"
		requirements_status="$requirements_status\n/!\\ \033[1mNode\033[0m wrong version or missing (https://joshtronic.com/2021/05/09/how-to-install-nodejs-16-on-ubuntu-2004-lts/)"
	else
		nodeInstall="curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash - && sudo apt install nodejs -y"
		requirements_status="$requirements_status\n/!\\ \033[1mNode &/OR NPM\033[0m wrong version or missing (https://joshtronic.com/2022/04/24/how-to-install-nodejs-18-on-ubuntu-2004-lts/)"
	fi
	requirements="KO"
else
        requirements_status="$requirements_status\nNode & npm OK"
fi

if [[ $(php -v 2>&1 | head -n 1 | cut -d' ' -f2 | cut -d'.' -f1) -lt 8 || ! -f "/usr/bin/php" ]];then
	requirements_status="$requirements_status\n/!\\ \033[1mPHP\033[0m wrong version or missing https://linuxize.com/post/how-to-install-php-8-on-ubuntu-20-04/)"
        requirements="KO"
else
        requirements_status="$requirements_status\nPHP OK"
fi

if [[ ! -f "/usr/bin/composer" ]];then
	composerInstall="php -r \"copy('https://getcomposer.org/installer', 'composer-setup.php');\" && php -r \"if (hash_file('sha384', 'composer-setup.php') === '55ce33d7678c5a611085589f1f3ddf8b3c52d662cd01d4ba75c0ee0459970c2200a51f492d557530c71c15d8dba01eae') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;\" && php composer-setup.php && php -r \"unlink('composer-setup.php');\" && mv composer.phar /usr/bin/composer"
	requirements_status="$requirements_status\n/!\\ \033[1mcomposer\033[0m wrong version or missing (https://getcomposer.org/download/)"
        requirements="KO"
else
        requirements_status="$requirements_status\ncomposer OK"
fi

echo -e $requirements_status

if [[ $requirements == "OK" ]];then
	echo -n "You are meeting the minimum requirements, Do you want to go on the the intallation ?  [(Y)/n]"
	read -r runInstallation
else
	echo -e "/!\\ You are \033[1mNOT\033[0m meeting the minimum requirements, Do you want to go on with nvim_optimizations the the intallation anyway [y/(N)]? or Do you want get help with installation of missing elements [i,(N)]?" 
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

elif [[ $runInstallation == "I" || $runInstallation == "i" ]];then

###
# Part to be changed  
###

	if [[ $gInsatll != "" ]];then
		echo "Do you want to install or upgrade g++ [(Y)/n] ?"
		launchgplusplusInstall="Y"
		read -r launchgplusplusInstall
		if [[ $launchgplusplusInstall == "Y" || $launchgplusplusInstall == "y" ]]; then
			eval $gInsatll
		fi
	fi

	if [[ $gitInstall != "" ]];then
		echo "Do you want to install or upgrade GIT [(Y)/n] ?"
		launchGITInstall="Y"
		read -r launchGITInstall
		if [[ $launchGITInstall == "Y" || $launchGITInstall == "y" ]]; then
			eval $gitInstall
		fi
	fi

	if [[ $rgInstall != "" ]];then
		echo "Do you want to install or upgrade RipGrep [(Y)/n] ?"
		launchRGInstall="Y"
		read -r launchRGInstall
		if [[ $launchRGInstall == "Y" || $launchRGInstall == "y" ]]; then
			eval $rgInstall
		fi
	fi

	if [[ $nvInstall != "" ]];then
		echo "Do you want to install or upgrade NeoVim [(Y)/n ?"
		launchNeoVimInstall="Y"
		read -r launchNeoVimInstall
		if [[ $launchNeoVimInstall == "Y" || $launchNeoVimInstall == "y" ]]; then
			eval $nvInstall
		fi
	fi

	if [[ -z "$nodeInstall" ]];then
		echo "Do you want to install or upgrade NodeJS [(Y)/n] ?"
		launchNodeInstall="Y"
		read -r launchNodeInstall
		if [[ $launchNodeInstall == "Y" || $launchNodeInstall == "y" ]]; then
			eval $nodeInstall
		fi
	fi

	if [[ -z "$composerInstall" ]];then
		echo "Do you want to install or upgrade Composer [(Y)/n] ?"
		launchCompInstall="Y"
		read -r launchCompInstall
		if [[ $launchCompInstall == "Y" || $launchNeoVimInstall == "y" ]]; then
			eval $composerInstall
		fi
	fi

else
	echo "You answered with n/N or any other chars than Y/y, we consider this as a N. ;-) !"
	exit
fi

IFS=$IFS_ORI
