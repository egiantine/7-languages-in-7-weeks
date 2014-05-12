import scala.io._
import scala.actors._
import Actor._

// START:loader
object PageLoader {
 def getLinkCount(url : String) = Source.fromURL(url)(io.Codec("iso-8859-1")).mkString.split("<").count(_.contains("http"))
 
}
// END:loader

val urls = List("http://www.amazon.com/", 
               "http://www.twitter.com/",
               "http://www.google.com/",
               "http://www.cnn.com/" )

// START:time
def timeMethod(method: () => Unit) = {
 val start = System.nanoTime
 method()
 val end = System.nanoTime
 println("Method took " + (end - start)/1000000000.0 + " seconds.")
}
// END:time

// START:sequential
def getLinkCountSequentially() = {
 for(url <- urls) {
   println("Size for " + url + ": " + PageLoader.getLinkCount(url))
 }
}
// END:sequential

// START:concurrent
def getLinkCountConcurrently() = {
 val caller = self

 for(url <- urls) {
   actor { caller ! (url, PageLoader.getLinkCount(url)) }
 }

 for(i <- 1 to urls.size) {
   receive {
     case (url, count) =>
       println("count for " + url + ": " + count)            
   }
 }
}
// END:concurrent

// START:script
println("Sequential run:")
timeMethod { getLinkCountSequentially }

println("Concurrent run")
timeMethod { getLinkCountConcurrently }
// END:script
