

class TicTacToeBoard() {
  var board = Array(0,0,0,0,0,0,0,0,0);
  
  def getVal(v: Int): String = {
    if (v==0) return "_"; 
    if (v==1) return "X";
    return "O";
  };
  
  //row and col are 0 based
  def getPositionValue(row: Int, col: Int): Int = {
    return board(getPosition(row,col));
  }
  
  def getPosition(row: Int, col: Int): Int = {
    return (row*3)+col;
  }
  println("XXX");
  
  def printBoard() {
    println("  A B C");
    for ( row <- (0 to 2)) {
      print((row+1) + " ");
      for ( col <- (0 to 2)) {
        print(getVal(getPositionValue(row,col)));  
        if ( col < 2) print("|");
      };
      println("");
    };
  };
  
  def getWinner(): String = {
    // check rows
    for ( row <- (0 to 2)) {
      if (getPositionValue(row,0)!=0) {
        if (getPositionValue(row,0)==getPositionValue(row,1)) {
          if (getPositionValue(row,0)==getPositionValue(row,2)) {
            return getVal(getPositionValue(row,0));
          }
        }
      }
    }
    
    // check cols
    for ( col <- (0 to 2)) {
      if (getPositionValue(0,col)!=0) {
        if (getPositionValue(0,col)==getPositionValue(1,col)) {
          if (getPositionValue(0,col)==getPositionValue(2,col)) {
            return getVal(getPositionValue(0,col));
          }
        }
      }
    }
    
    // check diagonals
    if (getPositionValue(0,0)!=0) {
      if (getPositionValue(0,0)==getPositionValue(1,1)) {
        if (getPositionValue(0,0)==getPositionValue(2,2)) {
          return getVal(getPositionValue(0,0));
        }
      }
    }
    if (getPositionValue(0,2)!=0) {
      if (getPositionValue(0,2)==getPositionValue(1,1)) {
        if (getPositionValue(0,2)==getPositionValue(2,0)) {
          return getVal(getPositionValue(0,2));
        }
      }
    }
    
    return "_"; //No winner
  }
  
  def getBoardPos(inp: String): Int = {
    if (inp.length()!=2) return -1;
    var col = -1;
    val colS = inp.substring(0,1);
    if (colS == "a") col = 0; 
    if (colS == "b") col = 1; 
    if (colS == "c") col = 2; 
    if (col == -1) return -1;
    var row = -1;
    val rowS = inp.substring(1, 2);
    if (rowS == "1") row = 0;
    if (rowS == "2") row = 1;
    if (rowS == "3") row = 2;
    if (row == -1) return -1;
    return getPosition(row,col);
  }
  
  def makeMove(boardPos: Int, x: Boolean): Boolean = {
    if (board(boardPos)==0) {
      if (x) {
        board(boardPos)=1
      } else {
        board(boardPos)=2
      }
      return true;
    };
    return false;
  }
}