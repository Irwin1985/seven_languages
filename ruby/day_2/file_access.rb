#!/usr/bin/ruby -w

puts "Day 2 Find tasks";

puts "1. How to access files with and without code blocks";

file_name = "some_data.txt";

puts "   without";
source = File.new(file_name, "r");
content = source.read;
puts source.closed? #prints false as the file is still open
source.close;
puts source.closed?
puts content;


puts "   with";
File.open(file_name, 'r') {|f|  puts "#{f.read}"}
puts source.closed? #prints true as the file has been autoclosed

puts "According to online docs passing a block to File.open auto-closes the file ";

puts ""
puts "Convert hash to array"

myHash = { 1920 => "value for 1920", 1925 => "value for 1925", 1934 => "value for 1934" }

myArr = myHash.to_a

puts "myHash=#{myHash}"
puts "myArr=#{myArr}"


finalHash = Hash[myArr.collect { |item| [item[0], item[1]] } ]

puts "finalHash=#{finalHash}"

if finalHash == myHash then
	puts "New hash is the same :)"
else
	puts "New hash is NOT the same :("
end

#Figuring out what the collect function actually does. It goes over an array, runs the code block and returns an array of the output of the code block
rJMTest = myArr.collect { |i| puts i; "cabbage and #{i[0]}"; }
puts "rJMTest=#{rJMTest}"

puts ""
puts "Can I iterate over a hash?"
finalHash.each_pair { |key, value| puts "Key #{key} has the value #{value}" }

puts ""
puts "What data structures do arrays support"
#https://www.sitepoint.com/guide-ruby-collections-part-arrays/
puts "push/pop = stack"
puts "push/shift = queue"

