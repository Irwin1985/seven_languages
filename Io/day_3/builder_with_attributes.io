Builder := Object clone
Attribute_list := Object clone

Builder level := 0;
Builder tab := method( "  " repeated(level) )
Builder prev_content := false
Builder prev_open := false


curlyBrackets := method(
	call message arguments foreach(
		arg,
		" " print
		xx := (arg asSimpleString) split(":")
		(xx at(0) asMutable strip) print
		"=" print
		(xx at(1) asMutable strip) print
	)
)

Builder forward := method(
	if ( prev_open == true, writeln("") )
	prev_open = true
	write(tab, "<", call message name)

	first_non_attribute_arg := 0;

	if (call message arguments size>0,
		if ( (call message arguments at(0) asSimpleString asMutable strip exSlice(0, 13)) == "curlyBrackets",
			first_non_attribute_arg = 1; //cause the first arg to be skipped later because we are processing it here
			content := self doMessage(call message arguments at(0));
		)

	);

	write(">")

	arg_num := 0;
	level = level + 1;
	call message arguments foreach(
		arg,
		arg_num = arg_num + 1;
		if (arg_num>first_non_attribute_arg,
			content := self doMessage(arg);
			if(content type == "Sequence", 
				prev_content = true; write(content)
			)
		)
	)
	level = level - 1;
	if ( prev_content == true,
		prev_content = false;
		write("</", call message name, ">")
	,
		writeln("")
		write(tab, "</", call message name, ">")
		prev_open = false
	)
	if ( level == 0, "" println)
)



Builder test({"A":"1","B":"2"},"Val");


Builder ul(
	li("Io"),
	li("Lua"),
	li("JavaScript"),
	li(
		p({"align":"right"},"AA1")
		p("AA2")
		p("AA3")
	)
	)


