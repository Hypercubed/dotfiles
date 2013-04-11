
export PF=`cygpath "$PROGRAMFILES"`

WINMERGE="${PF}/WinMerge/WinMergeU.exe"
EXPLORER=`cygpath -W`/explorer.exe

alias github='github &'
alias winpath='cygpath -w'
alias open='cygstart'

function winmerge { 
	if [ "$1" == "" ] ; then
		cygstart "$WINMERGE"
	else
		cygstart "$WINMERGE" `winpath "$2"` `winpath "$2"` 
	fi
}

alias wm=winmerge

function exp { 
  if [ "$1" == "" ] ; then 
	cygstart "$EXPLORER" /e,`winpath .`
  else
    cygstart "$EXPLORER" /e,`winpath "$@"`
  fi;
}

function trash { 
	mv $@ ~/.trash/
}

function scratch { 
	mv $@ ~/scratch/
}