export PF=`cygpath "$PROGRAMFILES"`
export EDITOR="${PF}/Notepad++/notepad++.exe"

WINMERGE="${PF}/WinMerge/WinMergeU.exe"
EXPLORER=`cygpath -W`/explorer.exe

alias github='github &'
alias winpath='cygpath -w'
alias open='cygstart'

function np() {
	if [ "$1" == "" ] ; then
		cygstart "$EDITOR"
	else
		cygstart "$EDITOR" `winpath "$1"`
	fi
}

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