#!/usr/bin/env bash
set -e

cd "$(dirname "$0")/.."

if ! command -v stow >/dev/null 2>&1; then
  echo "GNU Stow is required but not installed."
  echo "  Debian/Ubuntu: sudo apt install stow"
  echo "  macOS (Homebrew): brew install stow"
  exit 1
fi

os_pkg=""
case "$(uname)" in
  Darwin)   os_pkg="macos" ;;
  Linux)    os_pkg="linux" ;;
  CYGWIN*)  os_pkg="windows-cygwin" ;;
esac

stow -R base

# Stow the OS-specific package only if it contains real dotfiles
# (anything other than the .keep placeholder).
if [ -n "$os_pkg" ] && [ -d "$os_pkg" ]; then
  if find "$os_pkg" -mindepth 1 -maxdepth 1 ! -name '.keep' | grep -q .; then
    stow -R "$os_pkg"
  else
    echo "Skipping 'stow $os_pkg': no OS-specific dotfiles yet (only .keep)."
  fi
fi

touch ~/.localrc
