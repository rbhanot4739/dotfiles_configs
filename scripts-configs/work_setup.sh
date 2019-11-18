#!/bin/bash

BLACK='\033[0;30m'
RED='\033[0;31m'
DARK_GRAY='\033[1;30m'
LIGHT_RED='\033[1;31m'
GREEN='\033[1;32m'
LIGHT_GREEN='\033[0;32m'
BROWN='\033[0;33m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
LIGHT_BLUE='\033[1;34m'
PURPLE='\033[0;35m'
LIGHT_PURPLE='\033[1;35m'
CYAN='\033[0;36m'
LIGHT_CYAN='\033[1;36m'
LIGHT_GRAY='\033[0;37m'
WHITE='\033[1;37m'
NC='\033[0m'
OS=`lsb_release -a 2>/dev/null | awk  '$1~"Dist" {print $3}'`

if [ $OS == "Ubuntu" ]
then
	cd ~/
    read -sp "Enter the github password (this will be needed for downloading dotfiles): " gpass; echo
    read -sp "Enter the sudo password: " password 


	echo -e "\n${YELLOW}..................... Updating the system with .....................${NC}\n"
	echo $password | sudo -S apt update -y && apt upgrade -y > /dev/null
	

	echo -e "\n${YELLOW}..................... Installing packages .....................${NC}\n"

	INSTALL_PACKAGES="build-essential python3-setuptools python3-wheel python3-pip make libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev llvm libncurses5-dev libncursesw5-dev xz-utils tk-dev libffi-dev liblzma-dev python-openssl libssl1.0-dev libedit2 libpq5 libssl1.0.0 postgresql-client-common postgresql-common tmux gnome-tweaks curl git zsh "

for pkg in $INSTALL_PACKAGES
do
 if [ `dpkg -l | cut -d " " -f 3 | egrep ^$pkg$ | wc -l` -ge 1   ]
			then
				echo -e "${GREEN}$pkg is already installed${NC}\n"
		else
			echo -e "\n${YELLOW}.....................  Installing $pkg.....................${NC}\n"
			echo $password |sudo -S apt install -y $pkg > /dev/null
		fi
	done


	echo -e "\n ${YELLOW}..................... Generating and uploading SSH Keys to GitHub .....................${NC}\n"
	ssh-keygen -q -t rsa -f ~/.ssh/id_rsa -N ''
	curl -u "rbhanot4739@gmail.com:$gpass" --data '{"title":"work-machine-key","key":"'"$(cat ~/.ssh/id_rsa.pub)"'"}' https://api.github.com/user/keys

	echo -e "\n ${YELLOW}..................... Cloning the github repo ...........${NC}\n"

 ssh-keyscan github.com >> ~/.ssh/known_hosts
	git clone git@github.com:rbhanot4739/dotfiles_configs.git ~/dotfiles_configs
	cd ~/dotfiles_configs
	git config user.email "rbhanot4739@gmail.com"
	git config user.name "Rohit Bhanot"
	cd ~/

	echo -e "\n${YELLOW}..................... Setting up Zsh ..............................${NC}\n"
	cd ~/
	wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh
	echo $password | sh install.sh > /dev/null
	cd ~/.oh-my-zsh/custom/plugins
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
	git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
	git clone https://github.com/zsh-users/zsh-completions ~/.oh-my-zsh/custom/plugins/zsh-completions
	git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search
	compaudit | xargs chmod g-w,o-w
	yes $password | chsh -s $(which zsh)
	mv .zshrc.pre-oh-my-zsh .zshrc

	cd ~/

    	echo -e "\n${YELLOW}..................... Setting up Fonts..............................${NC}\n"
	if [ ! -d ~/.fonts ]
	then
	mkdir ~/.fonts
	fi
	cd ~/.fonts
	wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.0.0/FiraCode.zip
	unzip FiraCode.zip
	fc-cache -f
	rm -f FiraCode.zip
	cd $HOME

	echo -e "\n${YELLOW}..................... Copying all the dot files from git repo ..............................${NC}\n"
	cd ~/dotfiles_configs/dot-files/
	for i in .ideavimrc .local_settings_rc .pythonrc .tmux.conf .tmux_linux.conf .zshrc .zshrc_home .zshrc_work dev-tmux
	do
	cp -av $i ~/.
	done
	cp -av ~/dotfiles_configs/dot-files/nvim ~/.config/
	cp -av ~/dotfiles_configs/dot-files/tmux/ ~/.tmux/
	cd ~/


	echo -e "\n${YELLOW}.....................  Setting up NeoVim .....................${NC}\n"
	
	nvim +'PlugInstall --sync' +qall
	nvim +'UpdateRemotePlugins' +qall
	python3 -m pip install neovim

	echo -e "\n${YELLOW}.....................  Setting up pyenv .....................${NC}\n"
	curl https://pyenv.run | bash
	pyenv install 3.4.3

	echo -e "\n${YELLOW}..................... Installing Postgresql9.5 .....................${NC}\n"
	cd /tmp
	wget http://security.ubuntu.com/ubuntu/pool/main/p/postgresql-9.5/postgresql-client-9.5_9.5.19-0ubuntu0.16.04.1_amd64.deb
	wget http://security.ubuntu.com/ubuntu/pool/main/p/postgresql-9.5/postgresql-9.5_9.5.19-0ubuntu0.16.04.1_amd64.deb
	sudo dpkg -i postgresql-client-9.5_9.5.19-0ubuntu0.16.04.1_amd64.deb postgresql-9.5_9.5.19-0ubuntu0.16.04.1_amd64.deb
	rm *.deb			
	
	echo -e "\n${YELLOW}..................... Installing Redis2.8 .....................${NC}\n"
	wget http://download.redis.io/releases/redis-2.8.24.tar.gz
	tar -xzvf redis-2.8.24.tar.gz
	cd redis-2.8.24/src/
	make
	rm redis-2.8.24.tar.gz


	echo $password |sudo -S snap install -y pycharm-community --classic
	echo $password |sudo -S snap install -y code --classic 
	echo $password |sudo -S snap install -y flock-chat

else
	echo -e "Different OS, exitting !!"
	exit 1
fi

