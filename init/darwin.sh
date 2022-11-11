#!/usr/bin/env bash

echo 'Tweaking OS X...'

which -s brew
if [[ $? != 0 ]]; then
  echo 'Installing Homebrew...'
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  echo '# Set PATH, MANPATH, etc., for Homebrew.' >> ~/.localrc
  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.localrc
  eval "$(/opt/homebrew/bin/brew shellenv)"
  brew update
fi

# Install utilities
brew install trash
brew install wget
brew install gh

which -s nvm
if [[ $? != 0 ]]; then
  echo 'Installing NVM...'
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.2/install.sh | bash
fi