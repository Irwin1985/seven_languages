#!/usr/bin/ruby -w

a="Hello, Ruby!";
puts a;

puts "To find function to search the string I listed methods of a";
puts a.methods;

puts "I guessed the index method did what I want:";
puts a.index("Ruby");

puts "Robert "*10;

puts "In this exersise I wanted to try out the unless syntax"
i=1
while i < 11
	puts "This is sentance number #{i}" unless i==5;
	i=i+1;
end


