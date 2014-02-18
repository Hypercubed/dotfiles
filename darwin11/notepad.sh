export SUBL="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl"
#export MDP=`cygpath "${PROGRAMFILES}\MarkdownPad 2\MarkdownPad2.exe"`
export VISUAL="subl -w"
export EDITOR="vim"

git config --global --replace-all core.editor $EDITOR

alias supl="open -a Sublime\ Text"
alias np="open -a Sublime\ Text"

#function md() {
#  if [ "$1" == "" ] ; then
#    cygstart "$MDP"s
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
		$VISUAL $@
		;;
esac
}
