unalias run-help &> /dev/null
autoload run-help

HELPDIR="/usr/share/zsh/$ZSH_VERSION/help"

# Allows searching docs for ZSH builtins via `help <command>`
help() { run-help "$@" }
