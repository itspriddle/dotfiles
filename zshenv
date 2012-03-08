# enable colored output from ls, etc

export TERM='xterm-color'
export GITIGNORE='[^.]*'
export TIMEFMT=$'\n\`%J\`\nexecution time:\nreal\t%E\nuser\t%U\nsys\t%S\ncpu\t%P\n'
export ZSH_PLATFORM=$(uname)

typeset -U path

path=(
  $HOME/.dotfiles/bin
  $HOME/.dotfiles/private-bin
  /opt/local/bin
  /usr/X11/bin
  $path
)

# vim:set ft=zsh:
