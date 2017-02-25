"List functions" println

List rjm_tostring := method(
	res := ""
	for(i,0,(arr size -1),1,
		res := res .. (((self at(i)) .. "") alignRight(5, "-") .. " ")
	)
	(res)
)
List rjm_sum := method(
	res := 0
	for(i,0,(arr size -1),1,
		val := (self at(i))
		if ( (val type != "Number"),
			Exception raise("This thing isn't an number","Tried to sum a list with " .. val .. " in it"),
			res := res + val
		)
	)
)
List myAverage := method(
	siz := (self size)
	if ( (siz==0), 
		Exception raise("Tried to average empty list","You can't do this")
		"Error empty list"
	,(self rjm_sum) / siz)
)



arr := list(1,3,434,232,43,43,32,34,32,4)
("List: " .. (arr rjm_tostring)) println
(" -sum: " .. (arr rjm_sum)) println
(" -avg: " .. (arr myAverage)) println\


arr := list(1,"Three",434,232,43,43,32,34,32,4)
("List: " .. (arr rjm_tostring)) println
(" -sum: " .. (arr rjm_sum)) println
(" -avg: " .. (arr myAverage)) println\


arr := list()
("List: " .. (arr rjm_tostring)) println
(" -sum: " .. (arr rjm_sum)) println
(" -avg: " .. (arr myAverage)) println\

