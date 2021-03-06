export SUBL="/cygdrive/c/Program Files/Sublime Text 3/sublime_text.exe"
export ATOM="/cygdrive/c/ProgramData/chocolatey/bin/atom.exe"
#export MDP=`cygpath "${PROGRAMFILES}\MarkdownPad 2\MarkdownPad2.exe"`
export VISUAL="subl"
export EDITOR="vim"

git config --global --replace-all core.editor $EDITOR

function subl() {
	if [ "$1" = "" ] ; then
		cygstart "$SUBL"
	else
		cygstart "$SUBL" `cygpath -w -- $@`
	fi
}

function atom() {
	if [[ "$1" == "" ]] ; then
		"$ATOM"
	else
		"$ATOM" `cygpath -w -- $@`
	fi
}

alias np=subl

#function md() {
#  if [ "$1" == "" ] ; then
#    cygstart "$MDP"
#  else
#    cygstart "$MDP" `winpath $@`
#  fi
#}

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
