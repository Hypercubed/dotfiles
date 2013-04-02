export CONEMUC="${CONEMU:=`cygpath "$ConEmuDir"`}/CONEMU/ConEmuC.exe"

alias con='newtab cygwin'

function conemu() {
	echo $1
	if [ "$1" == "" ] ; then
		conemu "-new_console:t:Cygwin"
	else
		"$CONEMUC" /c bash "$1"
	fi
}

function newtab() {
	if [ "$1" == "" ] ; then
		conemu
	else
		conemu "-new_console:t:$1"
	fi
}

function split() {
	if [ "$1" == "" ] ; then
		conemu "-new_console:sV"
	else
		conemu "-new_console:sV:t:$1"
	fi
}