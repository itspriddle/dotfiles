export CLICOLOR=1
export TERM='xterm-256color'

if [[ $OSTYPE == darwin* ]] && [[ -z "$SSH_CONNECTION" ]]; then
  export EDITOR='mvim -f'
else
  export EDITOR='vim -f'
fi

export GIT_EDITOR="$EDITOR "

# vim:set ft=zsh:
