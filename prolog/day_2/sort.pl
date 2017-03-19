
smallestRJM([], 9999999).

smallestRJM([ListHead|ListTail], Result) :-
	smallestRJM(ListTail,Result)
	,Result < ListHead
.

smallestRJM([ListHead|ListTail], ListHead) :-
	smallestRJM(ListTail,A)
	,ListHead < A
.

removeRJM([],_,[]).

removeRJM([ListHead|ListTail],ItemToRemove,Result) :-
	ListHead \= ItemToRemove
	,removeRJM(ListTail,ItemToRemove,TMP)
	,append([ListHead],TMP,Result)
.
removeRJM([ListHead|ListTail],ItemToRemove,Result) :-
	ListHead = ItemToRemove
	,removeRJM(ListTail,ItemToRemove,Result)
.

sortRJM([], []).
sortRJM([A], [A]).
sortRJM(List, Result) :-
	length(List,LL)
	,LL > 1
	,smallestRJM(List,SMALLEST)
	,removeRJM(List,SMALLEST,UNSORTED_PART)
	,sortRJM(UNSORTED_PART,SORTED_PART)
	,append([SMALLEST],SORTED_PART,Result)
.

test_smallest :- 
	LIS = [331,52,33,24,35,456,37]
	,smallestRJM(LIS,RES)
	,write('Smallest element of ')
	,write(LIS)
	,write(' is ')
	,write(RES)
	,nl
.

test_remove :- 
	LIS = [331,52,33,24,35,456,37]
	,removeRJM(LIS,33,RES)
	,write('Removing 33 from ')
	,write(LIS)
	,write(' got ')
	,write(RES)
	,nl
.

start :- 
	LIS = [331,52,33,24,35,456,37]
	,sortRJM(LIS,RES)
	,write('Sorting ')
	,write(LIS)
	,write(' got ')
	,write(RES)
	,nl
.


