#!/usr/bin/env bash
# Shrink directory paths, e.g. /home/me/foo/bar/quux -> ~/f/b/quux.
#
# Bash port of zsh/functions/shrink-path. Source this file to define the
# `shrink-path` function, or execute it directly.
#
# For a fish-style working directory in your command prompt:
#
#   PS1='\u@\h $(shrink-path -f)> '
#
# The following options are available:
#
#   -f, --fish       fish simulation, equivalent to -l -s -t.
#   -g, --glob       Add asterisk to allow globbing of shrunk path (equivalent to -e "*")
#   -l, --last [#]   Print the last n directory's full name (default 1).
#   -s, --short      Truncate directory names to the number of characters given by -#. Without
#                    -s, names are truncated without making them ambiguous.
#   -t, --tilde      Substitute ~ for the home directory.
#   -#               Truncate each directory to at least this many characters inclusive of the
#                    ellipsis character(s) (defaulting to 1).
#   -e SYMBOL        Postfix symbol(s) to indicate that a directory name had been truncated.
#   -q, --quote      Quote special characters in the shrunk path
#   -x, --expand     Print the full path. This takes precedence over the other options
#   -v VAR           Assign the result to VAR instead of printing it (no subshell needed)
#
# Differences from the zsh version:
#
#   - No zstyle configuration; options are flags only.
#   - No -T/--nameddirs (bash has no named directories).
#   - ~ is only substituted when $HOME is a full path prefix.
#   - Ellipsis length is counted toward -# as documented (the zsh version
#     referenced an undefined variable, so it never was).
#
# Keywords: prompt directory truncate shrink collapse fish
#
# Original: Copyright (C) 2008 by Daniel Friesel <derf@xxxxxxxxxxxxxxxxxx>
# License: WTFPL <http://www.wtfpl.net>
#
# Ref: https://www.zsh.org/mla/workers/2009/msg00415.html
#      https://www.zsh.org/mla/workers/2009/msg00419.html

shrink-path() {
  local -i lastfull=0 short=0 tilde=0 length=1 quote=0 expand=0
  local ellipsis="" outvar=""

  while [[ $1 == -* ]]; do
    case $1 in
      --)
        shift
        break
        ;;
      -f|--fish)
        lastfull=1
        short=1
        tilde=1
        ;;
      -h|--help)
        cat <<'EOF'
Usage: shrink-path [-f -l -s -t] [directory]
 -f, --fish      fish-simulation, like -l -s -t
 -g, --glob      Add asterisk to allow globbing of shrunk path (equivalent to -e "*")
 -l, --last [#]  Print the last n directory's full name (default 1).
 -s, --short     Truncate directory names to the number of characters given by -#. Without
                 -s, names are truncated without making them ambiguous.
 -t, --tilde     Substitute ~ for the home directory
 -#              Truncate each directory to at least this many characters inclusive of the
                 ellipsis character(s) (defaulting to 1).
 -e SYMBOL       Postfix symbol(s) to indicate that a directory name had been truncated.
 -q, --quote     Quote special characters in the shrunk path
 -x, --expand    Print the full path. This takes precedence over the other options
 -v VAR          Assign the result to VAR instead of printing it
EOF
        return 0
        ;;
      -l|--last)
        lastfull=1
        if [[ -n $2 && $2 != *[!0-9]* ]]; then
          shift
          lastfull=$((10#$1))
        fi
        ;;
      -s|--short) short=1 ;;
      -t|--tilde) tilde=1 ;;
      -[0-9]|-[0-9][0-9])
        length=$((10#${1#-}))
        ;;
      -e)
        shift
        ellipsis=$1
        ;;
      -g|--glob) ellipsis='*' ;;
      -q|--quote) quote=1 ;;
      -x|--expand) expand=1 ;;
      -v)
        shift
        outvar=$1
        ;;
    esac
    shift
  done

  local dir=${1-$PWD}

  [[ -d $dir ]] || { _shrink_path_out "$outvar" ""; return 0; }

  if (( expand )); then
    _shrink_path_out "$outvar" "$dir"
    return 0
  fi

  if (( tilde )) && [[ -n $HOME && ( $dir == "$HOME" || $dir == "$HOME"/* ) ]]; then
    dir="~${dir#"$HOME"}"
  fi

  # Split on "/", dropping empty components
  local -a raw tree=()
  local part
  IFS=/ read -r -a raw <<< "$dir"
  for part in "${raw[@]}"; do
    [[ -n $part ]] && tree+=("$part")
  done

  local result="" base="/"
  if [[ ${tree[0]} == "~" ]]; then
    base=$HOME
    result="~"
    tree=("${tree[@]:1}")
  fi

  # Glob with nullglob on, everything else that affects matching off
  local opt
  local -a saved_shopts=()
  for opt in nullglob failglob nocaseglob dotglob; do
    shopt -q "$opt" && saved_shopts+=("$opt")
  done
  shopt -s nullglob
  shopt -u failglob nocaseglob dotglob

  local -i i dif min=$(( length - ${#ellipsis} )) count
  local -a expn
  while (( ${#tree[@]} )); do
    dir=${tree[0]}

    if (( lastfull && ${#tree[@]} <= lastfull )); then
      local IFS=/
      result+="/${tree[*]}"
      break
    fi

    # Extend the prefix until it is long enough and uniquely identifies dir
    part=""
    i=0
    count=2
    until (( i >= ${#dir} )) || { { (( i >= min )) || [[ $dir == "$part" ]]; } && (( count == 1 )); }; do
      part+=${dir:i:1}
      (( i++ ))
      expn=("${base%/}/$part"*/)
      count=${#expn[@]}
      (( short && i >= min )) && break
    done

    dif=$(( ${#dir} - ${#part} - ${#ellipsis} ))
    if (( dif > 0 )); then
      (( quote )) && printf -v part '%q' "$part"
      part+=$ellipsis
    else
      part=$dir
      (( quote )) && printf -v part '%q' "$part"
    fi

    result+="/$part"
    base="${base%/}/$dir"
    tree=("${tree[@]:1}")
  done

  shopt -u nullglob
  (( ${#saved_shopts[@]} )) && shopt -s "${saved_shopts[@]}"

  _shrink_path_out "$outvar" "${result:-/}"
}

_shrink_path_out() {
  if [[ -n $1 ]]; then
    printf -v "$1" '%s' "$2"
  else
    printf '%s\n' "$2"
  fi
}

if [[ ${BASH_SOURCE[0]} == "$0" ]]; then
  shrink-path "$@"
fi

# vim:ft=bash
