#!/bin/bash

#To be added: -automatically change gnome-terminal to solarized dark theme, and solarized color palette
#			  -change gnome-terminal to use dark theme

# Variables
DEST=~/ #Home directory
VIM_CONF=.vimrc #Name of vim configuration
BASH_CONF=.bashrc #Name of bash configuration

#Install pathogen mod and modules
function pathogen_init {
	printf "Ensure package 'curl' is already installed\n"

	mkdir -p ~/.vim/autoload ~/.vim/bundle && \
	curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

	printf "Copying over listed modules\n"

	#Iterate through a list of git clones to install the latest modules
	while read line
	do
		#printf "Adding module from git repository %s\n" $line # | sed 's/.*\///'
		cd ~/.vim/bundle/
		$line
	done < modules.config

	#To be finished, prints the repository as desired, doesn't have full path to execute
	#sed 's/.*\///' modules.config

	cd
}

#Put the .bashrc file in place
function bashrc_init {
	if [ ${DEST}${BASH_CONF} -ot ${BASH_CONF} ]; then
		printf "Making a backup copy of the current .bashrc file\n"

		cp -v ~/.bashrc ~/.bashrc.backup

		printf "Creating a hard link to the new bash file\n"

		ln -fv `pwd`/.bashrc ~/.bashrc 
	fi
}

#Put the .vimrc file in place
function vimrc_init {
	if [ ${DEST}${VIM_CONF} -ot ${VIM_CONF} ]; then
		printf "\nMaking a backup copy of the current .vimrc file\n"

		cp -v ${DEST}.vimrc ~/.vimrc.backup

		printf "Creating a hard link to the new vim configuration file\n"

		ln -fv `pwd`/.vimrc ~/.vimrc 
	fi

}

pathogen_init
bashrc_init
vimrc_init

echo "Warning! Run git_setup.sh if git has not been initialized on your computer."
