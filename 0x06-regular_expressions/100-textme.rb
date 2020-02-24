#!/usr/bin/env ruby
regex = /\[from:(\+{0,1}[0-9|A-z]+)\]+.+\[to:(\+{0,1}[0-9|A-z]+)\]+.+\[flags:(.+)\]\s\[msg/
occurs = ARGV[0].scan(regex)
delim = ","
for i in occurs
	sender = i[0]
	receiver = i[1]
	flags = i[2]
	print sender + delim + receiver + delim + flags
	
end
print "\n"
