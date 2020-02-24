#!/usr/bin/env ruby
regex = /^h.n$/
occurs = ARGV[0].scan(regex)
for i in occurs
	print i
end
print "\n"
