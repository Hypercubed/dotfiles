export NP="${PF:=`cygpath "$PROGRAMFILES"`}/Notepad++/notepad++.exe"
export SUBL="${PF:=`cygpath "$PROGRAMFILES"`}/Sublime Text 3/sublime_text.exe"
export VISUAL=`cygpath -w "$SUBL"`
export EDITOR="$NP"

git config --global --replace-all core.editor "vim"

function np() {
	if [ "$1" == "" ] ; then
		cygstart "$SUBL"
	else
		cygstart "$SUBL" `winpath $@`
	fi
}

function subl() {
	if [ "$1" == "" ] ; then
		cygstart "$SUBL"
	else
		cygstart "$SUBL" `winpath $@`
	fi
}

function editor() {
case "$1" in
	*_EDITMSG|*MERGE_MSG|*_TAGMSG )
		vim "$1"
		;;
	* )
		np "$1"
		;;
esac
}
