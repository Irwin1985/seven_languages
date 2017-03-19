%https://www.cs.utexas.edu/~cannata/cs345/Class%20Notes/Prolog%20examples.pdf


fib(0,0).
fib(X, Y) :- X > 0, fib(X, Y, _).

%This finds the previous fib number and  stores it rather than working it out twice

fib(1, 1, 0).
fib(X, Y1, Y2) :-
	X > 1,
	X1 is X - 1,
	fib(X1, Y2, Y3),
	Y1 is Y2 + Y3.


