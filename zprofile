#-------------------------------------------------------------
# Source global definitions (if any)
#-------------------------------------------------------------

export PATH=~/bin:$PATH

setopt +o nomatch

unamestr=$(uname)

for file in ~/.dotfiles/{shared,$unamestr,$OSTYPE}/*.sh; do
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

