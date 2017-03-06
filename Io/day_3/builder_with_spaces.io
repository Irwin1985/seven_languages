Builder := Object clone

Builder level := 0;
Builder tab := method( "  " repeated(level) )
Builder prev_content := false
Builder prev_open := false

Builder forward := method(
	if ( prev_open == true, writeln("") )
	prev_open = true
	write(tab, "<", call message name, ">")
	level = level + 1;
	call message arguments foreach(
		arg,
		content := self doMessage(arg);
		if(content type == "Sequence", 
			prev_content = true; write(content)
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

//Builder println


Builder ul(
	li("Io"),
	li("Lua"),
	li("JavaScript"),
	li(
		p("AA1")
		p("AA2")
		p("AA3")
	)
	)


