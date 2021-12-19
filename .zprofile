# start ssh-agent if not running and connect to common socket
ssh-add -l &> /dev/null
if [ $? -ge 2 ]; then
  eval "$(ssh-agent -s -a "$SSH_AUTH_SOCK")" > /dev/null
fi
