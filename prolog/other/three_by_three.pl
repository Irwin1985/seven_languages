%http://www.anselm.edu/homepage/mmalita/culpro/index.html

row(123,1,2,3).
row(132,1,3,2).
row(213,2,1,3).
row(231,2,3,1).
row(312,3,1,2).
row(321,3,2,1).

answer_grid(R1,R2,R3) :-
    	row(R1, A, D, G)
    	,row(R2, B, E, H)
    	,row(R3, C, F, I)
    	,R1 \= R2
    	,R1 \= R3
    	,R2 \= R3
		,COL1 is A+B+C
		,COL2 is D+E+F
		,COL3 is G+H+I
%		,write('TTT= '), write(A), write(B), write(C), write(COL1)
    	,6 is COL1
    	,6 is COL2
    	,6 is COL3
    .