tree grammar HtmlPrinter;
options {
  language = Ruby;
  tokenVocab = HtmlParser;
  ASTLabelType = CommonTree;
}

@members{
  
  require 'colorize'
  
  def printStartTag(tag)
    print (("\t")*(tag.depth-1))
    print "<#{tag.text}".colorize(:green)
  end
  
  def printEndTag(tag)
    print (("\t")*(tag.depth-1))
    puts "</#{tag.text}>".colorize(:green)
  end
  
  def putsEndingBracket
    puts ">".colorize(:green)
  end
  
  def printEndingBracket
    puts ">".colorize(:green)
  end
  
  def putsEndTag(tag)
    puts "</#{tag.text}>".colorize(:green)
  end
}

document : html;
    
html: ^(TAG HTML {printStartTag($HTML);putsEndingBracket;} head? body?){putsEndTag($HTML);};

head : ^(TAG HEAD {printStartTag($HEAD);putsEndingBracket;} title_element){printEndTag($HEAD);}
     | ^(TAG HEAD {printStartTag($HEAD);putsEndingBracket;}){putsEndTag($HEAD);}
     ;

title_element: title;

title: ^(TAG TITLE{printStartTag($TITLE); putsEndingBracket;} pcdata){printEndTag($TITLE);}
     | ^(TAG TITLE{printStartTag($TITLE); printEndingBracket;}){putsEndTag($TITLE);}
     ;

body
    : ^(TAG BODY {printStartTag($BODY);} attrs {putsEndingBracket;} body_content+){printEndTag($BODY);}
    | ^(TAG BODY {printStartTag($BODY);} attrs {printEndingBracket;}){putsEndTag($BODY);}
    ;

body_content
  : text
  | body_tag 
  ;
  
text
  : pcdata
  | text_tags
  ;
  
pcdata: ^(DATA PCDATA) {($PCDATA.text).each_line{|line| if ((line.strip).length>0) then print (("\t")*($PCDATA.depth-1));puts line.strip; end;};}
      | PCDATA {($PCDATA.text).each_line{|line| if ((line.strip).length>0) then print (("\t")*($PCDATA.depth));puts line.strip; end;};}
      ;
  
text_tags
  : text_tag
  | special
  ;


text_tag : ^(TAG tag_name=(U|I|B|A) {printStartTag($tag_name);} attrs {putsEndingBracket;} text){printEndTag($tag_name);}
         | ^(TAG tag_name=(A) {printStartTag($tag_name);} attrs {printEndingBracket;}){printEndTag($tag_name);} 
         ;

special
  : ^(TAG tag_name=(IMG|BR) {printStartTag($tag_name);} attrs) {puts " \\>".colorize(:green)}
  ;
  
body_tag
  : heading 
  | block
  ;

heading  : ^(TAG tag_name=(H1|H2|H3|H4|H5|H6) {printStartTag($tag_name);} attrs {putsEndingBracket;} heading_data+){printEndTag($tag_name);}
         | ^(TAG tag_name=(H1|H2|H3|H4|H5|H6) {printStartTag($tag_name);} attrs {printEndingBracket;}){putsEndTag($tag_name);} 
         ;
         
heading_data : block
             | text
             ;
         
block  : paragraph
       | div
//       | table
       ;
       
paragraph
         : ^(TAG P {printStartTag($P);} attrs {putsEndingBracket;} text){printEndTag($P);}
         | ^(TAG P {printStartTag($P);} attrs {printEndingBracket;}){putsEndTag($P);} 
         ;

div: ^(TAG DIV {printStartTag($DIV);} attrs {putsEndingBracket;} body_content+){printEndTag($DIV);}
   | ^(TAG DIV {printStartTag($DIV);} attrs {printEndingBracket;}){putsEndTag($DIV);} 
   ;

attrs:attr*;

attr: ^(attr_name=(ID|STYLE|CLASS|BGCOLOR|BACKGROUND|ALIGN|SRC|ALT|WIDTH|HEIGHT|BORDERCOLOR|VALIGN|BORDER|HREF|NAME|TARGET) {print " #{$attr_name.text.colorize(:magenta)}"} attr_svalue);

attr_svalue: ^(ASSIGN {print "=".colorize(:magenta)} SVALUE {print ($SVALUE.text).colorize(:magenta)});
