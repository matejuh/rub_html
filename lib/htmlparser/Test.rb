require_relative 'HtmlParserLexer'
require_relative 'HtmlParserParser'
require_relative 'HtmlPrinter'

input = ANTLR3::FileStream.new( ARGF )
lexer = HtmlParser::Lexer.new(input)

tokens=ANTLR3::CommonTokenStream.new(lexer)

parser = HtmlParser::Parser.new(tokens)

tree=parser.document.tree

#puts( "tree: #{ tree.inspect }" )

nodes=ANTLR3::AST::CommonTreeNodeStream.new(tree,:token_stream => parser.input)

HtmlPrinter::TreeParser.new(nodes).document
