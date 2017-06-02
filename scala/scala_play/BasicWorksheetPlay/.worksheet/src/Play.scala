object Play {;import org.scalaide.worksheet.runtime.library.WorksheetSupport._; def main(args: Array[String])=$execute{;$skip(57); 
  println("Welcome to the Scala worksheet");$skip(57); 
  
  
  def testFn(x: String) = println("You Gave " + x);System.out.println("""testFn: (x: String)Unit""");$skip(16); 
  testFn("123");$skip(33); 
  def testFn2 = testFn("Second");System.out.println("""testFn2: => Unit""");$skip(10); 
  testFn2;$skip(107); 
  
  def secondTestFn(x: String) {
  	def again(y: String) {
  		println("Well " + x + " : " + y)
  	}
  };System.out.println("""secondTestFn: (x: String)Unit""");$skip(28); 
  def a = secondTestFn("A");System.out.println("""a: => Unit""");$skip(24); val res$0 = 


  ((x:Int) => x+1)(5);System.out.println("""res0: Int = """ + $show(res$0));$skip(27); 
  val f = ((x:Int) => x+1);System.out.println("""f  : Int => Int = """ + $show(f ));$skip(7); val res$1 = 
  f(5);System.out.println("""res1: Int = """ + $show(res$1));$skip(14); val res$2 = 
  f.apply(67);System.out.println("""res2: Int = """ + $show(res$2));$skip(31); 
  val doubler = (i:Int)=>{i*2};System.out.println("""doubler  : Int => Int = """ + $show(doubler ));$skip(13); val res$3 = 
  doubler(5);System.out.println("""res3: Int = """ + $show(res$3));$skip(63); 
  def someOperation(f:(Int, Int)=>Int){
  	println(f(5,5))
  };System.out.println("""someOperation: (f: (Int, Int) => Int)Unit""");$skip(35); 
  val add = (x: Int, y:Int) => x+y;System.out.println("""add  : (Int, Int) => Int = """ + $show(add ));$skip(21); 
  someOperation(add);$skip(54); 
  def greeting() = (name:String)=>{"Hello " +
  name};System.out.println("""greeting: ()String => String""");$skip(21); 
  val g = greeting();System.out.println("""g  : String => String = """ + $show(g ));$skip(11); val res$4 = 
  g("TTT");System.out.println("""res4: String = """ + $show(res$4));$skip(14); 
 
  var y = 5;System.out.println("""y  : Int = """ + $show(y ));$skip(33); 
  val mutiplier = (x:Int) => x*y;System.out.println("""mutiplier  : Int => Int = """ + $show(mutiplier ));$skip(15); val res$5 = 
  mutiplier(4);System.out.println("""res5: Int = """ + $show(res$5));$skip(17); val res$6 = 
  
  
  1 :: Nil;System.out.println("""res6: List[Int] = """ + $show(res$6));$skip(20); val res$7 = 
  (1 :: (2 :: Nil));System.out.println("""res7: List[Int] = """ + $show(res$7))}
  
}
