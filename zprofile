# Set PATH items for login shells only

path=(
  $HOME/.dotfiles/bin
  /usr/local/{bin,sbin,share/npm/bin}
  /usr/sbin
  /sbin
  $path
)

# Load settings specific to this machine
[[ -f ~/.zprofile.local ]] && source ~/.zprofile.local

# [[ -f ~/.dotfiles/profile.d/init.sh ]] && source ~/.dotfiles/profile.d/init.sh

# vim:set ft=zsh:
