#!/usr/bin/ruby -w

number=rand(25);

puts "I have thought of a number between 1 and 25, guess it!"
puts "  (x to quit)"

userGuess = 10000000;
while number != userGuess
	userGuessSTR = gets.strip!.upcase;
	if userGuessSTR.eql? "X"
		puts "Exiting..."
		exit
	end;
	userGuess = userGuessSTR.to_i;
	
	puts "Lower" if number<userGuess;
	puts "Higher" if number>userGuess;
	
end;

puts "Correct the number was #{number}";
