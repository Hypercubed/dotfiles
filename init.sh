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

echo "Linking ~/.bash files";
ln -sf  "${HOME}/.dotfiles/.bashrc" "${HOME}/.bashrc";
ln -sf  "${HOME}/.dotfiles/.bash_profile" "${HOME}/.bash_profile";