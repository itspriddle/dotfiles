# This is my main environment file. It is included directly via ZSH and
# sourced in `~/.bash_profile`

export CLICOLOR=1
export EDITOR=vim
export GIT_EDITOR="$EDITOR "
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export TERM="xterm-256color"

export PATH="/usr/local/bin:/usr/local/sbin:/usr/sbin:/sbin:/usr/bin:/bin"

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
    export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"
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

  # Final macOS paths
  export PATH="$HOME/.dotfiles/opt/macos-scripts/bin:$PATH"
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
  # Old
  # --color gutter:1,marker:3,prompt:5,info:3,pointer:5,border:0
  # --tiebreak end,length,index
  #
  # Solarized light
  #   --color border:7
  #
  # Solarized Dark
  #   --color border:0
  export FZF_DEFAULT_OPTS="
    --pointer '›'
    --prompt '› '
    --no-mouse
    --marker-multi-line ' › '
    --marker '› '
    --scrollbar '❚'
    --color 16
    --color fg:-1,fg+:4
    --color hl:5,hl+:5
    --color bg:-1,bg+:-1,header-bg:-1
    --color border:0
    --color info:10
    --bind ctrl-u:half-page-up,ctrl-d:half-page-down
    --bind change:first
    --style full
    --height ~100%
    --min-height 10+
  "

  # export FZF_DEFAULT_COMMAND='fd --type f --strip-cwd-prefix --hidden --follow --exclude .git'
  export FZF_DEFAULT_COMMAND="rg --follow --hidden --files --sort-files --glob '!.git'"

  export FZF_CTRL_T_OPTS="
    --layout default
    --bind 'ctrl-v:become(vim {} < /dev/tty > /dev/tty)'
  "

  export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

  export FZF_CTRL_R_OPTS="
    --layout default
    --bind tab:first,shift-tab:last
  "

  export FZF_COMPLETION_OPTS="
    --layout default
  "
fi

# jq colors (solarized dark)
if command -v jq > /dev/null; then
  export JQ_COLORS="0;02:0;35:0;35:0;36:0;92:1;39:1;39:1;34"
fi

# slack-notify
if command -v slack-notify > /dev/null; then
  export SLACK_WEBHOOK_URL="https://slack.priddle.network"
fi

# Direnv
if command -v direnv > /dev/null; then
  eval "$(direnv hook "${ZSH_VERSION+zsh}${BASH_VERSION+bash}")"
fi

if [ "$ZSH_VERSION" ]; then
  export ZSHZ_TILDE=1
fi

# tat
if command -v tat > /dev/null; then
  eval "$(tat --completions "${ZSH_VERSION+zsh}${BASH_VERSION+bash}")"
fi

# PHP
if [ "${OSTYPE:0:6}" = darwin ] && [ -d "$HOME/Library/Application Support/Herd" ]; then
  # Herd injected PHP binary.
  export PATH="$HOME/Library/Application Support/Herd/bin:$PATH"

  # Herd injected PHP 8.5 configuration.
  export HERD_PHP_84_INI_SCAN_DIR="$HOME/Library/Application Support/Herd/config/php/84/:$HOME/.dotfiles/share/php/"

  # Herd injected PHP 8.4 configuration.
  export HERD_PHP_84_INI_SCAN_DIR="$HOME/Library/Application Support/Herd/config/php/84/:$HOME/.dotfiles/share/php/"

  # Herd injected PHP 8.3 configuration.
  export HERD_PHP_83_INI_SCAN_DIR="$HOME/Library/Application Support/Herd/config/php/83/:$HOME/.dotfiles/share/php/"
fi

if command -v composer > /dev/null; then
  export PATH="$HOME/.composer/vendor/bin:$PATH"
fi

# Ruby
if [ -f ~/.ruby-version ] && [ -f "$HOMEBREW_PREFIX/opt/chruby/share/chruby/chruby.sh" ]; then
  RUBY_VERSION="$(< ~/.ruby-version)"
  export RUBY_VERSION

  source "$HOMEBREW_PREFIX/opt/chruby/share/chruby/chruby.sh"

  chruby "$RUBY_VERSION"
fi

# And my bin takes top priority
export PATH="$HOME/.dotfiles/bin:$PATH"

# vim: ft=bash
