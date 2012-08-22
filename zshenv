export CLICOLOR=1
export TERM='xterm-color'
export GITIGNORE='[^.]*'
export UNAME=$(uname)
export MAKEFLAGS='-j3'

# export TIMEFMT=$'\n\`%J\`\nexecution time:\nreal\t%E\nuser\t%U\nsys\t%S\ncpu\t%P\n'

typeset -U path

path=(
  $HOME/.dotfiles/bin
  /opt/local/{bin,sbin}
  /opt/X11/bin
  $path
)

# vim:set ft=zsh:
