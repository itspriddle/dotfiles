export CLICOLOR=1
export TERM='xterm-256color'

if [[ $OSTYPE == darwin* ]] && [[ -z "$SSH_CONNECTION" ]]; then
  export EDITOR='mvim -f'
else
  export EDITOR='vim -f'
fi

export GIT_EDITOR="$EDITOR "

# Setup $path as a unique array
typeset -aU path

# vim:set ft=zsh:
