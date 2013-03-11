# Hypercubed .dotfiles init
# Based on https://github.com/holman/dotfiles/

echo 'Dotfiles - Jayson Harshbarger "Hypercubed"'

if [[ "$1" == "-h" || "$1" == "--help" ]]; then
	echo "Usage: $(basename "$0")"
	exit
fi

# Initialize.
#if [[ ! -d ~/.dotfiles ]]; then
#  echo "Error";
#  exit;
#else
#  # Make sure we have the latest files.
#  echo "Updating dotfiles"
#  cd ~/.dotfiles
#  git pull
#fi

DOTFILES_ROOT=~/dotfiles

link_files () {
  ln -sf $1 $2
  #ln -s $1 $2
  echo "linked $1 to $2"
}

install_dotfiles () {
  echo 'linking dotfiles'

  for source in `find $DOTFILES_ROOT -maxdepth 2 -name \*.symlink`
  do
    dest="$HOME/.`basename \"${source%.*}\"`"

	echo ''	
    link_files $source $dest

  done
}

install_dotfiles

echo ''
echo '  All installed!'