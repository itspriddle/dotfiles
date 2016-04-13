source ~/.dotfiles/profile.d/hub.sh

# Custom completion for git
zstyle ':completion:*:*:hub:*' user-commands \
  repl:'Open a repl' \
  pr:'Push branch to GitHub and open a Pull request' \
  count:'Show commit count by author'

# Completion `hub` and `git`
compdef _hub git hub