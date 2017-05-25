package pack



/**
  * Created by robert on 23/05/17.
  */
object MainApp {

  def timeMethod(method: () => Unit) = {
    val start = System.nanoTime()
    method()
    val end = System.nanoTime()
    println("Method took " + (end - start)/1000000000.0 + " seconds.")
  }



  def main(args: Array[String]): Unit = {
    println("MAin App Start")

    //var a = new SizerExampleFromBook
    //a.runTest()

    var ccc = new FutureTest


    println("Seq")
      var ft2 = timeMethod(ccc.sequentalRun)


    println("\n\n")
      println("Concurrent")
      var ft = timeMethod(ccc.concurrentRun)

    println("MAin App end")
  }
}
