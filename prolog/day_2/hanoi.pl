

move(1,SOURCE,TARGET,_) :-  
    write('Move top disk from '), 
    write(SOURCE), 
    write(' to '), 
    write(TARGET), 
    nl
. 
move(N,SOURCE,TARGET,Z) :- 
    N>1, 
    M is N-1, 
    move(M,SOURCE,Z,TARGET), 
    move(1,SOURCE,TARGET,_), 
    move(M,Z,TARGET,SOURCE)
.

start :-
	move(3,left,right,center).

