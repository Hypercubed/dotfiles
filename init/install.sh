#!/usr/bin/env bash
set -e

cd "$(dirname "$0")/.."

if ! command -v stow >/dev/null 2>&1; then
  echo "GNU Stow is required but not installed."
  echo "  Debian/Ubuntu: sudo apt install stow"
  echo "  macOS (Homebrew): brew install stow"
  exit 1
fi

stow -R base

touch ~/.localrc
