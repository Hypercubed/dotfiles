export PF=`cygpath "$PROGRAMFILES"`
export EDITOR="${PF}/Notepad++/notepad++.exe"

function np() {
  exec "$EDITOR" "$1" &
}

function wm { 
  exec "${PF}/WinMerge/WinMergeU.exe" $@ & 
}

function exp { 
  if [ -z "$1" ]
  then 
    set -- $PWD
  fi;
  exec `cygpath "$SYSTEMROOT"`/explorer.exe /e,`cygpath -w "$1"`
}