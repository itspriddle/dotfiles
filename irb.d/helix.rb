require_relative "on_load"

IRB.on_load do
  if defined?(HelixCore)
    require "helix_core/testing/factory_girl"
  end
end
