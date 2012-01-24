new_paths=(
  $HOME/.dotfiles/bin
  $HOME/.dotfiles/private-bin
  /opt/local/bin
)

for p in "${new_paths[@]}"
do
  [[ -d $p ]] && export PATH="$p:$PATH"
done

source $HOME/.bashrc

# vim:set ft=sh:
