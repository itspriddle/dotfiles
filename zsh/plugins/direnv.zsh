# Direnv
if command -v direnv > /dev/null; then
  eval "$(direnv hook "${ZSH_VERSION+zsh}${BASH_VERSION+bash}")"
fi
