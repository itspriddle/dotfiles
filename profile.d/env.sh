export CLICOLOR=1
export EDITOR=vim
export GIT_EDITOR="$EDITOR "
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export TERM="xterm-256color"

export PATH="${HOME}/.dotfiles/bin:/usr/local/bin:/usr/local/sbin:/usr/sbin:/sbin:/usr/bin:/bin"

if [ "${OSTYPE:0:6}" = darwin ]; then
  # Disable emoji when installing packages with Homebrew
  export HOMEBREW_NO_EMOJI=1

  # Opt-out of Analytics
  export HOMEBREW_NO_ANALYTICS=1

  # Disable homebrew autoupdate
  export HOMEBREW_NO_AUTO_UPDATE=1

  # $(sysctl -n hw.ncpu) + 1
  export MAKEFLAGS="-j9"

  # Load PHP ini files in ~/.dotfiles/src/php
  export PHP_INI_SCAN_DIR="${HOME}/.dotfiles/src/php"

  if [ "$PS1" ]; then
    # Double the amount of open files OS X allows
    ulimit -n 1024
  fi
elif [ "${OSTYPE:0:5}" = "linux" ]; then
  # Disable weird keyboard bindkey behavior on Ubuntu/Debian
  if [ -f /etc/debian_version ]; then
    export DEBIAN_PREVENT_KEYBOARD_CHANGES=1
  fi

  # Restore `ls` quoting behavior
  export QUOTING_STYLE=literal
fi

if [ "$PS1" ]; then
  # Disable flow control and allow binding ^q and ^s
  stty -ixon -ixoff
fi

# `ls` colors
if [ "${OSTYPE:0:6}" = "darwin" ]; then
  # "Ex": bold blue, directory
  # "Gx": bold cyan, symlink
  # "Fx": bold magenta, socket
  # "Dx": bold brown, pipe
  # "Cx": bold green, executable
  # "Dx": bold brown, block special
  # "Dx": bold brown, character special
  # "Bx": bold red, setuid executable
  # "Bx": bold red, setgid executable
  # "Ex": bold blue, dir writable to others with sticky bit
  # "Ex": bold blue, dir writable to others no sticky
  export LSCOLORS=ExGxFxDxCxDxDxBxBxExEx
elif [ "${OSTYPE:0:5}" = "linux" ]; then
  export LS_COLORS="di=1;34;27:ln=1;36;27:so=1;35;27:pi=33;27:ex=1;32;27:bd=1;33;27:cd=1;33;27:su=1;31;27:sg=1;31;27:tw=1;34;27:ow=1;34;27:"
fi

# FZF
export FZF_DEFAULT_OPTS="--no-mouse --color fg:-1,fg+:4,hl:5,hl+:5,bg:-1,bg+:-1,prompt:4,info:2,marker:3 --bind=ctrl-u:half-page-up,ctrl-d:half-page-down"
export FZF_DEFAULT_COMMAND="rg --follow --hidden --files --sort-files --glob '!.git'"

# Ruby
RUBY_VERSION="$(< ~/.dotfiles/ruby-version)"
export RUBY_VERSION

if [ -f /usr/local/opt/chruby/share/chruby/chruby.sh ]; then
  source /usr/local/opt/chruby/share/chruby/chruby.sh
  # [ -f ~/.config/chruby-auto-enabled ] && source /usr/local/opt/chruby/share/chruby/auto.sh
  chruby "$RUBY_VERSION"
else
  lib_version="${RUBY_VERSION%%?}0"
  ruby_home="$HOME/.rubies/ruby-$RUBY_VERSION"

  if [ -d "$ruby_home" ]; then
    PATH="$HOME/.gem/ruby/$lib_version/bin:$ruby_home/bin:$PATH"

    export GEM_HOME="$HOME/.gem/ruby/$lib_version"
    export GEM_PATH="$GEM_HOME:$ruby_home/lib/ruby/gems/$lib_version"
  fi
  unset lib_version ruby_home
fi


[ "${BASH_VERSION}" ] && shell="bash"
[ "${ZSH_VERSION}" ]  && shell="zsh"

if [ "${shell}" ]; then
  # Direnv
  command -v direnv > /dev/null && eval "$(direnv hook "${shell}")"

  # jarvis
  command -v jarvis > /dev/null && eval "$(jarvis init --shell "${shell}" -)"

  # hub
  command -v hub > /dev/null && eval "$(hub alias -s "${shell}")"

  # a2d
  command -v a2d > /dev/null && eval "$(a2d init --shell "${shell}" -)"
fi

# BROWSER, used by `hub pull-request`
if [ "$SSH_CONNECTION" ]; then
  export BROWSER=echo
fi

# Private ENV vars, this file is ignored by git
if [ -f "$(dirname "$0")/env-private.sh" ]; then
  source "$(dirname "$0")/env-private.sh"
fi
