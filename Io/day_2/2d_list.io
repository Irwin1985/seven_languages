"2D List" println

Rjm_2DList := clone List
Rjm_2DList set := method( x,y,value,
	line_list := (self rjm_internal_data at(y-1))
	line_list atPut(x-1,value)
)
Rjm_2DList tostring := method(
	res := ""
	for (y, 0, (self rjm_internal_data size) -1, 1,
		line_list := (self rjm_internal_data at(y))
		for (x, 0, (line_list size) -1, 1,
			val := line_list at(x)
			res := res .. ((val .. "") alignRight(5, " ")) 
			if ( (x+1)<(line_list size), res := res .. ",")
		)
		res := res .. "\n";
	);
	(res);
)


dim := method(width,height,
	res := Rjm_2DList clone
	res rjm_internal_data := list()
	for(y, 1, height, 1,
		int_lis := list()
		for(x, 1, width, 1,
			int_lis append(nil)
		)
		res rjm_internal_data append(int_lis)
	)
	(res)
)



simple_list := dim(2,2)
simple_list set(1,1,1)
simple_list set(2,2,"Some")


(simple_list tostring) println

