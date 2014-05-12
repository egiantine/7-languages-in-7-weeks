
// Use foldLeft to compute total size of a list of strings.
val list = List("a", "bb", "ccc")
list.foldLeft(0)((sum, s) => sum + s.size)

// Censor trait
trait Censor {
  val rules = Map("Shoot" -> "Pucky", "Darn" -> "Beans")
  def apply(input: String): String = {
    val words = input.split(" ")
    val rewritten = words.map(w => if (rules.contains(w)) rules(w) else w)
    return rewritten.mkString(" ")
  }  
}

class CensorString(v: String) extends Object with Censor {
  override def toString = apply(v)
}


println (new CensorString("Darn Shooting No Substring Match"))
println (new CensorString("Shoot I'm Darn"))


