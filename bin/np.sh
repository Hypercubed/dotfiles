#!/bin/sh
#
# Quick shortcut to an editor.

if [ "$1" == "" ] ; then
  exec "$EDITOR" &
else
  exec "$EDITOR" "$1" &
fi