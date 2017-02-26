"Number Guesse" println


#Random number generator was given me repeated outputs
## no idea why so I will generate a random number of random numbers
## before I choose one to use
for (i,0,(Random value( 5 ) + 1),1,
	programs_number := (Random value( 99 ) + 1) floor();
)

"I have chosen a number" println

remaining_guesses := 10
previous_distance := 999999;

running := true

while (running,

	("Please guess my number: (You have " .. remaining_guesses .. " guesses remaining) ") print;
	sIO := File standardInput();

	guess := sIO readLine() asNumber();


	if ( (guess==programs_number), 
		"You got it!!! " println; running := false,
		"Wrong " print;
		distance := guess - programs_number;
		if ( (distance<0), distance = distance * -1);
		if (previous_distance!=999999,
			if ( (distance<previous_distance),
				"but hotter" print,
				"but colder" print
			);
		);
		previous_distance := distance;
		"" println;
	);

	remaining_guesses := remaining_guesses - 1;
	if (remaining_guesses==0,
		"You failed - you are a terrible person" println;
		running := false
	);
)

("My number was " .. programs_number) println



