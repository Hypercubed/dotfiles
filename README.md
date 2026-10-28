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

Optionally stow the OS-specific package for your platform (`linux`, `macos`,
or `windows-cygwin`) if it contains dotfiles you want:

``` sh
stow linux            # on Linux
stow macos            # on macOS
stow windows-cygwin   # on Cygwin
```

Or run the installer script. It checks for stow, runs `stow -R base`,
auto-detects your OS via `uname` and stows the matching OS package if it has
real dotfiles, then touches `~/.localrc`:

``` sh
cd ~/.dotfiles
./init/install.sh
```

The `base` package symlinks `.bashrc`, `.bash_profile`, `.vimrc`, `.zprofile`,
and `.liquidpromptrc` into `$HOME`. The `.bashrc` still sources every snippet in
`~/.dotfiles/shared/` and `~/.dotfiles/$OSTYPE/` (e.g. `linux-gnu/`, `darwin/`,
`cygwin/`), so OS-specific configuration continues to work as before. The
`linux`, `macos`, and `windows-cygwin` packages are reserved for OS-specific
dotfiles that should be symlinked into `$HOME`; they currently contain only a
`.keep` placeholder.

And you shall see 海!
