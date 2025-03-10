# This is my main environment file. It is included directly via ZSH and
# sourced in `~/.bash_profile`

export CLICOLOR=1
export EDITOR=vim
export GIT_EDITOR="$EDITOR "
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export TERM="xterm-256color"

export PATH="$HOME/.dotfiles/bin:/usr/local/bin:/usr/local/sbin:/usr/sbin:/sbin:/usr/bin:/bin"

if [ "${OSTYPE:0:6}" = darwin ]; then
  if [ "$ZSH_VERSION" ]; then
    # Disable loading global ZSH configs on macOS
    # - /etc/zprofile - sets $PATH via path_helper, which I don't want
    # - /etc/zlogout  - does not exist by default
    # - /etc/zlogin   - does not exist by default
    # - /etc/zshrc    - sets some unnecessary options and terminfo stuff;
    #                   includes /etc/zshrc_Apple_Terminal, which all relates
    #                   to terminal sessions, which I don't use
    unsetopt GLOBAL_RCS

    # Load SSH passphrases from macOS keychain
    (ssh-add --apple-load-keychain -q 2>/dev/null &)
  fi

  # arm64 Homebrew setup (M1)
  # See `brew shellenv`
  if [ -d /opt/homebrew ]; then
    export HOMEBREW_PREFIX="/opt/homebrew"
    export HOMEBREW_CELLAR="/opt/homebrew/Cellar"
    export HOMEBREW_REPOSITORY="/opt/homebrew"
    export MANPATH="/opt/homebrew/share/man${MANPATH+:$MANPATH}:"
    export INFOPATH="/opt/homebrew/share/info:${INFOPATH:-}"
    export PATH="$HOME/.dotfiles/bin:$HOME/.dotfiles/opt/macos-scripts/bin:/opt/homebrew/bin:/opt/homebrew/sbin:/usr/local/bin:/usr/local/sbin:/usr/sbin:/sbin:/usr/bin:/bin"
  fi

  # Disable emoji when installing packages with Homebrew
  export HOMEBREW_NO_EMOJI=1

  # Opt-out of Analytics
  export HOMEBREW_NO_ANALYTICS=1

  # Silence Analytics nags
  export HOMEBREW_NO_ANALYTICS_MESSAGE_OUTPUT=1

  # Disable homebrew autoupdate
  export HOMEBREW_NO_AUTO_UPDATE=1

  # $(sysctl -n hw.ncpu) + 1
  export MAKEFLAGS="-j9"

  # Disable Apple Terminal sessions
  export SHELL_SESSIONS_DISABLE=1

  if [ "$PS1" ]; then
    # Double the amount of open files OS X allows
    ulimit -n 1024
  fi

  # `ls` colors
  #
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

  # Herd injected PHP binary.
  export PATH="$HOME/Library/Application Support/Herd/bin:$PATH"

  # Herd injected PHP 8.4 configuration.
  export HERD_PHP_84_INI_SCAN_DIR="$HOME/Library/Application Support/Herd/config/php/84/"

  # Herd injected PHP 8.3 configuration.
  export HERD_PHP_83_INI_SCAN_DIR="$HOME/Library/Application Support/Herd/config/php/83/"
elif [ "${OSTYPE:0:5}" = linux ]; then
  # Disable weird keyboard bindkey behavior on Ubuntu/Debian
  if [ -f /etc/debian_version ]; then
    export DEBIAN_PREVENT_KEYBOARD_CHANGES=1
  fi

  # Restore `ls` quoting behavior
  export QUOTING_STYLE=literal

  # `ls` colors
  export LS_COLORS="di=1;34:ln=1;36:so=1;35:pi=1;33:ex=1;32:bd=1;33:cd=1;33:su=1;31:sg=1;31:tw=1;34:ow=1;34"

  # CentOS uses an override flag
  export USER_LS_COLORS="$LS_COLORS"

  # Ubuntu's /etc/zshrc tries to initialize completion, skip it
  [ "$ZSH_VERSION" ] && skip_global_compinit=1

  if [ -f /etc/rpi-issue ]; then
    export PATH="$HOME/.dotfiles/opt/rpi-scripts/bin:$PATH"
  fi
fi

# FZF
if command -v fzf > /dev/null; then
  export FZF_DEFAULT_OPTS="--pointer='›' --prompt='› ' --no-mouse --color fg:-1,fg+:4,hl:5,hl+:5,bg:-1,bg+:-1,prompt:4,info:2,marker:3 --bind=ctrl-u:half-page-up,ctrl-d:half-page-down --tiebreak=end,length,index"
  export FZF_DEFAULT_COMMAND="rg --follow --hidden --files --sort-files --glob '!.git'"
fi

# slack-notify
if command -v slack-notify > /dev/null; then
  export SLACK_WEBHOOK_URL="https://slack.priddle.network"
fi

[ "$BASH_VERSION" ] && shell="bash"
[ "$ZSH_VERSION" ]  && shell="zsh"

if [ "$shell" ]; then
  # Direnv
  command -v direnv > /dev/null && eval "$(direnv hook "$shell")"

  # jarvis
  command -v jarvis > /dev/null && eval "$(jarvis init --shell "$shell" -)"

  # a2d
  command -v a2d > /dev/null && eval "$(a2d init --shell "$shell" -)"

  # tat
  command -v tat > /dev/null && eval "$(tat --completions "$shell")"
fi

# PHP
if command -v composer > /dev/null; then
  export PATH="$HOME/.composer/vendor/bin:$PATH"
fi

# Ruby
if [ -f ~/.ruby-version ]; then
  RUBY_VERSION="$(< ~/.ruby-version)"
  export RUBY_VERSION

  if [ -f /opt/homebrew/opt/chruby/share/chruby/chruby.sh ]; then
    source /opt/homebrew/opt/chruby/share/chruby/chruby.sh

    chruby "$RUBY_VERSION"
  else
    lib_version="${RUBY_VERSION%%?}0"
    ruby_home="$HOME/.rubies/ruby-$RUBY_VERSION"

    if [ -d "$ruby_home" ]; then
      export PATH="$HOME/.gem/ruby/$lib_version/bin:$ruby_home/bin:$PATH"

      export GEM_HOME="$HOME/.gem/ruby/$lib_version"
      export GEM_PATH="$GEM_HOME:$ruby_home/lib/ruby/gems/$lib_version"
    fi
    unset lib_version ruby_home
  fi
fi

unset shell

# vim: ft=zsh
