export NP="${PF:=`cygpath "$PROGRAMFILES"`}/Notepad++/notepad++.exe"
export SUPL="${PF:=`cygpath "$PROGRAMFILES"`}/Sublime Text 2/sublime_text.exe"
export VISUAL=`cygpath -w "$SUPL"`
export EDITOR="$NP"

git config --global --replace-all core.editor "vim"

function np() {
	if [ "$1" == "" ] ; then
		cygstart "$SUPL"
	else
		cygstart "$SUPL" `winpath "$1"`
	fi
}

function supl() {
	if [ "$1" == "" ] ; then
		cygstart "$SUPL"
	else
		cygstart "$SUPL" `winpath "$1"`
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
