# Set PATH items for login shells only

path=($HOME/.dotfiles/bin /usr/local/{bin,sbin,share/npm/bin} $path)

# Load settings specific to this machine
[[ -f ~/.zprofile.local ]] && source ~/.zprofile.local

# vim:set ft=zsh:
