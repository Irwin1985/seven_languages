import scala.io.Source

object filePlay {;import org.scalaide.worksheet.runtime.library.WorksheetSupport._; def main(args: Array[String])=$execute{;$skip(151); 
	val fileName = "/home/robert/otherGit/seven_languages/rjm/scala/scala_play/MyFirstScalaProject/BadWords.txt";System.out.println("""fileName  : String = """ + $show(fileName ));$skip(97); 
                                                  
  var censoredWords = Map[ String, String ]();System.out.println("""censoredWords  : scala.collection.immutable.Map[String,String] = """ + $show(censoredWords ));$skip(303); 
  censoredWords = Source
  		.fromFile(fileName )
  		.getLines
  		.toList
  		.filter(_.count(_ == ',') == 1)
  		.foldLeft(censoredWords) {
  		  (runningResult, mappingLine) =>
  		    {
  		      val terms = mappingLine.split(",")
  		      (runningResult + (terms(0) -> terms(1)))
  		    }
  		};$skip(113); 
  		
  		var x = Source
  			.fromFile(fileName)
  			.getLines
  			.toList
				.filter(_.count(_ == ',') == 1);System.out.println("""x  : List[String] = """ + $show(x ))}
  
}
