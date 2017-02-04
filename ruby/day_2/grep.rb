#!/usr/bin/ruby -w

#exmplae commands to run this program
#ruby grep.rb some_data.txt other
#ruby grep.rb some_data.txt "^other"
#ruby grep.rb some_data.txt "^Some other"

input_array = ARGV
if input_array.length != 2
	abort("Must supply 2 arguments, file name and phrase to search for")
end

file_name = input_array[0]
phrase = input_array[1]


expression = Regexp.new(phrase)

#puts "1#{expression}"
#puts "2 match''=#{expression.match('')}"
#puts "3 match 123=#{expression.match('123')}"
#puts "4 match abc=#{expression.match('abc')}"


File.open(file_name, 'r') {|f|  
	File.readlines(f).each_with_index do |line,index|
		#no regexp version
		#puts "#{index}: #{line}" if line.include? phrase
		#puts "#{index}: #{line}" if expression.match(line)
		puts "#{index}: #{line}" if line =~ expression

	end
}



