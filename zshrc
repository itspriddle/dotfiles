# Load base config files
for config (config aliases history completion prompt)
  source ~/.dotfiles/zsh/$config

# Load plugin files
for plugin (~/.dotfiles/zsh/plugins/*(N))
  source $plugin

# Load settings specific to this machine
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local

# vim: ft=zsh
