#!/usr/bin/env ruby

if ARGV.count == 0 then
	puts "Syntax: updatePraseFile <file name>"
	exit
end

fileName = ARGV[0]
File.readlines(fileName).each do |line|

end
