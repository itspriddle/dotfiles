if [[ $- == *i* ]] && [[ -r /etc/zprofile ]] && grep -E '^\s*eval `/usr/libexec/path_helper' /etc/zprofile > /dev/null; then
  echo "\033[31m!!! WARNING: macOS path_helper enabled in /etc/zprofile !!!\033[m" >&2
fi

source ~/.dotfiles/profile.d/env.sh
source ~/.dotfiles/profile.d/gpg.sh

# vim: ft=zsh
