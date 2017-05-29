-module(do_section).
-export([run/0]).

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
	io:fwrite("End of run\n").

run_num_words(Str) ->
	io:fwrite(Str),
	io:fwrite(": "),
	io:fwrite(integer_to_list(num_words(Str))),
	io:fwrite("\n").

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

