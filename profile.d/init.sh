if [ -d ~/.dotfiles/profile.d ]; then
  for i in ~/.dotfiles/profile.d/*.sh; do
    if [ -r $i ] && [ "$(basename "$i")" != "init.sh" ]; then
      source $i
    fi
  done
  unset i
fi
