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
Rjm_2DList getHeight := method(
	self rjm_internal_data size
)
Rjm_2DList getWidth := method(
	self rjm_internal_data at(1) size
)
Rjm_2DList transpose := method(
	res := dim(self getHeight, self getWidth);
	for (y, 0, (self rjm_internal_data size) -1, 1,
		line_list := (self rjm_internal_data at(y))
		for (x, 0, (line_list size) -1, 1,
			val := line_list at(x)
			res set(y+1, x+1,val)
		)
	);

	self rjm_internal_data := res rjm_internal_data
)
Rjm_2DList write_to_file := method(file_name,
	f := File with(file_name)
	f remove
	f openForUpdating
	f write("Rjm_2dList_data_file\n")
	f write("" .. (self getHeight) .. "\n")
	f write("" .. (self getWidth) .. "\n")
	for (y, 0, (self rjm_internal_data size) -1, 1,
		line_list := (self rjm_internal_data at(y))
		for (x, 0, (line_list size) -1, 1,
			val := line_list at(x)
			f write("" .. val .. "\n")
		)
	)
	
	f close	
)

dim := method(width,height,
	res := Rjm_2DList clone
	res rjm_internal_data := list()

	if (
		(width type) == "Number",
		(
		#passed number
		for(y, 1, height, 1,
			int_lis := list()
			for(x, 1, width, 1,
				int_lis append(nil)
			)
			res rjm_internal_data append(int_lis)
		)
		(res)
		),
		(
		#File
		f := File with(width)
		f openForReading
		check := f readLine
		if ( (check != "Rjm_2dList_data_file"), Exception raise("Not my file","can''t read"))
		wid := f readLine asNumber()
		hei := f readLine asNumber()

		res := dim(wid,hei)
		for(y, 1, hei, 1,
			for(x, 1, wid, 1,
				val := (f readLine)
				res set(x,y,val)
			)
		)
		f close
		(res)
		)
	)
)



simple_list := dim(5,2)
simple_list set(1,1,1)
simple_list set(2,2,"Some")
simple_list set(4,2,"cell 4_2")


(simple_list tostring) println

("Height of simple list is " .. (simple_list getHeight)) println
("Width of simple list is " .. (simple_list getWidth)) println

"Transposing List"
simple_list transpose

(simple_list tostring) println

file_name := "___2d_list.dat"
("Outputing to " .. file_name) println
simple_list write_to_file(file_name)


"Reading list back form the file"
read_list := dim(file_name)
(read_list tostring) println

"Done"


