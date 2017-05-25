package pack

import scala.io.Source
import akka.actor.{Actor, ActorRef, ActorSystem, Props}
import pack.Reaper.WatchMe

import scala.collection.mutable.ListBuffer


/*
object Main extends App {
  val system = ActorSystem("HelloSystem")
  // default Actor constructor
  val helloActor = system.actorOf(Props[HelloActor], name = "helloactor")
  helloActor ! "hello"
  helloActor ! "buenos dias"
}
*/

//PRocess message recieved by helloactor
case class Process ()

/**
  * Created by robert on 23/05/17.
  */
class SizerExampleFromBook {
  object PageLoader {
    def getPageSize(url : String) = Source.fromURL(url).mkString.length
  }

  class HelloActor(url : String) extends Actor {
    def receive = {
      case Process() => processURL(url)
      case _       => println("Unknown message ")

      //context.stop(self)
    }
  }


  var urls = List("http://www.amazon.com/",
    "http://www.twitter.com/",
    "http://www.cnn.com/",
    "http://www.metcarob.com/"
  )

  def processURL(url : String): Unit = {
    //println("Calling loader for " + url)
    println("Size for " + url + ": " + PageLoader.getPageSize(url) )
  }

  def getPageSizeSequentially() {
    for(url <- urls) {
      processURL(url)
    }
  }

  def getPageSizeConcurrently() {
    val system = ActorSystem("HelloActor")


    val helloActors = new ListBuffer[ActorRef]()
    //val helloActor = system.actorOf(Props(new HelloActor()), name = "helloActor")


    //Create a reaper
    val reaper = system.actorOf(Props[Reaper])

    var c = 1
    for(url <- urls) {
      helloActors += system.actorOf(Props(new HelloActor(url)), name = "helloActor" + c)
      c = c + 1
    }

    helloActors.foreach {
      reaper ! WatchMe(_)
    }
    //Thread.sleep(3000) // make sure WatchMe will be delivered before StartWork
    Thread.sleep(500) // make sure WatchMe will be delivered before StartWork
    helloActors.foreach {
      _ ! Process()
    }

    system.awaitTermination()

  }

  def timeMethod(method: () => Unit) = {
    val start = System.nanoTime()
    method()
    val end = System.nanoTime()
    println("Method took " + (end - start)/1000000000.0 + " seconds.")
  }

  def runTest() = {
    println("Sequentially")
    timeMethod(getPageSizeSequentially)
    timeMethod(getPageSizeConcurrently)
    println("")
  }
}
