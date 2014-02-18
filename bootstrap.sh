#!/bin/bash
cd ~/.dotfiles/
git pull

for file in ~/.dotfiles/init/{symlink-dotfiles,$OSTYPE}.sh; do
	[ -r "$file" ] && . "$file"
done

# Reload
source ~/.bashrc
