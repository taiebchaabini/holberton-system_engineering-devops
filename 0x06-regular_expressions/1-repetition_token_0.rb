#!/usr/bin/env ruby
regex = /hbt{2,5}n/
occurs = ARGV[0].scan(regex)
for i in occurs
	print i
end
print "\n"
