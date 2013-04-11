export NP="${PF:=`cygpath "$PROGRAMFILES"`}/Notepad++/notepad++.exe"
export EDITOR="editor"

git config --global core.editor "'$NP' -multiInst -nosession -noPlugin"

function np() {
	if [ "$1" == "" ] ; then
		cygstart "$NP"
	else
		cygstart "$NP" `winpath "$1"`
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
