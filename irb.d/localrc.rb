# Load local irbrc file if it exists (and is not this file)
localrc = File.expand_path(".irbrc")
if File.exists?(localrc) && localrc != File.expand_path(__FILE__)
  load localrc
end
