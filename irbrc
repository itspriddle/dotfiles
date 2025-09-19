#!/usr/bin/env ruby

## Prompt
require "irb/completion"

IRB.conf[:SAVE_HISTORY] = 2000
IRB.conf[:EVAL_HISTORY] = 2000
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb_history"
IRB.conf[:AUTO_INDENT]  = true
IRB.conf[:PROMPT_MODE]  = :SIMPLE

unless defined?(IRB_START_TIME)
  ## Sesison duration
  IRB_START_TIME = Time.now

  at_exit do
    duration = -> do
      return unless defined?(IRB_START_TIME) && IRB_START_TIME.is_a?(Time)

      conversions = {
        "days"    => 86400,
        "hours"   => 3600,
        "minutes" => 60,
        "seconds" => 1
      }

      seconds = Time.now.to_i - IRB_START_TIME.to_i

      conversions.map { |unit, value|
        count    = seconds >= value ? seconds / value : 0
        seconds -= count * value

        out = "#{count} #{unit}"
        out = out.chomp("s") if count == 1
        out if count > 0
      }.compact.join(", ")
    end

    puts "\nirb session duration: #{duration.call}"
  end
end

## Extensions
module Kernel
  private

  # Private: Prints the time it takes to run the given block.
  #
  # description - Optional description
  #
  # Example
  #
  #     time { puts :hi }
  #     hi
  #     0.0
  #
  # Returns nothing
  def time(description = nil)
    start       = Time.now
    output      = yield
    elapsed     = Time.now - start

    print "#{description}: " if description
    puts "%.2f" % elapsed
    output
  end

  # Private: Benchmarks code one or more times.
  #
  # times - The number of times to run the code
  #
  # A required block contains the code to run.
  #
  # Example
  #
  #     bm { puts :hi }
  #           user     system      total        real
  #     hi
  #       0.000000   0.000000   0.000000 (  0.000029)
  #
  # Returns the result of the block.
  def bm(times = 1)
    require 'benchmark'
    output = nil
    Benchmark.bm { |x| x.report { times.times { output = yield } } }
    output
  end

  # Private: Searches through IRB history for the given pattern.
  #
  # pattern - Optional String/Regular expression to search for
  #
  # Note: The output of this command will be difficult to read unless you have
  # the awesome_print gem installed.
  #
  # Returns an Array containing each line that matches.
  def history(pattern = nil)
    lines = Readline::HISTORY.to_a
    lines = lines.grep(/#{pattern}/) if pattern

    lines.map { |line| line.chomp }
  end

  # Private: Replays the given command number from IRB command history.
  #
  # number - The command number to run
  #
  # Example
  #
  #     history
  #     [
  #       [0] "puts :hi",
  #       [1] "a = :test"
  #     ]
  #
  #     replay 1 #=> runs `a = :test`
  #
  # Raises IndexError if the given command number is not in IRB command
  # history.
  #
  # Returns the value of the given command
  def replay(number)
    eval history.fetch(number)
  end

  # Private: Enable/disable IRB printing values. By default IRB prints the
  # value of the last line evaluated. This can be disabled, for example, if
  # you are working with a large dataset and don't want it printed to the
  # console.
  #
  # Example
  #
  #     > :one
  #     > #=> :one
  #     > toggle_echo!
  #     > :one
  #
  # Returns a Boolean.
  def toggle_echo!
    irb_context.echo ^= 1
  end

  # Private: Evaluates the given file in the current IRB context. This is
  # essentially `load` in the context of the current IRB session:
  #
  #     File.write("name = :josh", "name.rb")
  #
  #     eval_file "name.rb"
  #
  #     name #=> :josh
  #
  # file - A String filename
  #
  # Returns the last value evaluated in file.
  def eval_file(file)
    irb_context.workspace.binding.eval File.read(file)
  end

  # Private: Copies string to the clipboard. OS X only.
  #
  # str - A String, default is the last item evaluated by IRB
  #
  # Example
  #
  #     pbcopy "Some text"
  #
  #     foo = :bar
  #
  #     pbcopy #=> Copies "bar" to clipboard
  #
  # Returns an IO::Object
  def pbcopy(str = irb_context.last_value)
    IO.popen('pbcopy', 'w') { |f| f << str.to_s }
  end if RUBY_PLATFORM =~ /darwin/

  # Private: Pastes the contents of the clipboard. OS X only.
  #
  # Example
  #
  #     puts "Hi #{pbpaste}"
  #
  # Returns a String.
  def pbpaste
    `pbpaste`
  end if RUBY_PLATFORM =~ /darwin/
end
