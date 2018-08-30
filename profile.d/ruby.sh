RUBY_VERSION="$(< ~/.dotfiles/ruby-version)"
export RUBY_VERSION

if [ -f /usr/local/opt/chruby/share/chruby/chruby.sh ]; then
  source /usr/local/opt/chruby/share/chruby/chruby.sh
  [ -f ~/.config/chruby-auto-enabled ] && source /usr/local/opt/chruby/share/chruby/auto.sh
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

alias ruby-install-default="ruby-install --src-dir ~/work/src --cleanup ruby \$RUBY_VERSION -- --disable-install-rdoc"
alias chruby-auto-enable="touch ~/.config/chruby-auto-enabled"
alias chruby-auto-disable="/bin/rm -f ~/.config/chruby-auto-enabled"

# vim:set ft=sh:
