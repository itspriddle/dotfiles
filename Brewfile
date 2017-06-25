# Usage:
#
#   brew tap homebrew/bundle
#   brew bundle

# Taps
tap "argon/mas"
tap "homebrew/services"
tap "itspriddle/brews"
tap "universal-ctags/universal-ctags"

# Ruby/Rails apps
brew "ansible"
brew "awscli"
brew "chruby"
brew "dwdiff"
brew "imagemagick"
brew "mailhog"
brew "pow"
brew "redis"
brew "ruby-install"

# PHP
brew "itspriddle/brews/composer"
brew "itspriddle/brews/wp-cli"

# Databases
brew "mariadb"
brew "postgresql@9.4"

# Utilities
brew "argon/mas/mas"
brew "bats"
brew "exiftool"
brew "fzf"
brew "gist"
brew "git"
brew "git-lfs"
brew "gnupg2"
brew "hub"
brew "itspriddle/brews/vim"
brew "jq"
brew "keybase"
brew "rename"
brew "shellcheck"
brew "speedtest_cli"
brew "ssh-copy-id"
brew "terminal-notifier"
brew "the_silver_searcher"
brew "tree"
brew "universal-ctags"
brew "vnstat"
brew "wget"
brew "youtube-dl"
brew "zsh"

# Mac App Store apps
mas "1Password",         id: 443987910
mas "Affinity Designer", id: 824171161
mas "Affinity Photo",    id: 824183456
mas "Amphetamine",       id: 937984704
mas "Deliveries",        id: 924726344
mas "Magnet",            id: 441258766
mas "Marked 2",          id: 890031187
mas "Numbers",           id: 409203825
mas "Pages",             id: 409201541
mas "Paws for Trello",   id: 1124077199
mas "Pixelmator",        id: 407963104
mas "Slack",             id: 803453959
mas "The Unarchiver",    id: 425424353
mas "Tweetbot",          id: 557168941
mas "iA Writer",         id: 775737590

# Setup Postgres if needed
unless system "psql #{ENV["USER"]} -c '' 2> /dev/null"
  system "initdb $(brew --prefix)/var/postgres -E utf8"
  system "createdb #{ENV["USER"]}"
end
