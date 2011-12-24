require 'colorize'

require_relative 'Options'

require_relative 'HtmlParserLexer'
require_relative 'HtmlParserParser'
require_relative 'HtmlPrinter'

module HtmlParser
  class HtmlParser
    
    attr_reader :options, :parser, :tree, :tokens
    
    def initialize(argv)
      @options=Options.new(argv)
    end

    def parse
      orig_std_out=nil
      if(@options.output_to_file)
        orig_std_out = STDOUT.clone
        STDOUT.reopen(File.open(@options.output_file,'w+'))
      end
      
      input = ANTLR3::FileStream.new(@options.input_file)
      
      lexer = Lexer.new(input)
      
      @tokens=ANTLR3::CommonTokenStream.new(lexer)
      
      parser = Parser.new(@tokens)
      
      #parser.document
      @tree=parser.document.tree
      
      #puts( "tree: #{ tree.inspect }" )
      
      $stderr.puts "Document is well-formed! Formatted output: ".colorize(:yellow)
      $stderr.puts ""
      
      nodes=ANTLR3::AST::CommonTreeNodeStream.new(tree,:token_stream => parser.input)
      
      HtmlPrinter::TreeParser.new(nodes).document
      
      if(@options.output_to_file)
        STDOUT.reopen(orig_std_out)
      end
    end
  end
end