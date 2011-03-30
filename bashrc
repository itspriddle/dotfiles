# If not running interactively, don't do anything
[ -z "$PS1" ] && return

source ~/.zsh/aliases
source ~/.bash/completions
source ~/.bash/config

# use .localrc for settings specific to one system
if [ -f ~/.localrc ]; then
  source ~/.localrc
fi
