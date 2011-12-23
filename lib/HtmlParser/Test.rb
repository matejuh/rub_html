require_relative 'HtmlParserLexer'
require_relative 'HtmlParserParser'
require_relative 'HtmlPrinter'

input = ANTLR3::FileStream.new( ARGF )
lexer = HtmlParser::Lexer.new(input)

# while lexer.next_token!=:EOF
  # puts lexer.next_token
# end
tokens=ANTLR3::CommonTokenStream.new(lexer)

#puts "tokens: #{tokens}"
parser = HtmlParser::Parser.new(tokens)

#parser.document
#parser.print

tree=parser.document.tree

puts( "tree: #{ tree.inspect }" )

#puts tree.has_child?(tree.root)

#puts tree.root

#elements=[]
#visitor=ANTLR3::AST::Visitor.new(tree ) do |node, parent, child_index, labels|
#      elements << node.to_s
#    end

#puts elements.size
nodes=ANTLR3::AST::CommonTreeNodeStream.new(tree,:token_stream => parser.input)

HtmlPrinter::TreeParser.new(nodes).document
