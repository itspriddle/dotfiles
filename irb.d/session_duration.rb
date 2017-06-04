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
