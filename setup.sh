#!/bin/bash

#Put the .bashrc file in place
printf "Making a backup copy of the current .bashrc file\n"

cp -v ~/.bashrc ~/.bashrc.backup

printf "\nNew .bashrc file being copied to ~/.bashrc\n"

cp -v ./.bashrc ~/.bashrc
