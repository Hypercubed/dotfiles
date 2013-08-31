export SUPL="/cygdrive/c/Program Files/Sublime Text 3/sublime_text.exe"
export VISUAL=`cygpath -w "$SUPL"`
export EDITOR="vim"

git config --global --replace-all core.editor $EDITOR

function np() {
	if [ "$1" == "" ] ; then
		cygstart "$SUPL"
	else
		cygstart "$SUPL" `winpath $@`
	fi
}

function supl() {
	if [ "$1" == "" ] ; then
		cygstart "$SUPL"
	else
		cygstart "$SUPL" `winpath $@`
	fi
}

function editor() {
case "$1" in
	*_EDITMSG|*MERGE_MSG|*_TAGMSG )
		$EDITOR $@
		;;
	* )
		supl $@
		;;
esac
}
