DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
for f in $DIR/shared/*; do source "$f"; done
for f in $DIR/$OSTYPE/*; do source "$f"; done