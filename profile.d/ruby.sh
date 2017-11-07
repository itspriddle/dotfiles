export RUBY_VERSION=2.4.1

if [ -f /usr/local/opt/chruby/share/chruby/chruby.sh ]; then
  source /usr/local/opt/chruby/share/chruby/chruby.sh
  # source /usr/local/opt/chruby/share/chruby/auto.sh
  chruby $RUBY_VERSION
else
  lib_version="${RUBY_VERSION%%?}0"

  if [ -d "$HOME/.rubies/ruby-$RUBY_VERSION" ]; then
    PATH="$HOME/.gem/ruby/$lib_version/bin:$HOME/.rubies/ruby-$RUBY_VERSION/bin:$PATH"

    export GEM_HOME=$HOME/.gem/ruby/$lib_version
    export GEM_PATH=$HOME/.gem/ruby/$lib_version:$HOME/.rubies/ruby-$RUBY_VERSION/lib/ruby/gems/$lib_version
  fi
  unset lib_version
fi


alias ruby-install-default="ruby-install --src-dir $HOME/work/src --cleanup ruby $RUBY_VERSION -- --disable-install-rdoc"

# vim:set ft=sh:
