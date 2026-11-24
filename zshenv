# This is my main environment file. It is included directly via ZSH and
# sourced in `~/.bash_profile`

export CLICOLOR=1
export EDITOR=vim
export GIT_EDITOR="$EDITOR "
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export TERM="xterm-256color"

export PATH="/usr/local/bin:/usr/local/sbin:/usr/sbin:/sbin:/usr/bin:/bin"

[ "$ZSH_VERSION" ] && __shell=zsh
[ "$BASH_VERSION" ] && __shell=bash

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
  fi

  # arm64 Homebrew setup (M1)
  # See `brew shellenv`
  if [ -d /opt/homebrew ]; then
    export HOMEBREW_PREFIX="/opt/homebrew"
    export HOMEBREW_CELLAR="/opt/homebrew/Cellar"
    export HOMEBREW_REPOSITORY="/opt/homebrew"
    export HOMEBREW_NO_ASK=1
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

  # Disable Apple Terminal sessions
  export SHELL_SESSIONS_DISABLE=1

  if [ "$PS1" ]; then
    # Double the amount of open files OS X allows
    ulimit -n 1024
  fi

  # `ls` colors
  #
  # Ex - bold blue, directory
  # Gx - bold cyan, symlink
  # Fx - bold magenta, socket
  # Dx - bold brown, pipe
  # Cx - bold green, executable
  # Dx - bold brown, block special
  # Dx - bold brown, character special
  # Bx - bold red, setuid executable
  # Bx - bold red, setgid executable
  # Ex - bold blue, dir writable to others with sticky bit
  # Ex - bold blue, dir writable to others no sticky
  # xx - normal, dataless file (i.e. iCloud off-loaded files)
  export LSCOLORS=ExGxFxDxCxDxDxBxBxExExxx

  # `grep` colors
  #
  # 1;35 : bold magenta
  export GREP_COLOR='1;35'

  if [ -d "$HOME/.local/bin" ]; then
    export PATH="$HOME/.local/bin:$PATH"
  fi

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
  #
  # bd=1;33 - (bold yellow) Block (buffered) special file
  # ca      - file with capability
  # cd=1;33 - (bold yellow) Character (unbuffered) special file
  # di=1;34 - (bold blue) Directory
  # do      - door (solaris)
  # ex=1;32 - (bold green) File which is executable (ie. has 'x' set in permissions).
  # fi      - File
  # ln=1;36 - (bold cyan) Symbolic Link
  # mh      - multi-hardlink
  # mi      - Non-existent file pointed to by a symbolic link (visible when you type ls -l)
  # or      - Symbolic Link pointing to a non-existent file (orphan)
  # ow=1;34 - (bold blue) other-writable directory
  # pi=1;33 - (bold yellow) Fifo file
  # rs      - reset to no color
  # sg=1;31 - (bold red) set-group-ID
  # so=1;35 - (bold magenta) Socket file
  # st      - sticky directory
  # su=1;31 - (bold red) set-user-ID
  # tw=1;34 - (bold blue) stick and other-writable directory
  export LS_COLORS="di=1;34:ln=1;36:so=1;35:pi=1;33:ex=1;32:bd=1;33:cd=1;33:su=1;31:sg=1;31:tw=1;34:ow=1;34"

  # CentOS uses an override flag
  export USER_LS_COLORS="$LS_COLORS"

  # `grep` colors
  #
  # ms=01;35   : (bold magenta) match selected for highlighting
  # mc=01;35   : (bold magenta) match selected for highlighting (continued)
  # sl=        : selected line
  # cx=        : context line
  # fn=35      : file name
  # ln=32      : line number
  # bn=32      : byte offset
  # se=36      : separator
  export GREP_COLORS='ms=01;35:mc=01;35:sl=:cx=:fn=35:ln=32:bn=32:se=36'

  # Ubuntu's /etc/zshrc tries to initialize completion, skip it
  # shellcheck disable=2034
  [ "$ZSH_VERSION" ] && skip_global_compinit=1

  if [ -f /etc/rpi-issue ]; then # Raspberry Pi
    export PATH="$HOME/.dotfiles/opt/rpi-scripts/bin:$PATH"
  elif [ -d /usr/syno ]; then # Synology
    export PATH="/usr/syno/sbin:/usr/syno/bin:$PATH"
  fi

  if [ -d "$HOME/.local/bin" ]; then
    export PATH="$HOME/.local/bin:$PATH"
  fi
fi

