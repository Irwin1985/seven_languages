

object MyFirstApp extends App {
  override def main(args: Array[String]): Unit = {
    
    val b = new TicTacToeBoard()
    
    println("Hello, world!")
    
    var x_next = true;
    
    b.printBoard();
    while (b.getWinner()=="_") {
      if (x_next) {
        print("X to move:");
      } else {
        print("O to move:");
      }
      val inp = scala.io.StdIn.readLine().toLowerCase();
      if (inp=="x") {
        println("Aborted");
        return;
      }
      val pos = b.getBoardPos(inp);
      if (pos == -1) {
        println("Error bad input. Enter 2 letter co-ordinate (like 'B2')");
      } else {
        if (!b.makeMove(pos, x_next)) {
          println("Bad Move");
        } else {
          x_next = !(x_next);
        }
      }
      b.printBoard();
    }
    println("Winner: " + b.getWinner());
    
  } 
}