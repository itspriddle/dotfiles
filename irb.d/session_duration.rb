IRB_START_TIME = Time.now
at_exit { puts "\n#{IRB.session_duration}" }

module IRB
  def self.session_duration
    return unless defined?(IRB_START_TIME) && IRB_START_TIME.is_a?(Time)

    seconds = Time.now.to_i - IRB_START_TIME.to_i
    mins    = (seconds.to_f / 60.0).floor

    if mins.to_f >= 60
      hours = (mins.to_f / 60).floor
      mins  = (mins.to_f - (hours.to_f * 60.0))
    end

    if hours.to_f >= 24
      days  = (hours.to_f / 24.0).floor
      hours = (hours.to_f % 24.0).floor
    end

    if days.to_f >= 7
      weeks = (days.to_f / 7).floor
      days  = (days - (weeks * 7)).floor
    end

    secs = (seconds % 60).floor

    out = []
    out << "#{weeks.to_i} week#{weeks > 1 ? 's' : ''}"  unless weeks.nil? or weeks.to_i == 0
    out << "#{days.to_i} day#{days > 1 ? 's' : ''}"     unless days.nil?  or days.to_i == 0
    out << "#{hours.to_i} hour#{hours > 1 ? 's' : ''}"  unless hours.nil? or hours.to_i == 0
    out << "#{mins.to_i} minute#{mins > 1 ? 's' : ''}"  unless mins.nil?  or mins.to_i == 0

    sec_stamp = "#{secs.to_i} second#{secs == 1 ? '' : 's'}"

    label = 'irb session duration: '

    if out.size == 0
      label << sec_stamp
    else
      label << out.join(', ') + " and #{sec_stamp}"
    end
  end
end
