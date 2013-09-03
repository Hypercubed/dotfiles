#!/bin/bash
cd ~/.dotfiles/
git pull

function doIt() {
	ln -s ~/.dotfiles/bashrc ~/.bash_profile
	ln -s ~/.dotfiles/bashrc ~/.bashrc
	ln -s ~/.dotfiles/freshrc ~/.freshrc
	ln -s ~/.dotfiles/liquidpromtrc ~/.liquidpromtrc
	ln -s ~/.dotfiles/vimrc ~/.vimrc
}

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
source ~/.bashrc
