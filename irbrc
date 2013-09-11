#!/usr/bin/env ruby
path = File.join(File.readlink(__FILE__), '..', 'irb.d')
path = File.expand_path(path, File.dirname(__FILE__))

Dir["#{path}/**/*.rb"].each do |file|
  begin
    require file
  rescue Exception => err
    warn "Couldn't load #{file}: #{err}"
  end
end
