#-------------------------------------------------------------
# Source global definitions (if any)
#-------------------------------------------------------------

export PATH=~/bin:$PATH

for file in ~/.dotfiles/{shared,$OSTYPE}/*.sh; do
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
