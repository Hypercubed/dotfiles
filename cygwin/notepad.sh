export SUBL="/cygdrive/c/Program Files/Sublime Text 3/sublime_text.exe"
export VISUAL="subl"
export EDITOR="vim"

git config --global --replace-all core.editor $EDITOR

function subl() {
	if [ "$1" == "" ] ; then
		cygstart "$SUBL"
	else
		cygstart "$SUBL" `winpath $@`
	fi
}

alias np=subl

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
