# shellcheck shell=bash
if [ "${OSTYPE:0:6}" = darwin ]; then
  # Load SSH passphrases from macOS keychain
  (ssh-add --apple-load-keychain -q 2>/dev/null &)
fi
