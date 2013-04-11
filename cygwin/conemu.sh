export CONEMUC="${CONEMU:=`cygpath "$ConEmuDir"`}/CONEMU/ConEmuC.exe"
SHELL=bash

function intab() {
	if [ "$1" == "" ] ; then
		intab "bash" "bash"
	else
		"$CONEMUC" /c "$1"  "-new_console:t:$2"
	fi
}

function cmdtab() {
	if [ "$1" == "" ] ; then
		intab cmd "Cmd"
	else
		intab cmd $1
	fi
}

function newtab() {
	if [ "$1" == "" ] ; then
		intab
	else
		intab "bash" $1
	fi
}

alias bashtab='newtab'

function splittab() {
	if [ "$1" == "" ] ; then
		splittab Cygwin
	else
		"$CONEMUC" /c "$SHELL"  "-new_console:sV:t:$1"
	fi
}

# Set the terminal's title.
title () {
	echo -ne '\033]0;'"$@"'\a';
}