object currying {;import org.scalaide.worksheet.runtime.library.WorksheetSupport._; def main(args: Array[String])=$execute{;$skip(50); 
	def add(a: Int)(b: Int) = a + b;System.out.println("""add: (a: Int)(b: Int)Int""");$skip(31); 
	
	val onePlusFive = add(1)(5);System.out.println("""onePlusFive  : Int = """ + $show(onePlusFive ));$skip(25); 
	
	val addFour = add(4)_;System.out.println("""addFour  : Int => Int = """ + $show(addFour ));$skip(32); 
	
	val twoPlusFour = addFour(2);System.out.println("""twoPlusFour  : Int = """ + $show(twoPlusFour ));$skip(38); 
	
	assert(onePlusFive == twoPlusFour);$skip(48); 
	
	def add3(a: Int)(b: Int)(c: Int) = a + b + c;System.out.println("""add3: (a: Int)(b: Int)(c: Int)Int""");$skip(36); 
	
	val addThreeNums = add3(2)(5)(8);System.out.println("""addThreeNums  : Int = """ + $show(addThreeNums ));$skip(25); 
	
	val addTwo = add3(2)_;System.out.println("""addTwo  : Int => (Int => Int) = """ + $show(addTwo ));$skip(37); 
	
	val addTwoAnd5And7 = addTwo(5)(7);System.out.println("""addTwoAnd5And7  : Int = """ + $show(addTwoAnd5And7 ))}
	
	
	//val addTwoAnd5 = addTwo(5)_
	
	
	
}
