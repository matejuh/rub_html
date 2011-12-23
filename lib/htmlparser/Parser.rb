require_relative 'Options'

module HtmlParser
  class Parser
    
    def initialize(argv)
      @options=Options.new(argv)
    end

    def parse
      if(@options.output_to_file)
        puts "path to output file #{@options.output_file}"
      end
      puts "input file #{@options.input_file}"
    end
  end
end