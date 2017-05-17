

class Book( val content: String ) extends Censor {

    def getContent() = this.content

    def getCensoredContent() = this.censor( this.getContent )

}