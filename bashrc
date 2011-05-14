if [[ -n "$PS1" ]]; then
  source ~/.zsh/aliases
  source ~/.bash/completions
  source ~/.bash/config

  # use .localrc for settings specific to one system
  if [ -f ~/.localrc ]; then
    source ~/.localrc
  fi
fi
