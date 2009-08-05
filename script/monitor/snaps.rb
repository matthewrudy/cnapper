#!/usr/bin/env script/runner

if ARGV[0].nil?
  puts "Nagios plugin to check how many 'rake snaps' are running\r\n\r\n"
  puts "Usage: ruby script/monitor/snaps.rb <expected>"
  puts "e.g. ruby script/monitor/snaps.rb 4"
  exit 3
end
expected = ARGV[0].to_i

current_value = `ps a | grep 'rake snap' | grep -v 'grep' | wc -l`.to_i

code = if current_value < expected
  2
else
  0
end

status = case code
  when 0 then "OK"
  when 1 then "WARNING"
  when 2 then "CRITICAL"
end

puts "#{status}: Daemons running - #{current_value}"
exit code