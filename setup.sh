#!/bin/bash

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
}

#Put the .bashrc file in place
function bashrc_init {
	printf "Making a backup copy of the current .bashrc file\n"

	cp -v ~/.bashrc ~/.bashrc.backup

	printf "Creating a hard link to the new bash file\n"

	ln -fv `pwd`/.bashrc ~/.bashrc 
}

#Put the .vimrc file in place
function vimrc_init {
	printf "\nMaking a backup copy of the current .vimrc file\n"

	cp -v ~/.vimrc ~/.vimrc.backup

	printf "Creating a hard link to the new vim configuration file\n"

	ln -fv `pwd`/.vimrc ~/.vimrc 

}

#pathogen_init
bashrc_init
vimrc_init
