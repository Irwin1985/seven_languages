package pack

import akka.actor.ActorSystem

import scala.concurrent.duration.Duration
import scala.concurrent.{Await, Future}
import scala.io.Source

// the following is equivalent to `implicit val ec = ExecutionContext.global`
import scala.concurrent.ExecutionContext.Implicits.global

/**
  * Created by robert on 25/05/17.
  */
class FutureTest {
  object PageLoader {
    def getPageSize(url : String) = Source.fromURL(url).mkString.length
  }
  def processURL(url : String): Unit = {
    //println("Calling loader for " + url)
    println("Size for " + url + ": " + PageLoader.getPageSize(url) )
  }

  var urls = List("http://www.amazon.com/",
    "http://www.twitter.com/",
    "http://www.twitter.com/",
    "http://www.twitter.com/",
    "http://www.twitter.com/",
    "http://www.twitter.com/",
    "http://www.twitter.com/",
    "http://www.twitter.com/",
    "http://www.twitter.com/",
    "http://www.twitter.com/",
    "http://www.twitter.com/",
    "http://www.twitter.com/",
    "http://www.twitter.com/",
    "http://www.twitter.com/",
    "http://www.twitter.com/",
    "http://www.twitter.com/",
    "http://www.twitter.com/",
    "http://www.twitter.com/",
    "http://www.twitter.com/",
    "http://www.cnn.com/",
    "http://www.cnn.com/",
    "http://www.cnn.com/",
    "http://www.cnn.com/",
    "http://www.cnn.com/",
    "http://www.cnn.com/",
    "http://www.cnn.com/",
    "http://www.cnn.com/",
    "http://www.cnn.com/",
    "http://www.cnn.com/",
    "http://www.cnn.com/",
    "http://www.cnn.com/",
    "http://www.cnn.com/",
    "http://www.cnn.com/",
    "http://www.cnn.com/",
    "http://www.cnn.com/",
    "http://www.cnn.com/",
    "http://www.cnn.com/",
    "http://www.cnn.com/",
    "http://www.metcarob.com/"
  )


  def sequentalRun() {
    for(url <- urls) {
      processURL(url)
    }
  }


  def concurrentRun() {


    val system = ActorSystem("HelloActor")

    // Spawn your futures
    val fs = urls.map { i =>
      Future {
        //println(i)
        //println("start " + i)
        processURL(i)
        //println("end " + i)
      }
    }

    /*
  val fs = (1 to 100).map { i =>
    Future {
      println("Sleeping for " + i)
      Thread.sleep(1000);
      i
    }
  }*/

    // Wrap all of the work up into a single
    // Future
    val f = Future.sequence(fs)

    // Wait on it forever - i.e. until it's done
    Await.result(f, Duration.Inf)

    // Shut down
    system.shutdown()
  }
}
