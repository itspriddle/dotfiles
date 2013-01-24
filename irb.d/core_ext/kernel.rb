module Kernel
  # run benchmarks: time { do something }
  def time(times = 1)
    require 'benchmark'
    ret = nil
    Benchmark.bm { |x| x.report { times.times { ret = yield } } }
    ret
  end

  def copy(str)
    IO.popen('pbcopy', 'w') { |f| f << str.to_s }
  end

  def paste
    `pbpaste`
  end
end
