export CLICOLOR=1
export EDITOR=vim
export GIT_EDITOR="$EDITOR "
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export TERM="xterm-256color"

PATH="${HOME}/.dotfiles/bin:/usr/local/bin:/usr/local/sbin:/usr/local/share/npm/bin:/usr/sbin:/sbin:/usr/bin:/bin"

if [ "${OSTYPE:0:6}" = darwin ]; then
  # Disable emoji when installing packages with Homebrew
  export HOMEBREW_NO_EMOJI=1

  # $(sysctl -n hw.ncpu) + 1
  export MAKEFLAGS="-j9"

  # Add Postgres.app bin to PATH
  PATH="/Applications/Postgres.app/Contents/Versions/9.4/bin:${PATH}"

  # Double the amount of open files OS X allows
  ulimit -n 1024
fi

export PATH

# Clear PROMPT_COMMAND, avoids "command not found" errors when using `sh`.
unset PROMPT_COMMAND

# Disable flow control and allow binding ^q and ^s
stty -ixon -ixoff
