# Requires a gem outside of Bundler.
#
# gem - the gem name
# const - only requires the gem if const is not yet defined
#
# Reference: https://gist.github.com/3894925
def unbundled_require(*gems)
  if defined?(::Bundler)
    gems.each do |gem|
      spec_path = Dir.glob("#{Gem.dir}/specifications/#{gem}-*.gemspec").last

      if spec_path.nil?
        warn "Couldn't find #{gem}. Install it with 'gem install #{gem}'"
        return
      end

      begin
        spec = Gem::Specification.load spec_path
        spec.activate
      rescue Gem::LoadError
        # everything is fine, if we get here it means the gem was already activated
        # somewhere else
      end
    end
  end

  loaded = gems.all? do |gem|
    begin
      require gem
    rescue Exception => err
      warn "Couldn't load #{gem}: #{err}"
    end
  end

  yield if loaded && block_given?
end

unbundled_require 'awesome_print' do
  AwesomePrint.irb!
end
