SSHAGENT=/usr/bin/ssh-agent

# If no SSH agent is already running, start one now. Re-use sockets so we never
# have to start more than one session.

export SSH_AUTH_SOCK=$HOME/.ssh-socket

ssh-add -l >/dev/null 2>&1
if [ $? = 2 ]; then
   # No ssh-agent running
   rm -rf $SSH_AUTH_SOCK
   # >| allows output redirection to over-write files if no clobber is set
   $SSHAGENT -a $SSH_AUTH_SOCK >| /tmp/.ssh-script
   source /tmp/.ssh-script
   echo $SSH_AGENT_PID >| ~/.ssh-agent-pid
   rm /tmp/.ssh-script
fi
