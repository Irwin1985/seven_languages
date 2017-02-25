"Change / operation" println

"Before I changed it" println
(10/2) println
(10/3) println
(5/0) println


#my solution pretty much copied from https://www.bennadel.com/blog/2066-seven-languages-in-seven-weeks-io---day-2.htm

normal_div := Number getSlot("/")
Number setSlot("/",
	method( denominator,
		if ( (denominator==0),0,
			(self normal_div(denominator))
		)
	)
)

5 normal_div(1)

"After I changed it" println
(10/2) println
(10/3) println
(5/0) println

