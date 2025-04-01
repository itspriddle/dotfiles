if command -v fzf > /dev/null; then
  FZF_ALT_C_COMMAND= source <(fzf --zsh)
fi
