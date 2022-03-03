# if no identities loaded, start new ssh-agent and connect to common socket
ssh-add -l &> /dev/null
if [ $? -ge 2 ]; then
  rm "$SSH_AUTH_SOCK"
  eval "$(ssh-agent -s -a "$SSH_AUTH_SOCK")" &> /dev/null
fi
