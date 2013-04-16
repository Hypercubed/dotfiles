# If not running interactively, don't do anything
[ -z "$PS1" ] && return

#-------------------------------------------------------------
# Source global definitions (if any)
#-------------------------------------------------------------

if [ -f /etc/bashrc ]; then
      . /etc/bashrc   # --> Read /etc/bashrc, if present.
fi

if [ -f "~/.fresh/build/shell.sh" ]
then
	source ~/.fresh/build/shell.sh
else
	for f in ~/.dotfiles/shared/*; do source "$f"; done
	#for f in ~/.dotfiles/$OSTYPE/*; do source "$f"; done
fi