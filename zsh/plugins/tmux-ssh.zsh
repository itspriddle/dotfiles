# Update SSH_AUTH_SOCK from tmux global environment when in tmux
# This ensures SSH agent forwarding works after reattaching to old sessions
_update_tmux_ssh_auth_sock() {
  if [ -n "$TMUX" ]; then
    eval $(tmux showenv -g SSH_AUTH_SOCK 2>/dev/null)
  fi
}

# Run on every prompt to keep existing shells updated
autoload -Uz add-zsh-hook
add-zsh-hook precmd _update_tmux_ssh_auth_sock
