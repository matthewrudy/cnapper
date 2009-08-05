#!/usr/bin/env script/runner

if ARGV[1].nil?
  puts "Nagios plugin to check the RudeQueue queue length\r\n\r\n"
  puts "Usage: ruby script/monitor/rudequeue.rb <warning> <critical>"
  puts "e.g. ruby script/monitor/rudequeue.rb 50 100"
  exit 3
end
warning  = ARGV[0].to_i
critical = ARGV[1].to_i

if critical < warning
  puts "<warning> must be less than <critical>"
  exit 3
end

queue_size = RudeQueue.backlog

code = if queue_size >= critical
  2
elsif queue_size >= warning
  1
else
  0
end

status = case code
  when 0 then "OK"
  when 1 then "WARNING"
  when 2 then "CRITICAL"
end

puts "#{status}: Queue Size - #{queue_size}"
exit code