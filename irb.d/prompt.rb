require "irb/completion"

IRB.conf[:SAVE_HISTORY] = 2000
IRB.conf[:EVAL_HISTORY] = 2000
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb_history"
IRB.conf[:AUTO_INDENT]  = true
IRB.conf[:PROMPT_MODE]  = :SIMPLE
