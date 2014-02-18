# If not running interactively, don't do anything
#[ -z "$PS1" ] && return

#-------------------------------------------------------------
# Source global definitions (if any)
#-------------------------------------------------------------

#if [ -f /etc/bashrc ]; then
#      . /etc/bashrc   # --> Read /etc/bashrc, if present.
#fi

export PATH=~/bin:$PATH

for file in ~/.dotfiles/{shared,$OSTYPE}/*; do
	[ -r "$file" ] && . "$file"
done

if [ -e ~/.fresh/build/shell.sh ]
then
	. ~/.fresh/build/shell.sh
fi

if [[ -a ~/.localrc ]]
then
  source ~/.localrc
fi