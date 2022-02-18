# if no identities loaded, ensure we only have one ssh-agent running and connect to common socket
ssh-add -l &> /dev/null
if [ $? -ge 2 ]; then
  killall ssh-agent &> /dev/null
  eval "$(ssh-agent -s -a "$SSH_AUTH_SOCK")" &> /dev/null
fi
