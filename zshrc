#!/usr/bin/env zsh

for config (config aliases history completion prompt)
  source ~/.zsh/$config

[[ -f ~/.localrc ]] && source ~/.localrc
