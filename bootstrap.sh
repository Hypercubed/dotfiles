#!/bin/bash
cd ~/.dotfiles/
git pull

setopt +o nomatch

unamestr=$(uname)

for file in ~/.dotfiles/init/{symlink-dotfiles,$unamestr,$OSTYPE}.sh; do
	[ -r "$file" ] && . "$file"
done

# Reload
source ~/.bashrc
