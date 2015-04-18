export CLICOLOR=1
export TERM='xterm-256color'
export EDITOR=vim
export GIT_EDITOR="$EDITOR "

new_paths=(
  $HOME/.dotfiles/bin
)

for p in "${new_paths[@]}"
do
  [[ -d $p ]] && export PATH="$p:$PATH"
done

unset new_paths

source $HOME/.bashrc

# vim:set ft=sh:
