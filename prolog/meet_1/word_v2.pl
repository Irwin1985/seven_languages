orig_word(astante).
orig_word(astoria). 
orig_word(baratto). 
orig_word(cobalto). 
orig_word(pistola). 
orig_word(statale).

word(FullWord, A1, A2, A3, A4, A5 ,A6, A7) :- 
	orig_word(FullWord),
    atom_chars(FullWord, CHARS),
    nth0(0,CHARS,A1),
    nth0(1,CHARS,A2),
    nth0(2,CHARS,A3),
    nth0(3,CHARS,A4),
    nth0(4,CHARS,A5),
    nth0(5,CHARS,A6),
    nth0(6,CHARS,A7)
.

solve(V1,V2,V3,H1,H2,H3) :- 
	word(V1, _, A, _, B, _, C, _),
	word(V2, _, D, _, E, _, F, _),
	word(V3, _, G, _, H, _, I, _),
	word(H1, _, A, _, D, _, G, _),
	word(H2, _, B, _, E, _, H, _),
	word(H3, _, C, _, F, _, I, _),
	V1 \= V2,
	V1 \= V3,
	V1 \= H1,
	V1 \= H2,
	V1 \= H3,
	V2 \= V1,
	V2 \= V3,
	V2 \= H1,
	V2 \= H3,
	V2 \= H3,
	V3 \= V1,
	V3 \= V2,
	V3 \= H1,
	V3 \= H3,
	V3 \= H3,
	H1 \= V1,
	H1 \= V2,
	H1 \= V3,
	H1 \= H2,
	H1 \= H3,
	H2 \= V1,
	H2 \= V2,
	H2 \= V3,
	H2 \= H1,
	H2 \= H3,
	H3 \= V1,
	H3 \= V2,
	H3 \= V3,
	H3 \= H1,
	H3 \= H2
.

/*
solve(V1,V2,V3,H1,H2,H3).
*/
