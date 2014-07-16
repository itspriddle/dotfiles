# IRB load hooks
#
# IRB allows a proc to be assigned to `IRB.conf[:IRB_RC]` which will be run
# when IRB is fully loaded. This module allows multiple procs to be setup.
#
# For example, a per-project `.irbrc` file can be created with initialization
# code that is run when a console is opened:
#
#     # some_project/.irbrc
#     IRB.on_load do
#       SomeProject.init!
#     end
module IRB
  # Public: List of hooks to run when IRB is fully initialized.
  #
  # Returns an Array.
  def self.hooks
    @hooks ||= []
  end

  # Public: Adds the given block to the list of hooks to run when IRB is
  # initialized.
  #
  # Raises `ArgumentError` if a block is not supplied.
  #
  # Returns the hooks Array.
  def self.on_load
    hooks << Proc.new
  end

  # Public: Runs any hooks. Each item is removed from the hooks array as it is
  # run.
  #
  # Returns nothing.
  def self.run_onload!
    hooks.shift.call while hooks.any?
  end
end

# By default IRB only loads `$PWD/.irbrc` OR `$HOME/.irbrc`, but not both.
# This ensures both are loaded if found. Only load `$PWD/.irbrc` file if it
# exists and is not the same file as `$HOME/.irbrc`
localrc  = File.expand_path(".irbrc")
globalrc = File.expand_path("~/.irbrc")

load localrc if File.exists?(localrc) && localrc != globalrc

# Configure IRB to run any `IRB.hooks` when connected
IRB.conf[:IRB_RC] = Proc.new do
  IRB.run_onload!
end