# atuin.sh
if command -v atuin > /dev/null; then
  eval "$(atuin init "$__shell" --disable-up-arrow --disable-ctrl-r)"
fi

# Direnv
if command -v direnv > /dev/null; then
  eval "$(direnv hook "$__shell")"
fi

# FZF
if command -v fzf > /dev/null; then
  # Solarized light
  #   --color border:7
  #
  # Solarized Dark
  #   --color border:0
  export FZF_DEFAULT_OPTS="
    --pointer '›'
    --prompt '› '
    --marker-multi-line ' › '
    --marker '› '
    --scrollbar '❚'
    --color 16
    --color fg:-1,fg+:4
    --color hl:5,hl+:5
    --color bg:8,header-bg:-1
    --color border:240:dim
    --color info:5
    --bind ctrl-u:half-page-up,ctrl-d:half-page-down
    --bind change:first
    --style full
    --height ~100%
    --min-height 10+
  "

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

# gh - don't track
if command -v gh > /dev/null; then
  export GH_TELEMETRY=false
  export DO_NOT_TRACK=true
fi

# jq colors (solarized dark)
if command -v jq > /dev/null; then
  # null        - dim
  # false       - magenta
  # true        - magenta
  # numbers     - violet
  # strings     - cyan
  # arrays      - bold normal
  # objects     - bold normal
  # object keys - bold blue
  export JQ_COLORS="0;02:0;35:0;35:0;95:0;36:1;01:1;01:1;34"
fi

# mise.en.dev
if command -v mise > /dev/null; then
  eval "$("$HOME/.local/bin/mise" activate "$__shell")"
fi

# 1password cli
if [ -f "$HOME/.config/op/plugins.sh" ]; then
  # shellcheck disable=1091
  source "$HOME/.config/op/plugins.sh"
fi

# pnpm
if [ -d "$HOME/Library/pnpm" ]; then
  export PNPM_HOME="$HOME/Library/pnpm"

  case ":$PATH:" in
    ":$PNPM_HOME/bin:"*) ;;
    *) export PATH="$PNPM_HOME/bin:$PATH" ;;
  esac
fi

# Ripgrep
if command -v rg > /dev/null && [ -f "$HOME/.ripgreprc" ]; then
  export RIPGREP_CONFIG_PATH="$HOME/.ripgreprc"
fi

# Rust
if [ -f "$HOME/.cargo/env" ]; then
  # shellcheck disable=1091
  source "$HOME/.cargo/env"
fi

if [ "$ZSH_VERSION" ]; then
  export ZSHZ_TILDE=1
fi

# PHP (Yerd)
if [ "${OSTYPE:0:6}" = darwin ] && [ -d "$HOME/Library/Application Support/io.yerd.Yerd" ]; then
  case ":$PATH:" in
    *":$HOME/Library/Application Support/io.yerd.Yerd/bin:"*) ;;
    *) export PATH="$HOME/Library/Application Support/io.yerd.Yerd/bin:$PATH" ;;
  esac

  export PHPRC="$HOME/Library/Application Support/io.yerd.Yerd/php-cli.ini"
fi

# PHP (Composer)
if command -v composer > /dev/null; then
  export PATH="$HOME/.composer/vendor/bin:$PATH"
fi

# Ruby (chruby)
if [ -f ~/.ruby-version ] && [ -f "$HOMEBREW_PREFIX/opt/chruby/share/chruby/chruby.sh" ]; then
  RUBY_VERSION="$(< ~/.ruby-version)"
  export RUBY_VERSION

  # shellcheck disable=1091
  source "$HOMEBREW_PREFIX/opt/chruby/share/chruby/chruby.sh"

  chruby "$RUBY_VERSION"
fi

# vite+
if [ -f "$HOME/.config/vite-plus/env" ]; then
  # shellcheck disable=1091
  source "$HOME/.config/vite-plus/env"
fi

# Claude
if command -v claude > /dev/null; then
  # Disable feedback survey prompts
  export CLAUDE_CODE_DISABLE_FEEDBACK_SURVEY=1

  # Subagents can't spawn subagents
  export CLAUDE_CODE_MAX_SUBAGENT_SPAWN_DEPTH=1

  # Limit max concurrent subagents
  export CLAUDE_CODE_MAX_CONCURRENT_SUBAGENTS=5
fi

unset __shell

# And my bin takes top priority
export PATH="$HOME/.dotfiles/bin:$PATH"

# vim: ft=bash
