#!/usr/bin/env bash

if ! test -x "$(command -v brew || true)"; then
  echo "Install Homebrew first!"
  exit 1
fi

brew install gist
brew install git
brew install gnupg
brew install hub
brew install imagemagick
brew install macvim
brew install mysql
brew install node
brew install phantomjs
brew install rbenv
brew install redis
brew install rename
brew install ruby-build
brew install the_silver_searcher
brew install tree
brew install vnstat
brew install wget

# Custom brews
brew tap itspriddle/homebrew-site5
brew install zone2sql
brew install phpunit

# Homebrew Casks
brew tap phinze/homebrew-cask
brew cask install app-cleaner
brew cask install bit-torrent-sync
brew cask install dropbox
brew cask install launch-bar
brew cask install one-password
brew cask install transmission
brew cask install vlc
brew cask install xscope
