object Day_2_total_size_of_strings {;import org.scalaide.worksheet.runtime.library.WorksheetSupport._; def main(args: Array[String])=$execute{;$skip(80); 
  println("Welcome to the Scala worksheet");$skip(203); 
  
  //Use foldLeft to caculate total size of a list of strings
   // The foldLeft() class method creates and returns a curried function.
  
   val myList = List("DDE", "fdsd", "ddccsdgffff", "dfdsdfs");System.out.println("""myList  : List[String] = """ + $show(myList ));$skip(93); 
   val res = myList.foldLeft(0)(
   	(running, item) => {
   		running + item.length()
   });System.out.println("""res  : Int = """ + $show(res ));$skip(129); 
   
   //Using alternative notation
   val res2 = (0 /: myList){
     (running, item) => {
   		 running + item.size
     }
   };System.out.println("""res2  : Int = """ + $show(res2 ))}
   
}
