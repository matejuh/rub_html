require 'test/unit'
require 'stringio'

require_relative '../lib/htmlparser/Options'

class TestHtmlParserOptions < Test::Unit::TestCase
  def setup
    ARGV.clear
    @stdout_orig=$stdout.clone
    $stdout=StringIO.new
    @stderr_orig=$stderr.clone
    $stderr=StringIO.new
  end

  def test_help_message
    begin
      HtmlParser::Options.new(ARGV<<"-h")
    rescue SystemExit=>e
    end
    @result=$stdout
    @result.rewind
    res=""
    @result.each_line { |x|  res << x }
    expected="Usage:  htmlParser [ options ]  path/to/input_file...\n    -o, --output FILE                Path to output file (output to STDOUT otherwise)\n    -h, --help                       Show this message\n"
    assert_equal(expected,res)
  end

  def test_help_exit
    assert_raise(SystemExit){HtmlParser::Options.new(ARGV<<"-h")}
  end

  def test_output_filenotspecified
    begin
      HtmlParser::Options.new(ARGV<<"-o")
    rescue SystemExit=>e
    end
    @result=$stderr
    @result.rewind
    res=""
    @result.each_line { |x|  res << x }
    expected=/missing argument: -o/
    assert_match(expected,res)
  end

  def test_output
    begin
      ARGV.clear
      parser=HtmlParser::Options.new(ARGV << "-o ./output.html"<< "./sample/test.html")
    rescue SystemExit=>e
    end
    assert_equal(" ./output.html",parser.output_file)
    assert_equal(true,parser.output_to_file)
  end

  def test_unknown_argument
    begin
      HtmlParser::Options.new(ARGV<<"-k")
    rescue SystemExit=>e
    end
    @result=$stderr
    @result.rewind
    res=""
    @result.each_line { |x|  res << x }
    expected=/invalid option: -k\n/
    assert_match(expected,res)
  end

  def test_multiple_input
    begin
      HtmlParser::Options.new(ARGV<<"./file1"<<"./file2")
    rescue SystemExit=>e
    end
    @result=$stderr
    @result.rewind
    res=""
    @result.each_line { |x|  res << x }
    expected="Only one input file can be specified\n"
    assert_equal(expected,res)
  end

  def test_input_notexists
    begin
      HtmlParser::Options.new(ARGV<<"./file1")
    rescue SystemExit=>e
    end
    @result=$stderr
    @result.rewind
    res=""
    @result.each_line { |x|  res << x }
    expected="File ./file1 does not exists\n"
    assert_equal(expected,res)
  end

  def test_input_exists
    begin
      parser=HtmlParser::Options.new(ARGV<<"./sample/test.html")
    rescue SystemExit=>e
    end
    assert_equal("./sample/test.html",parser.input_file)
  end

  def test_empty_input
    begin
      HtmlParser::Options.new(ARGV)
    rescue SystemExit => e
    end
    @result=$stderr
    @result.rewind
    res=""
    @result.each_line { |x|  res << x }
    expected="Missing input file\n"
    assert_equal(expected,res)
  end

  def teardown
    $stdout=@stdout_orig
    $stderr=@stderr_orig
  end

end