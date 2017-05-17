object currying {
	def add(a: Int)(b: Int) = a + b           //> add: (a: Int)(b: Int)Int
	
	val onePlusFive = add(1)(5)               //> onePlusFive  : Int = 6
	
	val addFour = add(4)_                     //> addFour  : Int => Int = <function1>
	
	val twoPlusFour = addFour(2)              //> twoPlusFour  : Int = 6
	
	assert(onePlusFive == twoPlusFour)
	
	def add3(a: Int)(b: Int)(c: Int) = a + b + c
                                                  //> add3: (a: Int)(b: Int)(c: Int)Int
	
	val addThreeNums = add3(2)(5)(8)          //> addThreeNums  : Int = 15
	
	val addTwo = add3(2)_                     //> addTwo  : Int => (Int => Int) = <function1>
	
	val addTwoAnd5And7 = addTwo(5)(7)         //> addTwoAnd5And7  : Int = 14
	
	
	//val addTwoAnd5 = addTwo(5)_
	
	
	
}