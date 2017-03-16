%http://swish.swi-prolog.org/

taller_than(bob,mike).
taller_than(mike,jim).
taller_than(jim,george).

is_taller_than(X,Y):- taller_than(X,Y).
is_taller_than(X,Y):- taller_than(X,G), is_taller_than(G,Y).


/*RUNNING:
is_taller_than(mike,george).
is_taller_than(george,mike).
is_taller_than(mike,Who).
 */
