class TicTacToeValidator {
  // List of all possible winning patterns. Each pattern contains 3 . 
  // characters representing empty slots. If a board has all x's or all o's
  // in a pattern's slots, the board "exemplifies" that pattern.
  val winpatterns = List(
    ".?? .?? .??",
    "?.? ?.? ?.?",
    "??. ??. ??.",
    "... ??? ???",
    "??? ... ???",
    "??? ??? ...",
    "??. ?.? .??",
    ".?? ?.? ??." )

  // Returns true if 'board' exemplifies a win of 'pattern'
  def exemplifies(board: String, pattern: String): Boolean = {
    val f = for ((p, b) <- pattern.zip(board)) yield if (p == '.') b else ' '
    return (f.count(_ == 'x') == 3 || f.count(_ == 'o') == 3)
  }

  // Returns true if 'board' exemplifies a win of any pattern. 
  def validate(board: String): Boolean = {
    return winpatterns.exists(w => exemplifies(board, w))
  }
} 

val v = new TicTacToeValidator()

// Test against 3 test boards: no win, win, no win
val boards = List("xxo o?? oo?", "xxx ooo xxx", "xox oxo ???")

for (board <- boards) println(board, if (v.validate(board)) "win" else "no win")


