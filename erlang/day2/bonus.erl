-module(bonus).
-export([run/0]).

%-- Command to run
%--  c(bonus).
%--  bonus:run().

my_last([])-> nil ;
my_last([H|[]])->H ;
my_last([_|T])-> my_last(T) .

removeLastItemFromList(List) -> lists:reverse(tl(lists:reverse(List))).

didWin(Board,Piece) ->
	case Board of
		[Piece,Piece,Piece,_,_,_,_,_,_] -> true;
		[_,_,_,Piece,Piece,Piece,_,_,_] -> true;
		[_,_,_,_,_,_,Piece,Piece,Piece] -> true;
		[Piece,_,_,Piece,_,_,Piece,_,_] -> true;
		[_,Piece,_,_,Piece,_,_,Piece,_] -> true;
		[_,_,Piece,_,_,Piece,_,_,Piece] -> true;
		[Piece,_,_,_,Piece,_,_,_,Piece] -> true;
		[_,_,Piece,_,Piece,_,Piece,_,_] -> true;
		_ -> false
	end
.

findWinner(Board) -> 
	DidXWin = didWin(Board,"X"),
	DidOWin = didWin(Board,"O"),
	MovesRemaining = lists:foldl(fun(Item,SoFar) -> 
		if
			Item == "_" -> SoFar + 1;
			true -> SoFar 
		end
	end,0,Board),
	if
		DidXWin -> "X";
		DidOWin -> "O";
		MovesRemaining == 0 -> "cat";
		true -> "no_winner"
	end
.

%--Not doing it the matching way because I can't use array AND seperate togetheer
%--findWinner(Board) -> "TODO".

run() -> 
	io:fwrite("Start of Day2 BOUNS section\n"),
	io:fwrite(" tic tac toe board evaluation\n"),
	
	Boards = [
%--		{"TestBoard",["1","2","3","4","5","6","7","8","9"],"O"},
		{"No Moves",["_","_","_","_","_","_","_","_","_"],"no_winner"},
		{"Four Moves",["X","_","O","O","X","_","_","_","_"],"no_winner"},
		{"X Win 1",["X","X","X","O","O","_","O","_","_"],"X"},
		{"X Win 2",["X","_","O","X","O","_","X","O","_"],"X"},
		{"X Win 3",["X","_","_","O","X","O","O","_","X"],"X"},
		{"O Win 1",["X","X","_","O","O","_","O","O","O"],"O"},
		{"O Win 2",["_","_","O","X","O","O","X","O","O"],"O"},
		{"O Win 3",["X","_","O","O","O","X","O","_","O"],"O"},
		{"Draw"   ,["X","O","X","X","O","O","O","X","X"],"cat"}
	],

	BoardDisplayString = fun(Board) ->
		TmpList = lists:foldl(
			fun(ListItem, SoFar) ->
				LastItem = my_last(SoFar),
				LastItemLength = string:len(LastItem),
				if 
					LastItemLength == 3 -> 
						lists:append([SoFar,[ListItem]]);
					true -> 
						NewLastItem = string:concat(LastItem,ListItem),
						lists:append([removeLastItemFromList(SoFar),[NewLastItem]])
					
				end
			end,
			[""],
			Board
		),
		lists:foldl(
			fun(ListItem, SoFar) -> 
				string:concat(
					string:concat(
						string:concat(SoFar,"  "),ListItem
					),"\n"
				) 
			end,
			"",
			TmpList
		)
	end,


%--	Res = BoardDisplayString(["X"," ","O","O","X"," "," "," "," "]),
%--	io:fwrite(Res),

	lists:foldl(
		fun({BoardName,Board,ExpectedResult},_) -> 
			Result = findWinner(Board),
			io:format("\n\nBoard Name: ~s\n-------------\n~s\Winner: ~s\n",[BoardName,BoardDisplayString(Board),Result]),
			if
				Result == ExpectedResult -> "";
				true -> exit(string:concat(string:concat(string:concat("Wrong Result - got ",Result)," expected "),ExpectedResult))
			end
		end,
		"",
		Boards
	),


	
	io:fwrite("\n\nEnd of run\n")
.

