# If id command returns zero, you’ve root access.
if [ $(id -u) -eq 0 ];
then # you are root, set red colour prompt
  PS1="\\[$(tput setaf 1)\\]\\u@\\h:\\w #\\[$(tput sgr0)\\] "
else # normal
  PS1="\[\e[0;37m\][\[\e[0;36m\]\u\[\e[0;37m\]@\[\e[0;36m\]\h\[\e[0;37m\]:\[\e[0;36m\]\w\[\e[0;37m\]]\[\e[0;m\] $ "
fi
