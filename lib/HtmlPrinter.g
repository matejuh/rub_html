tree grammar HtmlPrinter;
options {
  language = Ruby;
  tokenVocab = HtmlParser;
  ASTLabelType = CommonTree;
}

@members{
  
  def printStartTag(tag)
    print (("\t")*(tag.depth-1))
    print "<#{tag.text}"
  end
  
  def printEndTag(tag)
    print (("\t")*(tag.depth-1))
    puts "</#{tag.text}>"
  end
}
document : html;
    
// print (("\t")*($HTML.depth-1)); puts "<html>"    
    
html: ^(TAG HTML {printStartTag($HTML);puts">";} head? body?){puts "</html>"};

head : ^(TAG HEAD {printStartTag($HEAD);puts">";} title_element){printEndTag($HEAD);}
     | ^(TAG HEAD {printStartTag($HEAD);print">";}){puts "</head>"}
     ;

title_element: title;

title: ^(TAG TITLE{printStartTag($TITLE); print">"} (PCDATA)?{if !($PCDATA.nil?) then print $PCDATA.text; end }){puts "</title>"};

body: ^(TAG BODY {printStartTag($BODY);} attrs {puts ">"} body_content){printEndTag($BODY);}
    | ^(TAG BODY {printStartTag($BODY);} attrs {print ">"}){puts "</body>"}
    ;

body_content
  : text
//  || body_tag 
  ;
  
text
  : PCDATA {print $PCDATA.text;}
  | text_tag
  ;
  
text_tag
  : fonts
  // | special
  ;

fonts: ^(TAG tag_name=(U|I|B) {printStartTag($tag_name);} text){printEndTag($tag_name);}
     | ^(TAG tag_name=(U|I|B) {printStartTag($tag_name);}){print "</#{$tag_name.text}>"}
     ;

//special
//  : anchor 
//  | img
//  | br 
//  ;

attrs:attr*;

attr: ^(attr_name=(ID|STYLE|CLASS|BGCOLOR|BACKGROUND|ALIGN|SRC|ALT|WIDTH|HEIGHT|BORDERCOLOR|VALIGN|BORDER|HREF|NAME|TARGET) {print " #{$attr_name.text}"} attr_svalue);

attr_svalue: ^(ASSIGN {print "="} SVALUE {print ($SVALUE.text)});
