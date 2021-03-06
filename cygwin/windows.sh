
export PF="`cygpath $PROGRAMFILES`"

WINMERGE="${PF}/WinMerge/WinMergeU.exe"
EXPLORER=`cygpath -W`/explorer.exe
CYGWIN="${CYGWIN} nodosfilewarning"

alias github='github &'
alias winpath='cygpath -w --'
alias open='cygstart'

function open {
	cygstart $@
}
export -f open

function winmerge {
	if [ "$1" == "" ] ; then
		cygstart "$WINMERGE"
	else
		cygstart "$WINMERGE" `winpath $@`
	fi
}

alias wm=winmerge

function trash {
	mv $@ ~/.trash/
}

function scratch {
	mv $@ ~/scratch/
}
