# Functions
#
# Some example functions:
#
# a) function settitle
settitle () 
{ 
	echo -ne "\e]2;$@\a\e]1;$@\a"; 
}

#settitle $OSTYPE

# 
# b) function cd_func
# This function defines a 'cd' replacement function capable of keeping, 
# displaying and accessing history of visited directories, up to 10 entries.
# To use it, uncomment it, source this file and try 'cd --'.
# acd_func 1.0.5, 10-nov-2004
# Petar Marinov, http:/geocities.com/h2428, this is public domain
# cd_func ()
# {
#   local x2 the_new_dir adir index
#   local -i cnt
# 
#   if [[ $1 ==  "--" ]]; then
#     dirs -v
#     return 0
#   fi
# 
#   the_new_dir=$1
#   [[ -z $1 ]] && the_new_dir=$HOME
# 
#   if [[ ${the_new_dir:0:1} == '-' ]]; then
#     #
#     # Extract dir N from dirs
#     index=${the_new_dir:1}
#     [[ -z $index ]] && index=1
#     adir=$(dirs +$index)
#     [[ -z $adir ]] && return 1
#     the_new_dir=$adir
#   fi
# 
#   #
#   # '~' has to be substituted by ${HOME}
#   [[ ${the_new_dir:0:1} == '~' ]] && the_new_dir="${HOME}${the_new_dir:1}"
# 
#   #
#   # Now change to the new dir and add to the top of the stack
#   pushd "${the_new_dir}" > /dev/null
#   [[ $? -ne 0 ]] && return 1
#   the_new_dir=$(pwd)
# 
#   #
#   # Trim down everything beyond 11th entry
#   popd -n +11 2>/dev/null 1>/dev/null
# 
#   #
#   # Remove any other occurence of this dir, skipping the top of the stack
#   for ((cnt=1; cnt <= 10; cnt++)); do
#     x2=$(dirs +${cnt} 2>/dev/null)
#     [[ $? -ne 0 ]] && return 0
#     [[ ${x2:0:1} == '~' ]] && x2="${HOME}${x2:1}"
#     if [[ "${x2}" == "${the_new_dir}" ]]; then
#       popd -n +$cnt 2>/dev/null 1>/dev/null
#       cnt=cnt-1
#     fi
#   done
# 
#   return 0
# }
# 
# alias cd=cd_func
#

# Create a new directory and enter it
function mkd() {
	mkdir -p "$@" && cd "$@"
}

# Escape UTF-8 characters into their 3-byte format
function escape() {
	printf "\\\x%s" $(printf "$@" | xxd -p -c1 -u)
	# print a newline unless we’re piping the output to another program
	if [ -t 1 ]; then
		echo # newline
	fi
}

# Decode \x{ABCD}-style Unicode escape sequences
function unidecode() {
	perl -e "binmode(STDOUT, ':utf8'); print \"$@\""
	# print a newline unless we’re piping the output to another program
	if [ -t 1 ]; then
		echo # newline
	fi
}

function reload() {
  . ~/.bashrc && echo $'Your dot files are now \033[1;32msourced\033[0m.'
}

function refresh() {
  `type -P "fresh"` update
}

alias dotfiles="refresh && reload"

# Print a line of dashes or the given string across the entire screen.
function line {
	width=$(tput cols);
	str=${1--};
	len=${#str};
	for ((i = 0; i < $width; i += $len)); do
		echo -n "${str:0:$(($width - $i))}";
	done;
	echo;
}
 
# Print the given text in the center of the screen.
function center {
	width=$(tput cols);
	str="$@";
	len=${#str};
	[ $len -ge $width ] && echo "$str" && return;
	for ((i = 0; i < $(((($width - $len)) / 2)); i++)); do
		echo -n " ";
	done;
	echo "$str";
}

