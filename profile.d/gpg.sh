# GPG agent
if test -S ~/.gnupg/S.gpg-agent -a -n "$(pgrep gpg-agent)"; then
  # TODO: where does this 1489:1 come from?
  export GPG_AGENT_INFO=~/.gnupg/S.gpg-agent:1489:1
  GPG_TTY=$(tty)
  export GPG_TTY
else
  echo "Starting gpg-agent daemon"
  eval $(gpg-agent --daemon)
fi
