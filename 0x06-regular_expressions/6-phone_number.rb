#!/usr/bin/env ruby
regex = /^[0-9]{10}$/
occurs = ARGV[0].scan(regex)
for i in occurs
	print i
end
print "\n"
