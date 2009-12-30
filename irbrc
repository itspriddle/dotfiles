#!/usr/bin/ruby
require 'rubygems'
require 'irb/completion'
require 'irb/ext/save-history'

# Colorize
require 'wirble'
#Wirble.init          # This causes problems when exiting IRB
Wirble.colorize

IRB.conf[:SAVE_HISTORY] = 2000
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb_history"

IRB.conf[:PROMPT_MODE] = :SIMPLE

IRB.conf[:AUTO_INDENT] = true

### irb session duration
IRB_START_TIME = Time.now.to_i
at_exit { puts "\nirb session duration: #{Time.seconds_to_timestamp(Time.now.to_i - IRB_START_TIME)}" }


class Time
  def self.seconds_to_timestamp(seconds = 0)
    out = []

    mins = (seconds.to_f / 60.0).floor

    if mins.to_f >= 60
      hours = (mins.to_f / 60).floor
      mins = (mins.to_f - (hours.to_f * 60.0))
    end

    if hours.to_f >= 24
      days = (hours.to_f / 24.0).floor
      hours = (hours.to_f % 24.0).floor
    end

    if days.to_f >= 7
      weeks = (days.to_f / 7).floor
      days = (days - (weeks * 7)).floor
    end

    secs = (seconds % 60).floor

    out << "#{weeks.to_i} week#{weeks > 1 ? 's' : ''}"  unless weeks.nil? or weeks.to_i == 0
    out << "#{days.to_i} day#{days > 1 ? 's' : ''}"     unless days.nil?  or days.to_i == 0
    out << "#{hours.to_i} hour#{hours > 1 ? 's' : ''}"  unless hours.nil? or hours.to_i == 0
    out << "#{mins.to_i} minute#{mins > 1 ? 's' : ''}"  unless mins.nil?  or mins.to_i == 0

    sec_stamp = "#{secs.to_i} second#{secs == 1 ? '' : 's'}"
    if out.size == 0
      sec_stamp
    else
      out.join(', ') + " and #{sec_stamp}"
    end

  end
end


class Object
  # list methods which aren't in superclass
  def local_methods(obj = self)
    (obj.methods - obj.class.superclass.instance_methods).sort
  end

  # print documentation
  #
  #   ri 'Array#pop'
  #   Array.ri
  #   Array.ri :pop
  #   arr.ri :pop
  def ri(method = nil)
    unless method && method =~ /^[A-Z]/ # if class isn't specified
      klass  = self.kind_of?(Class) ? name : self.class.name
      method = [klass, method].compact.join('#')
    end
    puts `ri '#{method}'`
  end
end

def copy(str)
  IO.popen('pbcopy', 'w') { |f| f << str.to_s }
end

def copy_history
  history = Readline::HISTORY.entries
  index   = history.rindex("exit") || -1
  content = history[(index+1)..-2].join("\n")
  puts content
  copy content
end

def paste
  `pbpaste`
end

load File.dirname(__FILE__) + '/.railsrc' if $0 == 'irb' && ENV['RAILS_ENV']
