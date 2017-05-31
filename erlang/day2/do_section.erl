-module(do_section).
-export([run/0]).

%-- Command to run
%--  c(do_section).
%--  do_section:run().

run() -> 
	io:fwrite("Start of Day2 do section\n"),
	
	KeywordValues = [
		{ruby, "Mary Poppins"},
		{io, "Ferris Bueller"},
		{prolog, "The Rain Man"},
		{scala, "Edward Sissorhands"},
		{erlang, "Agent Smith"},
		{clojure, "Intrested to find out"},
		{haskell, "One day I will know"}
	],
	FindValueFun = fun(L,X) -> head([X || X <- L]) end,
	
	io:fwrite("\n\n"),
	io:fwrite(FindValueFun(KeywordValues,ruby)),
	io:fwrite("\n"),
	io:fwrite(FindValueFun(KeywordValues,erlang)),
	io:fwrite("\n"),
	io:fwrite(FindValueFun(KeywordValues,haskell)),
	io:fwrite("\n"),
	
	
	io:fwrite("End of run\n")
.

