#!/usr/bin/env ruby
regex = /hb{0,1}tn/
occurs = ARGV[0].scan(regex)
for i in occurs
	print i
end
print "\n"
