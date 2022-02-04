#!/usr/bin/env bash

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