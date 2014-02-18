#!/bin/bash

function doIt() {
	ln -sf ~/.dotfiles/bashrc ~/.bash_profile
	ln -sf ~/.dotfiles/bashrc ~/.bashrc
	ln -sf ~/.dotfiles/freshrc ~/.freshrc
	ln -sf ~/.dotfiles/liquidpromtrc ~/.liquidpromtrc
	ln -sf ~/.dotfiles/vimrc ~/.vimrc
}

echo 'Symlinking dotfiles...'

if [ "$1" == "--force" -o "$1" == "-f" ]; then
	doIt
else
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1
	echo
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt
	fi
fi
unset doIt