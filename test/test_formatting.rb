#a few test on formatting
require 'test/unit'
require 'stringio'

require_relative '../lib/htmlparser/HtmlParser'

class TestHtmlParserFormatting < Test::Unit::TestCase
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

  def test_oneline
    begin
      @htmlparser=HtmlParser::HtmlParser.new(ARGV<<"./sample/test1.html")
    rescue SystemExit=>e
    end
    begin
      @htmlparser.parse
    rescue SystemExit=>e
    end
    @result=$stdout
    @result.rewind
    res=""
    @result.each_line { |x|  res << x }
    expected="<html>\n\t<head>\n\t\t<title>\n\t\t\tTitle\n\t\t</title>\n\t</head>\n\t<body>\n\t\tBody\n\t\t<div>\n\t\t\tIn div\n\t\t\t<p>\n\t\t\t\tIn p in div\n\t\t\t</p>\n\t\t\t<div>\n\t\t\t\tIn div in div\n\t\t\t\t<div>\n\t\t\t\t\tIn div in div in div\n\t\t\t\t</div>\n\t\t\t\t<div>\n\t\t\t\t\tText\n\t\t\t\t</div>\n\t\t\t</div>\n\t\t</div>\n\t</body>\n</html>\n"
    assert_equal(expected,res)
  end

  def test_complicated
    begin
      @htmlparser=HtmlParser::HtmlParser.new(ARGV<<"./sample/test2.html")
    rescue SystemExit=>e
    end
    begin
      @htmlparser.parse
    rescue SystemExit=>e
    end
    @result=$stdout
    @result.rewind
    res=""
    @result.each_line { |x|  res << x }
    expected="<html>\n\t<head>\n\t\t<title>\n\t\t\tTitle\n\t\t</title>\n\t</head>\n\t<body>\n\t\t<h1 id=\"id\" style=\"style\" class=\"class\" align=\"center\">\n\t\t\tTest File\n\t\t</h1>\n\t\t<div>\n\t\t\t<div id=\"id_value\" class=\"class_name\"></div>\n\t\t\t<img src=\"path/img\" \\>\n\t\t</div>\n\t\t<div>\n\t\t\t<a href=\"link\" name=\"name\" target=\"target\">\n\t\t\t\tVestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae;\n\t\t\t</a>\n\t\t</div>\n\t\t<div>\n\t\t\tNunc nec dui ut lectus sagittis rutrum. Aliquam faucibus, arcu at rhoncus pretium, augue est sagittis nulla, ac mollis turpis mi eget quam.\n\t\t\tProin ornare est non lectus bibendum faucibus. Ut quis est varius quam pulvinar tristique. Morbi ultrices tellus at leo aliquam tempus.\n\t\t\tCum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Etiam lobortis, lorem a condimentum fermentum,\n\t\t\tlibero tellus fringilla odio, at ornare metus nisl sit amet eros. Etiam fringilla, enim vitae consequat posuere, tellus ligula volutpat augue,\n\t\t\t<br \\>\n\t\t\tvitae sodales orci leo eu ligula. Vestibulum consequat nulla vitae nunc dictum volutpat. Nunc et eleifend nunc.\n\t\t\tVestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae;\n\t\t\tDonec condimentum gravida tempus. Suspendisse vitae augue eget erat volutpat sagittis. Fusce aliquam lacinia augue.\n\t\t</div>\n\t\t<div>\n\t\t\tVestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pretium sagittis\n\t\t\tvulputate. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos\n\t\t\t<div>\n\t\t\t\t<div>\n\t\t\t\t\t<table width=\"4\" height=\"3\" background=\"white\" bgcolor=\"black\" border=\"solid\">\n\t\t\t\t\t\t<tr>\n\t\t\t\t\t\t\t<th>\n\t\t\t\t\t\t\t\t1\n\t\t\t\t\t\t\t</th>\n\t\t\t\t\t\t\t<th>\n\t\t\t\t\t\t\t\t2\n\t\t\t\t\t\t\t</th>\n\t\t\t\t\t\t</tr>\n\t\t\t\t\t\t<tr>\n\t\t\t\t\t\t\t<td>\n\t\t\t\t\t\t\t\t3\n\t\t\t\t\t\t\t</td>\n\t\t\t\t\t\t\t<td>\n\t\t\t\t\t\t\t\t4\n\t\t\t\t\t\t\t</td>\n\t\t\t\t\t\t</tr>\n\t\t\t\t\t</table>\n\t\t\t\t</div>\n\t\t\t</div>\n\t\t</div>\n\t\t<h2>\n\t\t\tHeading 2\n\t\t</h2>\n\t\t<h3>\n\t\t\tHeading 3\n\t\t</h3>\n\t\t<h4>\n\t\t\tHeading 4\n\t\t</h4>\n\t\t<h5>\n\t\t\tHeading 5\n\t\t</h5>\n\t\t<h6>\n\t\t\tHeading 6\n\t\t</h6>\n\t\t<div>\n\t\t\tMauris vel convallis ante.\n\t\t\tDonec rutrum commodo turpis vel blandit. Aenean consequat, sapien quis consectetur blandit, odio dolor congue arcu,\n\t\t\tquis commodo enim neque non urna.\n\t\t\t<img src=\"path/img.jpg\" alt=\"img\" \\>\n\t\t</div>\n\t\t<div>\n\t\t\t<i>\n\t\t\t\titalic text\n\t\t\t</i>\n\t\t\t<b>\n\t\t\t\tbold text\n\t\t\t</b>\n\t\t\t<u>\n\t\t\t\tunderline text\n\t\t\t</u>\n\t\t</div>\n\t</body>\n</html>\n"
    assert_equal(expected,res)
  end
end