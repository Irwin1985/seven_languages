-module(do_section).
-export([run/0]).

%-- Command to run
%--  c(do_section).
%--  do_section:run().

run() -> 
	io:fwrite("Recursive function to return the number of words in a string!\n"),
	run_num_words("The cat sat on the mat"),
	run_num_words("The cat sat on the mat  "),
	run_num_words("  The cat sat on the mat"),
	run_num_words("The cat   sat on the mat"),
	run_num_words(""),
	run_num_words("  "),
	run_num_words("Really, is"),
	run_num_words("Is a comma on it's own , a word?"),
	run_num_words(" ab "),
	io:fwrite("\n\nNow counting to 10 recursibly\n"),
	count(1),
	io:fwrite("\n\nPrint Message\n"),
	print_message( {error,"There was an error"} ),
	print_message( success ),
	print_message( {success} ),
	io:fwrite("End of run\n").


num_words(Str) ->
	length(collect_words(Str,[],[])).

debug(Str) ->
	io:fwrite("Deb:"),
	io:fwrite(Str),
	io:fwrite("\n").

collect_words( Text, Words, Word) ->
	%-- debug(Text),
	Tmp = string:strip(Text),
	if (length(Tmp) == 0) ->
		if (length(Word) /= 0) ->
			lists:append(Words,[Word]);
		true ->
			Words
		end;
	true ->
		[FirstCharacter | RestOfText] = Text,
		if (FirstCharacter == ($ )) ->
			if (length( Word ) == 0) ->
				collect_words(
					string:strip(RestOfText,left),
					Words,
					Word
				);
			true ->
				collect_words(
				string:strip(RestOfText),
				lists:append( Words, [Word] ),
				[]
			)
			end;
		true ->
			collect_words(
				RestOfText,
				Words,
				lists:append( Word, [FirstCharacter] )
			)
			end
		end
.		

count(10) ->
	io:fwrite(" 10\n");
count(N) ->
	io:fwrite(" "),
	io:fwrite(integer_to_list(N)),
	io:fwrite("\n"),
	count(N+1).

run_num_words(Str) ->
	io:fwrite(Str),
	io:fwrite(": "),
	io:fwrite(integer_to_list(num_words(Str))),
	io:fwrite("\n").

print_message( Value ) ->
	case Value of 
		success ->
			io:format( "success~n" );
		{success} ->
			io:format( "success~n" );
		{error, Message} ->
			io:format( "error: " ++ Message ++ "~n" )
	end
.
