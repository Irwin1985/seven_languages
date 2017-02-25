"Fibonacci solver" println



try := method(input_value, expected_result,
	("Testing function fib(" .. input_value .. ")=") print
	res := fib(input_value)
	(res .. " ") print
	if ((res == expected_result),
		" pass" println,
		(" FAIL expected " .. expected_result) println
	)
)

#Loop Method
fib := method(a,
	if ( (a<3) , 1,
	two_prev := fib(a-2)
	one_prev := fib(a-1)
	(two_prev + one_prev)
	)
)
"Runing Recursive Tests" println
try(1,1)
try(2,1)
try(3,2)
try(4,3)
try(5,5)
try(6,8)
try(7,13)
##try(40, 102334155)

"" println
"" println
"Runing Loop Method Tests" println
#Loop Method
fib := method(a,
	if ( (a<3) , 1,
		two_prev := 1
		one_prev := 1
		cur_index := 3
		while(cur_index <= a,
			( 
				cur_val := one_prev + two_prev; 
				two_prev := one_prev; 
				one_prev := cur_val; 
				cur_index = cur_index + 1
			)
		)
		(cur_val)
	}
)
try(1,1)
try(2,1)
try(3,2)
try(4,3)
try(5,5)
try(6,8)
try(7,13)
try(40, 102334155)


