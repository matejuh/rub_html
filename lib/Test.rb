require_relative 'HtmlParserLexer'
require_relative 'HtmlParserParser'

# class ANTLR3::Recognizer
  # def error_message(e=$!)
    # # $!         The exception information message set by 'raise'.
    # puts e.class
    # case e
      # when UnwantedToken
      # token_name = token_name( e.expecting )
      # if token_name==:SVALUE.to_s
       # "atribute value doesnt start with \" found #{ token_error_display( e.unexpected_token ) }"
      # elsif e.unexpected_token.name==:EOF
        # "EOF"
      # else
      # "tags are probably overlapped, found #{ token_error_display( e.unexpected_token ) } expecting tag #{ token_name}"
      # end
      # when MismatchedToken
        # if e.unexpected_token==:EOF
        # "EOF"
        # else
          # "bbb"
        # end
    # end
  # end
# end

input = ANTLR3::FileStream.new( ARGF )
lexer = HtmlParser::Lexer.new(input)

# while lexer.next_token!=:EOF
  # puts lexer.next_token
# end
tokens=ANTLR3::CommonTokenStream.new(lexer)
parser = HtmlParser::Parser.new(tokens)

parser.document

# tree=parser.document.tree
#puts( "tree: #{ tree.inspect }" )