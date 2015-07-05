ruby_version="ruby-2.1.6"
# ruby_version="ruby-2.2.2"
lib_version=${ruby_version##ruby-}
lib_version="${lib_version%%?}0"

if [ -d "$HOME/.rubies/$ruby_version" ]; then
  PATH="$HOME/.gem/ruby/$lib_version/bin:$HOME/.rubies/$ruby_version/bin:$PATH"

  export GEM_HOME=$HOME/.gem/ruby/$lib_version
  export GEM_PATH=$HOME/.gem/ruby/$lib_version:$HOME/.rubies/$ruby_version/lib/ruby/gems/$lib_version
fi

alias trust-binstubs="mkdir .git/safe"

alias ruby-install-default="ruby-install --src-dir $HOME/work/src --cleanup ruby ${ruby_version##ruby-} -- --disable-install-rdoc"

# Run `trust-binstubs` in the root of repositories you trust
export PATH=".git/safe/../../bin:.git/safe/../../.bundle/bin:$PATH"

unset ruby_version lib_version

# vim:set ft=sh:
