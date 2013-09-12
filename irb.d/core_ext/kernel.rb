module Kernel
  private

  # Private: Benchmarks code one or more times.
  #
  # times - The number of times to run the code
  #
  # A required block contains the code to run.
  #
  # Example
  #
  #     time { puts :hi }
  #           user     system      total        real
  #     hi
  #       0.000000   0.000000   0.000000 (  0.000029)
  #
  # Returns the result of the block.
  def time(times = 1)
    require 'benchmark'
    ret = nil
    Benchmark.bm { |x| x.report { times.times { ret = yield } } }
    ret
  end

  # Private: Searches through IRB history for the given pattern.
  #
  # pattern - A String/Regular expression to search for
  #
  # Returns an Array containing each line that matches.
  def history(pattern)
    File.read(IRB.conf[:HISTORY_FILE]).lines.grep(/#{pattern}/).map do |line|
      line.chomp
    end
  end

  # Private: Copies string to the clipboard. OS X only.
  #
  # str - A String
  #
  # Example
  #
  #     copy "Some text"
  #
  # Returns an IO::Object
  def copy(str)
    IO.popen('pbcopy', 'w') { |f| f << str.to_s }
  end if RUBY_PLATFORM =~ /darwin/

  # Private: Pastes the contents of the clipboard. OS X only.
  #
  # Example
  #
  #     puts "Hi #{paste}"
  #
  # Returns a String.
  def paste
    `pbpaste`
  end if RUBY_PLATFORM =~ /darwin/
end
