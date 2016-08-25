# Usage:
#
#   brew tap homebrew/bundle
#   brew bundle

# Taps
tap "homebrew/services"
tap "homebrew/versions"
tap "itspriddle/brews"
tap "argon/mas"

# Ruby/Rails apps
brew "ansible"
brew "awscli"
brew "dwdiff"
brew "imagemagick"
brew "itspriddle/brews/legacy-phantomjs"
brew "mailhog"
brew "pow"
brew "redis"
brew "ruby-install"

# PHP
brew "itspriddle/brews/composer"
brew "itspriddle/brews/wp-cli"

# Databases
brew "mariadb"
brew "homebrew/versions/postgresql94"

# Utilities
brew "argon/mas/mas"
brew "bats"
brew "fzf"
brew "gist"
brew "git"
brew "git-lfs"
brew "gnupg"
brew "hub"
brew "jq"
brew "keybase"
brew "rename"
brew "shellcheck"
brew "speedtest_cli"
brew "ssh-copy-id"
brew "the_silver_searcher"
brew "tree"
brew "vim"
brew "vnstat"
brew "wget"
brew "zsh"

# Mac App Store apps
mas "1Password",      id: 443987910
mas "Amphetamine",    id: 937984704
mas "Deliveries",     id: 924726344
mas "Marked 2",       id: 890031187
mas "Numbers",        id: 409203825
mas "Pages",          id: 409201541
mas "Pixelmator",     id: 407963104
mas "Slack",          id: 803453959
mas "The Unarchiver", id: 425424353
mas "Tweetbot",       id: 557168941

# Setup Postgres if needed
unless system "psql #{ENV["USER"]} -c '' 2> /dev/null"
  system "initdb $(brew --prefix)/var/postgres -E utf8"
  system "createdb #{ENV["USER"]}"
end
