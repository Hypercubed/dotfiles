#!/bin/bash

# simple ps wrapper that doesn't allow the -o option
function _ps() {
  options=()  # the buffer array for the parameters
  eoo=0       # end of options reached

  while [[ "$1" != "" ]]
  do
      if ! ((eoo)); then
        case "$1" in
          -o)
              shift
              ;;
          -[^-]*o*|-o?*)
              options+=("${1//a}")
              shift
              ;;
          --)
              eoo=1
              options+=("$1")
              shift
              ;;
          *)
              options+=("$1")
              shift
              ;;
        esac
      else
        options+=("$1")
        shift
      fi
  done

  ps "${options[@]}"
}

alias ps=_ps