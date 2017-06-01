-module(do_section).
-export([run/0]).

%-- Command to run
%--  c(do_section).
%--  do_section:run().


myMatchFn(A,{A,_}) -> true;
myMatchFn(_,{_,_}) -> false.


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
	Match = fun(A,B) -> myMatchFn(A,B) end,
	FindValueFun = fun(L,ItemToSearchFor) -> 
		{_,A} = hd([X || X <- L, Match(ItemToSearchFor, X)]),
		A
	end,


	FindValueFun2 = fun(L,ItemToSearchFor) -> 
		hd([Desc || {Name, Desc} <- L, ItemToSearchFor == Name])
	end,

	
	io:fwrite("\n\n"),
	io:fwrite(FindValueFun(KeywordValues,ruby)),
	io:fwrite("\n"),
	io:fwrite(FindValueFun2(KeywordValues,erlang)),
	io:fwrite("\n"),
	io:fwrite(FindValueFun(KeywordValues,haskell)),
	io:fwrite("\n"),
	

	io:fwrite("\n\n"),
	io:fwrite("Shopping list example\n"),

	ShoppingList = [
		{"Raspberry Pi Zero",5,3.20},
		{"Raspberry Pi Zero W",6,10.0},
		{"Raspberry Pi 3",1,32.0},
		{"Cluster Hat",5,33.20},
		{"Beer",5,6.2}
	],
	
	ItemToString = fun({A,B,C}) ->
		io_lib:format("(Item: ~s, Qty: ~p, Price: ~.2f)", [A, B, C])
	end,
	ListToString = fun(L, ItemToStringFn) ->
		lists:foldl(fun(Item, SoFar) -> string:concat(string:concat(SoFar,ItemToStringFn(Item)),"\n") end, "", L)
	end,
	
	%-- io:fwrite(ItemToString({"Raspberry Pi Zero W",6,10.0})),
	%-- io:fwrite("\n"),
	
	io:fwrite(ListToString(ShoppingList, ItemToString)),
	io:fwrite("\n"),
	
	TotaledItemToString = fun({A,B}) ->
		io_lib:format("(Item: ~s, Total Price: ~.2f)", [A, B])
	end,
	
	TotaledShoppingList = lists:map(fun({A,B,C}) -> {A, B * C} end,ShoppingList),

	io:fwrite(ListToString(TotaledShoppingList, TotaledItemToString)),
	io:fwrite("\n"),

	io:fwrite(io_lib:format("Total price ~.2f\n",[
		lists:foldl(
			fun({_,B}, SoFar) -> SoFar + B end,
			0.0,
			TotaledShoppingList
		)
	])),


	
	io:fwrite("End of run\n")
.

