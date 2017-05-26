source ~/.dotfiles/profile.d/hub.sh

# Custom completion for git
zstyle ':completion:*:*:hub:*' user-commands \
  count:'Show commit count by author'

# Completion `hub` and `git`
compdef _hub git hub
