#!/bin/bash

# Hypercubed .dotfiles init
# Based on https://github.com/holman/dotfiles/ and https://github.com/cowboy/dotfiles/blob/master/bin/dotfiles

echo 'Dotfiles - Jayson Harshbarger "Hypercubed"'

if [[ "$1" == "-h" || "$1" == "--help" ]]; then
	echo "Usage: $(basename "$0")"
	exit
fi



# Logging stuff.
function e_header()   { echo -e "\n\033[1m$@\033[0m"; }
function e_success()  { echo -e " \033[1;32m?\033[0m  $@"; }
function e_error()    { echo -e " \033[1;31m?\033[0m  $@"; }
function e_arrow()    { echo -e " \033[1;33m?\033[0m  $@"; }

# Offer the user a chance to skip something.
function skip() {
  REPLY=noskip
  read -t 5 -n 1 -s -p "To skip, press X within 5 seconds. "
  if [[ "$REPLY" =~ ^[Xx]$ ]]; then
    echo "Skipping!"
  else
    echo "Continuing..."
    return 1
  fi
}

# Initialize.
function init_do() {
  e_success "Init ~/$1."
  source "$2"
}

# Copy files.
function copy_header() { e_header "Copying files into home directory"; }
function copy_test() {
  if [[ -e "$2" && ! "$(cmp "$1" "$2" 2> /dev/null)" ]]; then
    echo "same file"
  elif [[ "$1" -ot "$2" ]]; then
    echo "destination file newer"
  fi
}
function copy_do() {
  e_success "Copying ~/$1."
  #cp "$2" ~/
}

# Link files.
function link_header() { e_header "Linking files into home directory"; }
function link_test() {
  [[ "$1" -ef "$2" ]] && echo "same file"
}
function link_do() {
  e_success "Linking ~/$1."
  ln -sf ${2#$HOME/} ~/
}

DOTFILES_ROOT=~/dotfiles

# Copy, link, init, etc.
function do_stuff() {
  local base dest skip
  local files=($DOTFILES_ROOT/$1/*)

  # No files? abort.
  if (( ${#files[@]} == 0 )); then return; fi
  
  # Run _header function only if declared.
  [[ $(declare -f "$1_header") ]] && "$1_header"
  
  # Iterate over files.
  for file in "${files[@]}"; do
    base="$(basename $file)"
    dest="$HOME/$base"
	
    # Run _test function only if declared.
    if [[ $(declare -f "$1_test") ]]; then
      # If _test function returns a string, skip file and print that message.
      skip="$("$1_test" "$file" "$dest")"
      if [[ "$skip" ]]; then
        e_error "Skipping ~/$base, $skip."
        continue
      fi
      # Destination file already exists in ~/. Back it up!
      if [[ -e "$dest" ]]; then
        e_arrow "Backing up ~/$base."
        # Set backup flag, so a nice message can be shown at the end.
        backup=1
        # Create backup dir if it doesn't already exist.
        [[ -e "$backup_dir" ]] || mkdir -p "$backup_dir"
        # Backup file / link / whatever.
        mv "$dest" "$backup_dir"
      fi
    fi
	
    # Do stuff.
    "$1_do" "$base" "$file"
	
  done
}

# Tweak file globbing.
shopt -s dotglob
shopt -s nullglob

#_link_all
do_stuff "link"
do_stuff "init"
do_stuff "copy"

# All done!
e_header "All done!"