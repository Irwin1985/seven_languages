word(astante,  a,s,t,a,n,t,e). 
word(astoria,  a,s,t,o,r,i,a). 
word(baratto,  b,a,r,a,t,t,o). 
word(cobalto,  c,o,b,a,l,t,o). 
word(pistola,  p,i,s,t,o,l,a). 
word(statale,  s,t,a,t,a,l,e).

solve(V1,V2,V3,H1,H2,H3) :- 
	word(V1, _, A, _, _, _, _, _),
	word(V2, _, _, _, _, _, _, _),
	word(V3, _, _, _, _, _, _, _),
	word(H1, _, A, _, _, _, _, _),
	word(H2, _, _, _, _, _, _, _),
	word(H3, _, _, _, _, _, _, _),
	V1 \= V2,
	V1 \= V3,
	V1 \= H1,
	V1 \= H2,
	V1 \= H3
%	V2 \= V1,
%	V2 \= V3,
%	V2 \= H1,
%	V2 \= H3,
%	V2 \= H3,
%	V3 \= V1,
%	V3 \= V2,
%	V3 \= H1,
%	V3 \= H3,
%	V3 \= H3
.





/*
solve(V1,V2,V3,H1,H2,H3).
*/
