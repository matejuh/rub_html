require 'test/unit'
require 'stringio'

require_relative '../lib/htmlparser/HtmlParser'

class TestHtmlParser < Test::Unit::TestCase
  
  def setup
    ARGV.clear
    @stdout_orig=$stdout.clone
    $stdout=StringIO.new
    @stderr_orig=$stderr.clone
    $stderr=StringIO.new
    begin
      @htmlparser=HtmlParser::HtmlParser.new(ARGV<<"./sample/test.html")
    rescue SystemExit=>e
    end
    @htmlparser.parse
  end

  def teardown
    $stdout=@stdout_orig
    $stderr=@stderr_orig
  end
  
  def test_init
    assert_instance_of(HtmlParser::Options,@htmlparser.options)
  end
  
  def test_tokens
    assert_equal("<html>\n\t<head></head>\n\t<body></body>\n</html>",@htmlparser.tokens.to_s)
  end
  
  def test_tree
    assert_equal("(TAG html (TAG head) (TAG body))",@htmlparser.tree.inspect)
  end
  
  def test_output
    @result=$stdout
    @result.rewind
    res=""
    @result.each_line { |x|  res << x }
    expected="<html>\n\t<head>\n</head>\n\t<body></body>\n</html>\n"
    assert_equal(expected,res)
  end

end