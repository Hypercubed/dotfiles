# Hypercubed dotfiles

## dotfiles

Your dotfiles are how you personalize your system. These are mine.

## Installation

My dotfiles are managed by [fresh].

[fresh]: http://freshshell.com

Install using fresh:
``` sh
FRESH_LOCAL_SOURCE=Hypercubed/dotfiles bash -c "`curl -sL get.freshshell.com`"
```

Install using bootstrap:

``` sh
cd ~
git clone https://github.com/Hypercubed/dotfiles.git .dotfiles
bash ./.dotfiles//init/symlink-dotfiles.sh
```

And you shall see 海!
