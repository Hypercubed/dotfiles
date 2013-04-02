
export PF=`cygpath "$PROGRAMFILES"`

WINMERGE="${PF}/WinMerge/WinMergeU.exe"
EXPLORER=`cygpath -W`/explorer.exe

alias github='github &'
alias winpath='cygpath -w'
alias open='cygstart'

function wm { 
	if [ "$1" == "" ] ; then
		cygstart "$WINMERGE"
	else
		cygstart "$WINMERGE" `winpath "$2"` `winpath "$2"` 
	fi
}

function exp { 
  if [ "$1" == "" ] ; then 
	cygstart "$EXPLORER" /e,`winpath .`
  else
    cygstart "$EXPLORER" /e,`winpath "$1"`
  fi;
}