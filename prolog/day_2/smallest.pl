
smallestRJM([], 9999999).

smallestRJM([ListHead|ListTail], Result) :-
	smallestRJM(ListTail,Result)
	,Result < ListHead
.

smallestRJM([ListHead|ListTail], ListHead) :-
	smallestRJM(ListTail,A)
	,ListHead < A
.

start :- 
	LIS = [331,52,33,24,35,456,37]
	,smallestRJM(LIS,RES)
	,write('Smallest element of ')
	,write(LIS)
	,write(' is ')
	,write(RES)
	,nl
.


