#!/usr/bin/env zsh

for config (env config aliases history completion prompt)
  source ~/.zsh/$config

[[ -f ~/.localrc ]] && source ~/.localrc
