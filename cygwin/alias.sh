# Aliases
#
# Some shortcuts for different directory listings (this don't work on mac)
alias ls='ls -hF --color=tty'                 # classify files in colour
alias dir='ls --color=auto --format=vertical'
alias clear='printf "\033c"'

if hash hub 2>/dev/null; then
	eval "$(hub alias -s)"
fi
