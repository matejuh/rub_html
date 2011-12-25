#test some errors which are special handled
require 'test/unit'
require 'stringio'

require_relative '../lib/htmlparser/HtmlParser'

class TestHtmlParserErrors < Test::Unit::TestCase
  def setup
    ARGV.clear
    @stdout_orig=$stdout.clone
    $stdout=StringIO.new
    @stderr_orig=$stderr.clone
    $stderr=StringIO.new
  end

  def teardown
    $stdout=@stdout_orig
    $stderr=@stderr_orig
  end

  def test_wrong_nesting
    begin
      @htmlparser=HtmlParser::HtmlParser.new(ARGV<<"./sample/wrong_nesting.html")
    rescue SystemExit=>e
    end
    begin
      @htmlparser.parse
    rescue SystemExit=>e
    end
    @result=$stderr
    @result.rewind
    res=""
    @result.each_line { |x|  res << x }
    expected=/Mismatched input: found <\/div> expecting <\/p>/
    assert_match(expected,res)
  end

  def test_missing_quotations
    begin
      @htmlparser=HtmlParser::HtmlParser.new(ARGV<<"./sample/attr_without_quotations.html")
    rescue SystemExit=>e
    end
    begin
      @htmlparser.parse
    rescue SystemExit=>e
    end
    @result=$stderr
    @result.rewind
    res=""
    @result.each_line { |x|  res << x }
    expected=/Missing quotations around attribute name_of_class/
    assert_match(expected,res)
  end
  
  def test_unknown_attribute
    begin
      @htmlparser=HtmlParser::HtmlParser.new(ARGV<<"./sample/unknown_attribute.html")
    rescue SystemExit=>e
    end
    begin
      @htmlparser.parse
    rescue SystemExit=>e
    end
    @result=$stderr
    @result.rewind
    res=""
    @result.each_line { |x|  res << x }
    expected=/Unknown attribute name, or this attribute cannot be used with given tag: attr/
    assert_match(expected,res)
  end
  
  def test_unknown_tag
    begin
      @htmlparser=HtmlParser::HtmlParser.new(ARGV<<"./sample/unknown_tag.html")
    rescue SystemExit=>e
    end
    begin
      @htmlparser.parse
    rescue SystemExit=>e
    end
    @result=$stderr
    @result.rewind
    res=""
    @result.each_line { |x|  res << x }
    expected=/Unknown tagname omg/
    assert_match(expected,res)
  end
  
    def test_not_closed_tag
    begin
      @htmlparser=HtmlParser::HtmlParser.new(ARGV<<"./sample/not_closed_tag.html")
    rescue SystemExit=>e
    end
    begin
      @htmlparser.parse
    rescue SystemExit=>e
    end
    @result=$stderr
    @result.rewind
    res=""
    @result.each_line { |x|  res << x }
    expected=/found <\/body> expecting <\/div>/
    assert_match(expected,res)
  end
  
end