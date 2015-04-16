# If not running interactively, don't do anything
#[[ "$-" != *i* ]] && return

[[ -z ${USER_BASHRC} ]] && USER_BASHRC="1" || return

#-------------------------------------------------------------
# Source global definitions (if any)
#-------------------------------------------------------------

export PATH=~/bin:$PATH

for file in ~/.dotfiles/{shared,$OSTYPE}/*.{sh,bash}; do
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

[[ $(($RANDOM % 2)) == 0 ]] && echo "Hello" || echo "Welcome"
