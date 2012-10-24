#!/usr/bin/env bash

if [ -n "$PS1" ]; then
  source ~/.dotfiles/zsh/aliases
  source ~/.dotfiles/bash/completion
  source ~/.dotfiles/bash/config
  source ~/.dotfiles/bash/prompt
fi

# use .localrc for settings specific to one system
if [ -f ~/.localrc ]; then
  source ~/.localrc
fi
