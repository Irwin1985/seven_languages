
program(eclipse, windows).
program(eclipse, linux).
program(vi, linux).
program(notepad, windows).
program(quake, windows).
program(safari, mac).
program(gedit, linux).

rating(eclipse, 10).
rating(vi, 1).
rating(gedit, 5).
rating(quake, 10).
rating(gedit, 10).


os_rating(X, Y, Z) :- program(Z, X), rating(Z, Y).

/**
program(What, linux).
rating(What, 10).
os_rating(Linux, 10, What).

*/

