


squareBrackets := method( call message arguments )
List squareBrackets := method(
	index, 
	value, 
	if(value == nil, 
		at(index), 
		atPut(index, value)
	)
)

"Making empty list" println
l := []
l println

"Making single item list" println
l := ["A"]
l println

"Making two item list" println
l := ["A","B"]
l println

"Making bigger list" println
l := ["A","B","A","B","A","B","A","B","A","B"]
l println


"Making mixed type list" println
l := ["A","B",344,"B",3,"B",["Oth","TTT"],"B","A","B"]
l println


