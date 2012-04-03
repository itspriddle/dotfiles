#!/usr/bin/env ruby

loadus = %w[irb/completion ap]
loadus.unshift 'rubygems' if RUBY_VERSION.to_f == 1.8

loadus.each do |gem|
  begin
    require gem
  rescue LoadError => err
    warn "Couldn't load #{gem}: #{err}"
  end
end

IRB::Irb.class_eval do
  def output_value
    ap @context.last_value
  end
end if defined?(AwesomePrint)

IRB.conf[:SAVE_HISTORY] = 2000
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb_history"
IRB.conf[:AUTO_INDENT]  = true

prompt  = "#{RUBY_VERSION}-p#{RUBY_PATCHLEVEL} "
project = `git rev-parse --show-toplevel 2> /dev/null`.strip
prompt  = "#{File.basename(project)} (#{prompt.strip}) " if project != ""

IRB.conf[:PROMPT] ||= {}
IRB.conf[:PROMPT][:JOSH] = {
  :PROMPT_I => "#{prompt}> ",
  :PROMPT_S => "#{prompt}* ",
  :PROMPT_C => "#{prompt}? ",
  :RETURN   => "=> %s\n"
}

IRB.conf[:PROMPT_MODE] = :JOSH

alias q exit

IRB_START_TIME = Time.now
at_exit { puts "\n#{IRB.session_duration}" }

### irb session duration
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

class Object
  # list methods which aren't in superclass
  def local_methods(obj = self)
    (obj.methods - obj.class.superclass.instance_methods).sort
  end
end

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

# Toys
# https://gist.github.com/807492
class Array
  def self.toy(n = 10, &block)
    block ||= :next
    Array.new(n, &block)
  end
end

class Hash
  def self.toy(n = 10)
    Hash[Array.toy(n).zip(Array.toy(n) { |c| (96 + c.next).chr })]
  end
end

begin
  load File.expand_path("../.railsrc", __FILE__) if defined?(Rails::Railtie)
rescue
  warn "Error loading ~/.railsrc!"
end
