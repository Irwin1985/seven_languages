
object Day2CensorApp extends App {
  
  
    println("Start of Day2Censor App")
  
 
    val b = new Book("The shortest darn book in the world!")

    println(b.getContent())
    
    
    println("Censored Version:")
    println(b.getCensoredContent())

    println("Start of Day2Censor App")
}