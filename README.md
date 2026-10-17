# Hypercubed dotfiles

## dotfiles

Your dotfiles are how you personalize your system. These are mine.

## Installation

My dotfiles are managed by [GNU Stow].

[GNU Stow]: https://www.gnu.org/software/stow/

Install using stow:

``` sh
git clone https://github.com/Hypercubed/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
stow base
```

Or run the installer script (checks for stow, runs `stow -R base`, touches `~/.localrc`):

``` sh
cd ~/.dotfiles
./init/install.sh
```

The `base` package symlinks `.bashrc`, `.bash_profile`, `.vimrc`, `.zprofile`,
and `.liquidpromptrc` into `$HOME`. The `.bashrc` still sources every snippet in
`~/.dotfiles/shared/` and `~/.dotfiles/$OSTYPE/` (e.g. `linux-gnu/`, `darwin/`,
`cygwin/`), so OS-specific configuration continues to work as before.

And you shall see 海!
