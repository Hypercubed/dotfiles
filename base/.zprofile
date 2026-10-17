#-------------------------------------------------------------
# Source global definitions (if any)
#-------------------------------------------------------------

export PATH=~/bin:$PATH

setopt +o nomatch

unamestr=$(uname)

for file in ~/.dotfiles/{shared,$unamestr,$OSTYPE}/*.sh; do
	[ -r "$file" ] && . "$file"
done

if [[ -a ~/.localrc ]]
then
  source ~/.localrc
fi

