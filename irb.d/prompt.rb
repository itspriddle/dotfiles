require 'irb/completion'

IRB.conf[:SAVE_HISTORY] = 2000
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb_history"
IRB.conf[:AUTO_INDENT]  = true

prompt = "#{RUBY_VERSION}"
prompt << "-p#{RUBY_PATCHLEVEL}" if defined? RUBY_PATCHLEVEL

if defined? Rails
  project = `git rev-parse --show-toplevel 2> /dev/null`.strip
  prompt  = "#{File.basename(project)} (#{prompt.strip}) " if project != ""
end

IRB.conf[:PROMPT] ||= {}
IRB.conf[:PROMPT][:JOSH] = {
  :PROMPT_I => "#{prompt}> ",
  :PROMPT_S => "#{prompt}* ",
  :PROMPT_C => "#{prompt}? ",
  :RETURN   => "=> %s\n"
}

IRB.conf[:PROMPT_MODE] = :JOSH
