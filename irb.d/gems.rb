# Internal: Requires a gem outside of Bundler. This can be used to globally
# require gems in `~/.irbrc`, regardless of if they are present in an
# application's bundle.
#
# name  - The name of the gem to require
# block - An optional block that will be called after the gem is required.
#
# Set NO_UNBUNDLED_REQUIRE=1 when starting a console to skip requiring these
# gems, eg:
#
#   NO_UNBUNDLED_REQUIRE=1 irb
#   NO_UNBUNDLED_REQUIRE=1 rails console
#
# Reference: https://gist.github.com/3894925
unbundled_require = -> name, &block do
  return if ENV["NO_UNBUNDLED_REQUIRE"]

  if defined? Bundler
    unless spec_path = Dir["#{Gem.dir}/specifications/#{name}-*.gemspec"].last
      warn "Couldn't find #{name}. Install it with 'gem install #{name}'"
      return
    end

    begin
      Gem::Specification.load(spec_path).activate
    rescue Gem::LoadError
      # everything is fine, if we get here it means the gem was already
      # activated somewhere else
    end
  end

  begin
    require name
    block.call if block
  rescue Exception => err
    warn "Couldn't load #{name}: #{err}"
  end
end

unbundled_require.call 'awesome_print' do
  AwesomePrint.irb!
end
