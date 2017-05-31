import scala.io.Source

trait Censor {
  val fileName = "/home/robert/otherGit/seven_languages/rjm/scala/scala_play/MyFirstScalaProject/BadWords.txt"
  var censoredWords = Map[ String, String ]()
  censoredWords = Source
  		.fromFile(fileName )
  		.getLines
  		.toList
  		.filter(_.count(_ == ',') == 1)
  		.foldLeft(censoredWords) {
  		  (censoredWords2, mappingLine) =>
  		    {
  		      val terms = mappingLine.split(",")
  		      (censoredWords2 + (terms(0) -> terms(1)))
  		    }
  		}  
  
  def censor(content: String) : String = {
    
    censoredWords.foldLeft(content)(
        (censoredContent, censoredWord) => {
            censoredContent.replaceAll(
                ("(?i)\\b" + censoredWord._1 + "\\b"),
                censoredWord._2
            )
        }
    )
  }
}


