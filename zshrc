#!/usr/bin/env zsh

. ~/.zsh/config
. ~/.zsh/aliases
. ~/.zsh/completion
. ~/.zsh/prompt

[[ -f ~/.localrc ]] && . ~/.localrc
[[ -f ~/.localrc-private ]] && . ~/.localrc-private
