#!/usr/bin/env bash

echo 'Tweaking OS X...'

which -s brew
if [[ $? != 0 ]]; then
echo 'Installing Homebrew...'
  ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)"
  brew update
fi

# Install utilities
brew install trash
brew install wget
brew install node