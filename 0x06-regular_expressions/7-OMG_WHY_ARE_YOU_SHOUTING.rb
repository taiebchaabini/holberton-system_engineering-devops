#!/usr/bin/env ruby
regex = /[A-Z]/
occurs = ARGV[0].scan(regex)
for i in occurs
	print i
end
print "\n"
