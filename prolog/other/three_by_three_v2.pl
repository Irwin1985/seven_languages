%http://www.anselm.edu/homepage/mmalita/culpro/index.html
num(1).
num(2).
num(3).
num(4).
num(5).
num(6).
num(7).
num(8).
num(9).

answer_grid(A,B,C,D,E,F,G,H,I) :-
    	num(A),num(B),num(C),num(D),num(E),num(F),num(G),num(H),num(I)
		,ROW1 is A+B+C
		,ROW2 is D+E+F
		,ROW3 is G+H+I
		,COL1 is A+D+G
		,COL2 is B+E+H
		,COL3 is C+F+I
    	%Horiz Uniqueness
    	,A \= B, A \= C, B \= C
    	,D \= E, D \= F, E \= F
    	,G \= H, G \= I, H \= I
    	%Vert Uniqueness
    	,A \= D, A \= G, D \= G
    	,B \= E, B \= H, E \= H
    	,C \= F, C \= I, F \= I
%		,write('TTT= '), write(A), write(B), write(C), write(COL1)
    	,6 is ROW1
    	,6 is ROW2
    	,6 is ROW3
    	,6 is COL1
    	,6 is COL2
    	,6 is COL3
    .
	
answer_grid(A,B,C,D,E,F,G,H,I).