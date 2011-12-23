require 'optparse'

module HtmlParser
  class Options
    
    attr_reader :output_file, :output_to_file, :input_file
    
    def initialize(argv)
      @output_to_file=false
      parse(argv)

      if argv.empty?
        STDERR.puts "Missing input file"
        argv.clear
        parse(argv<<"-h")
      end
      if argv.length>1
        STDERR.puts "Only one input file can be specified"
        argv.clear
        parse(argv<<"-h")
      end
      
      if !File.exists?(argv[0])
        STDERR.puts "File #{argv[0]} does not exists"
        exit
      end
      
      @input_file=argv[0]
      
    end

    def parse(argv)
        OptionParser.new do |opts|
        opts.banner = "Usage:  htmlParser [ options ]  path/to/input_file..."

        opts.on("-o", "--output FILE", String, "Path to output file (output to STDOUT otherwise)") do |path|
          @output_file = path
          @output_to_file=true
        end

        opts.on("-h", "--help", "Show this message") do
          puts opts
          exit
        end

        begin
          if ARGV.empty?
            $stderr.puts "Missing input file"
            ARGV << "-h" 
          end
          opts.parse!(ARGV)
        rescue OptionParser::ParseError => e
        STDERR.puts e.message, "\n", opts
        exit(-1)
        end
      end
    end

  end
end