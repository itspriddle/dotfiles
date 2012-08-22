# Load base config files
for config (config aliases history completion prompt)
  source ~/.dotfiles/zsh/$config

# Load plugin files
for plugin (~/.dotfiles/zsh/plugins/*)
  source $plugin

# Load settings specific to this machine
[[ -f ~/.localrc ]] && source ~/.localrc

# vim:set ft=zsh:
