#!/usr/bin/env zsh

for config (config aliases history completion prompt)
  source ~/.zsh/$config

for plugin ($HOME/.zsh/plugins/*) source $plugin

[[ -f ~/.localrc ]] && source ~/.localrc
