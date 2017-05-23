package pack

import akka.actor.{Actor, ActorRef, Terminated}
import scala.collection.mutable.ArrayBuffer

object Reaper {
  // Used by others to register an Actor for watching
  case class WatchMe(ref: ActorRef)
}

class Reaper extends Actor {
  import Reaper._

  // Keep track of what we're watching
  val watched = ArrayBuffer.empty[ActorRef]

  // Derivations need to implement this method.  It's the
  // hook that's called when everything's dead
  def allSoulsReaped(): Unit = context.system.shutdown()

  // Watch and check for termination
  final def receive = {
    case WatchMe(ref) =>
      println("Watching " + ref.toString())
      context.watch(ref)
      watched += ref
    case Terminated(ref) =>
      println("TERM "+ ref.toString())
      watched -= ref
      if (watched.isEmpty) allSoulsReaped()
  }
}