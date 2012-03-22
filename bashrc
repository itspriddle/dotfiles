#!/usr/bin/env bash

if [[ -n "$PS1" ]]; then
  source ~/.zsh/aliases
  source ~/.bash/completion
  source ~/.bash/config
  source ~/.bash/prompt
fi

# use .localrc for settings specific to one system
if [ -f ~/.localrc ]; then
  source ~/.localrc
fi
