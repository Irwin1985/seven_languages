"2D Array addition" println

arr := list(
	list(1,4,6,454),
	list(2,4,6,454),
	list(3,234,6,454),
	list(4,4,6,454),
	list(5,4,6,4)
)

"My Array:" println
for(i,0,(arr size -1),1,
	arr2 := arr at(i)
	for(j,0,(arr2 size -1),1,
		val := arr2 at(j)
		((val .. "") alignRight(10, "-") .. " ") print
	)
	"" println
)


"Sum of values: " print
total := 0;
for(i,0,(arr size -1),1,
	arr2 := arr at(i)
	for(j,0,(arr2 size -1),1,
		val := arr2 at(j)
		total := total + val;
	)
) println


