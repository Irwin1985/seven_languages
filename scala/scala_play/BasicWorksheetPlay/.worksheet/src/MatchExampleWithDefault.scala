object MatchExampleWithDefault {;import org.scalaide.worksheet.runtime.library.WorksheetSupport._; def main(args: Array[String])=$execute{;$skip(76); 
  println("Welcome to the Scala worksheet");$skip(24); 

  var hoursWorked = 50;System.out.println("""hoursWorked  : Int = """ + $show(hoursWorked ));$skip(16); 
  var rate = 10;System.out.println("""rate  : Int = """ + $show(rate ));$skip(124); 

  def earnings(h: Double): Double = {
    if (h <= 40)
      h * rate
    else
      (h - 40) * rate * 1.5 + 40 * rate
  };System.out.println("""earnings: (h: Double)Double""");$skip(40); 

  println("£" + earnings(hoursWorked));$skip(30); 
  println("£" + earnings(30));$skip(30); 
  println("£" + earnings(45))}
 
}
