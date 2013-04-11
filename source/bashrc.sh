# User dependent .bashrc file

# If not running interactively, don't do anything
[[ "$-" != *i* ]] && return

# Shell Options
#
# See man bash for more options...
#
# Don't wait for job termination notification
# set -o notify
#
# Don't use ^D to exit
# set -o ignoreeof
#
# Use case-insensitive filename globbing
# shopt -s nocaseglob
#
# Make bash append rather than overwrite the history on disk
# shopt -s histappend
#
# When changing directory small typos can be ignored by bash
# for example, cd /vr/lgo/apaache would find /var/log/apache
# shopt -s cdspell

# Completion options
#
# These completion tuning parameters change the default behavior of bash_completion:
#
# Define to access remotely checked-out files over passwordless ssh for CVS
# COMP_CVS_REMOTE=1
#
# Define to avoid stripping description in --option=description of './configure --help'
# COMP_CONFIGURE_HINTS=1
#
# Define to avoid flattening internal contents of tar files
# COMP_TAR_INTERNAL_PATHS=1
#
# Uncomment to turn on programmable completion enhancements.
# Any completions you add in ~/.bash_completion are sourced last.
# [[ -f /etc/bash_completion ]] && . /etc/bash_completion

# History Options
#
# Don't put duplicate lines in the history.
# export HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
#
# Ignore some controlling instructions
# HISTIGNORE is a colon-delimited list of patterns which should be excluded.
# The '&' is a special pattern which suppresses duplicate entries.
# export HISTIGNORE=$'[ \t]*:&:[fb]g:exit'
# export HISTIGNORE=$'[ \t]*:&:[fb]g:exit:ls' # Ignore the ls command as well
#
# Whenever displaying the prompt, write the previous line to disk
# export PROMPT_COMMAND="history -a"

# Aliases
#
# Some people use a different file for aliases
# if [ -f "${HOME}/.bash_aliases" ]; then
#   source "${HOME}/.bash_aliases"
# fi
#
# Some example alias instructions
# If these are enabled they will be used instead of any instructions
# they may mask.  For example, alias rm='rm -i' will mask the rm
# application.  To override the alias instruction use a \ before, ie
# \rm will call the real rm not the alias.
#
# Interactive operation...
# alias rm='rm -i'
# alias cp='cp -i'
# alias mv='mv -i'
#
# Default to human readable figures
# alias df='df -h'
# alias du='du -h'
#
# Misc :)
# alias less='less -r'                          # raw control characters
# alias whence='type -a'                        # where, of a sort
# alias grep='grep --color'                     # show differences in colour
# alias egrep='egrep --color=auto'              # show differences in colour
# alias fgrep='fgrep --color=auto'              # show differences in colour
#
# Some shortcuts for different directory listings
alias ls='ls -hF --color=tty'                 # classify files in colour
alias dir='ls --color=auto --format=vertical'
# alias vdir='ls --color=auto --format=long'
alias ll='ls -l'                              # long list
# alias la='ls -A'                              # all but . and ..
# alias l='ls -CF'                              #

# Umask
#
# /etc/profile sets 022, removing write perms to group + others.
# Set a more restrictive umask: i.e. no exec perms for others:
# umask 027
# Paranoid: neither group nor others have any perms:
# umask 077

# Functions
#
# Some people use a different file for functions
# if [ -f "${HOME}/.bash_functions" ]; then
#   source "${HOME}/.bash_functions"
# fi
#
# Some example functions:
#
# a) function settitle
# settitle () 
# { 
#   echo -ne "\e]2;$@\a\e]1;$@\a"; 
# }
# 
# b) function cd_func
# This function defines a 'cd' replacement function capable of keeping, 
# displaying and accessing history of visited directories, up to 10 entries.
# To use it, uncomment it, source this file and try 'cd --'.
# acd_func 1.0.5, 10-nov-2004
# Petar Marinov, http:/geocities.com/h2428, this is public domain
# cd_func ()
# {
#   local x2 the_new_dir adir index
#   local -i cnt
# 
#   if [[ $1 ==  "--" ]]; then
#     dirs -v
#     return 0
#   fi
# 
#   the_new_dir=$1
#   [[ -z $1 ]] && the_new_dir=$HOME
# 
#   if [[ ${the_new_dir:0:1} == '-' ]]; then
#     #
#     # Extract dir N from dirs
#     index=${the_new_dir:1}
#     [[ -z $index ]] && index=1
#     adir=$(dirs +$index)
#     [[ -z $adir ]] && return 1
#     the_new_dir=$adir
#   fi
# 
#   #
#   # '~' has to be substituted by ${HOME}
#   [[ ${the_new_dir:0:1} == '~' ]] && the_new_dir="${HOME}${the_new_dir:1}"
# 
#   #
#   # Now change to the new dir and add to the top of the stack
#   pushd "${the_new_dir}" > /dev/null
#   [[ $? -ne 0 ]] && return 1
#   the_new_dir=$(pwd)
# 
#   #
#   # Trim down everything beyond 11th entry
#   popd -n +11 2>/dev/null 1>/dev/null
# 
#   #
#   # Remove any other occurence of this dir, skipping the top of the stack
#   for ((cnt=1; cnt <= 10; cnt++)); do
#     x2=$(dirs +${cnt} 2>/dev/null)
#     [[ $? -ne 0 ]] && return 0
#     [[ ${x2:0:1} == '~' ]] && x2="${HOME}${x2:1}"
#     if [[ "${x2}" == "${the_new_dir}" ]]; then
#       popd -n +$cnt 2>/dev/null 1>/dev/null
#       cnt=cnt-1
#     fi
#   done
# 
#   return 0
# }
# 
# alias cd=cd_func
#

