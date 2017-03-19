
reverseRJM([], []).
reverseRJM([ListHead|ListTail], Result) :-
	reverseRJM(ListTail,TMP),
	append([ListHead], TMP, Result)
.


start :- 
	LIS = [1,2,3,4,5,6,7]
	,reverseRJM(LIS,REV_LIS)
	,write('Reversed ')
	,write(LIS)
	,write(' and got ')
	,write(REV_LIS)
	,nl
.


