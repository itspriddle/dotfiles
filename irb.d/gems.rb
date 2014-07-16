# Internal: Requires a gem outside of Bundler. This can be used to globally
# require gems in `~/.irbrc`, regardless of if they are present in an
# application's bundle.
#
# name  - The name of the gem to require
# block - An optional block that will be called after the gem is required.
#
# Reference: https://gist.github.com/3894925
def unbundled_require(name)
  if defined? Bundler
    unless spec_path = Dir["#{Gem.dir}/specifications/#{name}-*.gemspec"].last
      warn "Couldn't find #{name}. Install it with 'name install #{name}'"
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
    yield if block_given?
  rescue Exception => err
    warn "Couldn't load #{name}: #{err}"
  end
end
private :unbundled_require

unbundled_require 'awesome_print' do
  AwesomePrint.irb!
end

# Cleanup your mess.
undef :unbundled_require