# Otherstuff
export DISPLAY=127.0.0.1:0.0
export PYTHON=`which python`

function dotfiles {
	cd ~
	fresh
	source ~/.bashrc && echo $'Your dot files are now \033[1;32msourced\033[0m.'
	cd -
}

#ln -sf ~/../workspace workspace
#ln -sf ~/../Scratch scratch

#alias fresh=~/.fresh/source/freshshell/fresh/bin/fresh

# Print a line of dashes or the given string across the entire screen.
function line {
	width=$(tput cols);
	str=${1--};
	len=${#str};
	for ((i = 0; i < $width; i += $len)); do
		echo -n "${str:0:$(($width - $i))}";
	done;
	echo;
}
 
# Print the given text in the center of the screen.
function center {
	width=$(tput cols);
	str="$@";
	len=${#str};
	[ $len -ge $width ] && echo "$str" && return;
	for ((i = 0; i < $(((($width - $len)) / 2)); i++)); do
		echo -n " ";
	done;
	echo "$str";
}

# Back up the given files and directories using an incremental backup
# that looks like a full backup, like Time Machine does.
backup () {(
	# Backup format.
	local backup_dir="$HOME/backups";
	local date_format='%Y-%m-%d-%H-%M-%S';
 
	# Usage.
	if [ $# -eq 0 -o "$1" = '--help' ] || [ $# -eq 1 -a "$1" = '--' ]; then
		echo 'Usage: backup [[USER@]HOST:]FILE...';
		echo;
		echo "Back up the given files and directories to $backup_dir/$(date +"$date_format")";
		[ "$1" = '--' ] && shift;
		[ $# -gt 0 ];
		exit $?;
	fi;
 
	# Skip the "enough with the options; it's files only from now on" delimiter "--".
	[ "$1" = '--' ] && shift;
 
	# Loop the command-line arguments.
	local i=0;
	for path in "$@"; do
		# Update the backup directory timestamp for each file being backed up.
		local curr_date="$(date +"$date_format")";
 
		# Check if this is a remote source.
		! [[ "$path" =~ ^([^/]+):(.*) ]];
		is_remote=$?;
 
		# Determine the full source path, source location and target path.
		# For local files, the source path and location are the same. For
		# remote files, the location is [user@]host:path.
		if [ $is_remote -eq 1 ]; then
			# For SSH sources, use SSH to find the full path.
			host="${BASH_REMATCH[1]}";
			local source_path="$(ssh "$host" "$(printf "$(cat <<-'EOD'
				host=%q;
				path=%q;
				if ! [ -z "$path" -o -e "$path" ]; then
					echo "$host:$path does not exist." 1>&2;
					exit 1;
				fi;
				{ [ -d "$path" ] && cd -- "$path" && pwd; } || { cd -- "$(dirname -- "$path")" && echo "$PWD/$(basename -- "$path")"; }
			EOD)" "$host" "${BASH_REMATCH[2]}")")" || exit 1;
			local source_location="$host:$source_path";
			local source_path="/ssh=$host$source_path";
		elif [ -z "$path" -o -e "$path" ]; then
			# For local sources, go to the directory or the file's parent directory and use the working directory.
			local source_path="$({ [ -d "$path" ] && cd -- "$path" && pwd; } || { cd -- "$(dirname -- "$path")" && echo "$PWD/$(basename -- "$path")"; })";
			local source_location="$source_path";
		else
			echo "$path does not exist." 1>&2;
			exit 1;
		fi;
 
		# Determine the target directory for the current backup.
		local curr_backup="$backup_dir/$curr_date$source_path";
		# if [ $is_remote -eq 1 ]; then
		local curr_backup_dir="$(dirname "$curr_backup")";
		local curr_backup_dir="$curr_backup";
 
		# Check for previous backups.
		local prev_backup='';
		shopt -s nullglob;
		for prev_backup in "$backup_dir/"*"$source_path"; do
			:
		done;
 
for x in path is_remote source_path source_location curr_backup curr_backup_dir prev_backup; do printf $'%12s: "%s"\n' "$x" "${!x}"; done
		# Back up using rsync, hard-linking unchanged files to the previous backup, if any.
		mkdir -p "$curr_backup_dir";
		if [ "$(basename "$source_path")" = "$path" ]; then
			echo "Now backing up:  \"$path\"";
		else
			echo "Now backing up:  \"$path\" (\"$source_path\")";
		fi;
		echo "Backing up to:   \"$curr_backup\"";
		if [ -z "$prev_backup" ]; then
			echo 'Previous backup: (none)';
			echo;
			echo rsync --itemize-changes --archive -- "$source_location" "$curr_backup_dir";
		else
			echo "Previous backup: \"$prev_backup\"";
			echo;
			echo rsync --itemize-changes --archive --link-dest="$(dirname "$prev_backup")" -- "$source_location" "$curr_backup_dir"; # | sed '/\/\.svn\//d; /^cd+++++++ .*\/$/d';
		fi;
 
		# Print a blank line between two backups.
		let i++;
		[ $i -eq $# ] || echo;
	done;
)}
