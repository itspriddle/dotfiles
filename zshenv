# enable colored output from ls, etc

export CLICOLOR=1
export TERM='xterm-color'
export GITIGNORE='[^.]*'
export LSCOLORS=ExGxFxdxCxDxDxBxBxExEx
export EDITOR='mvim -R'
export NODE_PATH="/opt/local/lib/node"
export TIMEFMT=$'\n\`%J\`\nexecution time:\nreal\t%E\nuser\t%U\nsys\t%S\ncpu\t%P\n'
export ANDROID_SDK="/opt/android-sdk"

for another_bin in \
  /opt/android-sdk/bin \
  /opt/android-sdk/tools \
  /opt/android-sdk/platforms/android-7/tools \
  /opt/local/bin \
  /opt/local/share/npm/bin \
  $HOME/Library/dotfiles/bin \
  $HOME/Library/dotfiles/private-bin
do
  [[ -e $another_bin ]] && export PATH=$another_bin:$PATH
done

# vim:set ft=zsh:
