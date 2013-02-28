export CLICOLOR=1
export TERM='xterm-256color'
export GITIGNORE='[^.]*'
export UNAME=$(uname)
export MAKEFLAGS='-j3'

# export TIMEFMT=$'\n\`%J\`\nexecution time:\nreal\t%E\nuser\t%U\nsys\t%S\ncpu\t%P\n'

typeset -U path

path=($HOME/.dotfiles/bin /usr/local/{bin,sbin,share/npm/bin} /opt/X11/bin $path)

if [ $UNAME = 'Darwin' ] && [ -z "$SSH_CONNECTION" ]; then
  export EDITOR='mvim -f'
else
  export EDITOR='vim -f'
fi

export GIT_EDITOR="$EDITOR "

# vim:set ft=zsh:
