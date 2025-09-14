unalias run-help &> /dev/null
autoload run-help

HELPDIR="/usr/share/zsh/$ZSH_VERSION/help"

# Allows searching docs for ZSH builtins via `help <command>`
alias run-help='PAGER=cat run-help "$@"'
alias help='run-help'
