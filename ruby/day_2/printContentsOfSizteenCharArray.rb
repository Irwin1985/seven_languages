#!/usr/bin/ruby -w

puts "Print contents of 16 number array"

puts "Make an array"
arr = []
16.times { |i| arr.push(rand(25)) }

puts "Arr=#{arr}"


puts "Print 4 at a time using each"
puts " needed to get the indexes so I can make groups of 4"

arr.each.with_index { 
	|val,index| print val
	print "," if ((index+1) % 4)!=0
	puts "" if ((index+1) % 4)==0
}


puts "\n\nPrint 4 at a time using each_slice"

arr.each_slice(4) {|val| p val}

