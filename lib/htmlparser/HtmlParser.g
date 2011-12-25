grammar HtmlParser;
options {output=AST;language=Ruby;}

tokens{
  TAG;DATA;
}
@members {
  require 'colorize'
  
  @tagMode = false 
  
  #def print()
  #  @input.each do |token|
  #    puts token_name(token.type)
  #  end
  #end

     def recover( re )
    exit
  end

     
   def error_message(e=$!)
     \$stderr.puts "Problem in formatting found!".colorize(:red)
     #puts "error message"
   	# $!         The exception information message set by 'raise'.
    #puts e.class
    #puts (e.input.at(e.input.position+2)).text
    case e
      when UnwantedToken
          if(token_name((e.input.at(e.input.position)).type)=="SVALUE")
            "Missing quotation around attribute #{e.token.text}"
          else
            token_name = token_name( e.expecting )
            "Extraneous input #{ token_error_display( e.unexpected_token ) } expecting #{ token_name }"
          end
          
      when MissingToken
        token_name = token_name( e.expecting )
        "Missing #{ token_name } at #{ token_error_display( e.symbol ) }"
        
      when MismatchedToken
        i=1
        while token_name((e.input.at(e.input.position-i)).type)=="WS"
          i+=1;
        end
        
        #puts token_name((e.input.at(e.input.position+1)).type)
        
        if(!((e.input.at(e.input.position-i)).nil?) && token_name((e.input.at(e.input.position-i)).type)=="CLOSING_TAG")
          "Mismatched input: found </#{e.token}> expecting </#{(token_name(e.expecting)).downcase}>"
        elsif(!((e.input.at(e.input.position-i)).nil?) && token_name((e.input.at(e.input.position-i)).type)=="OPENING_TAG")
          "Mismatched input: found <#{e.token}> expecting <#{(token_name(e.expecting)).downcase}>"
        elsif(!((e.input.at(e.input.position)).nil?) && token_name((e.input.at(e.input.position)).type)=="NAME")
          "Missing quotations around attribute #{(e.input.at(e.input.position)).text}"
        elsif(!(e.input.at(e.input.position+1)).nil? && (e.input.at(e.input.position+1)).type==NAME)
          "Unknown attribute name, or this attribute cannot be used with given tag: "<< (e.input.at(e.input.position+1)).text
        else
          token_name=""
          if token_name( e.expecting )=="SVALUE"
            token_name="attributte value"
          else
            token_name=(token_name(e.expecting)).downcase
          end
          "Mismatched input #{ token_error_display(e.symbol) } expecting #{token_name}"
        end
        
      when MismatchedTreeNode
        token_name = token_name( e.expecting )
        "Mismatched tree node: #{ e.symbol } expecting #{ token_name }"
      
      when NoViableAlternative
        if token_name(e.symbol.type)=="OPENING_TAG"
          i=1
          while token_name((e.input.at(e.input.position+i)).type)=="WS"
            i+=1;
          end
          "Unknown tagname "<< (e.input.at(e.input.position+i)).text
        elsif token_name(e.symbol.type)=="NAME"
          "Unknown attribute name, or this attribute cannot be used with given tag: "<< (e.input.at(e.input.position+1)).text
        else
          "No viable alternative at input " << token_error_display( e.symbol )
        end
      
      when MismatchedSet
        "Mismatched input \%s expecting set \%s" \%
        [ token_error_display( e.symbol ), e.expecting.inspect ]
      when MismatchedNotSet
        "Mismatched input \%s expecting set \%s" \%
        [ token_error_display( e.symbol ), e.expecting.inspect ]
      when FailedPredicate
        "Rule \%s failed predicate: { \%s }?" \% [ e.rule_name, e.predicate_text ]
      
      else
        e.message   
      end
    end
    
}
document: html;

html
	@init{@stack=[]}
	: OPENING_TAG HTML END_TAG 
		(head)?
		(body)?
		CLOSING_TAG HTML END_TAG -> ^(TAG HTML (head)? (body)?)
	;

head: 	OPENING_TAG HEAD END_TAG
		(head_element)?
		CLOSING_TAG HEAD END_TAG -> ^(TAG HEAD (head_element)?)
	;

head_element
	:	title 
	;
	
title
	:	OPENING_TAG TITLE END_TAG
		PCDATA?
		CLOSING_TAG TITLE END_TAG -> ^(TAG TITLE (PCDATA)?)
	;

body:  OPENING_TAG BODY (id|style|klass|bgcolor|background)* END_TAG
	  //body_content_no_PCDATA
	  (body_content)* 
	  CLOSING_TAG BODY END_TAG -> ^(TAG BODY id* style* klass* bgcolor* background* (body_content)*)
	;

//body_content_no_PCDATA
//	:	body_tag | text_tag
//	;

body_tag
	: heading 
	| block
	;

body_content
	: body_tag 
	| text
	;	
	
heading
	:	h1 | h2 | h3 | h4 | h5 | h6
	;
	
block
	: paragraph
	| div
	| table
	;	

font
	: italic
	| bold
	| underline 
	;

special
	: anchor 
	| img
	| br 
	;

text_tag
	: font 
	| special
	;
	
text
  : PCDATA -> ^(DATA PCDATA)
	| text_tag
	;	
	
/*BLOCK ELEMENTS*/

/*HEADINGS*/
h1	:	OPENING_TAG H1 (id|style|klass|align)* END_TAG
		heading_data*
		CLOSING_TAG H1 END_TAG  -> ^(TAG H1 id* style* klass* align* heading_data*)
	;
	
h2	:	OPENING_TAG H2 (id|style|klass|align)* END_TAG
		heading_data*
		CLOSING_TAG H2 END_TAG -> ^(TAG H2 id* style* klass* align* heading_data*)
	;
	
h3	:	OPENING_TAG H3 (id|style|klass|align)* END_TAG
		heading_data*
		CLOSING_TAG H3 END_TAG -> ^(TAG H3 id* style* klass* align* heading_data*)
	;
	
h4	:	OPENING_TAG H4 (id|style|klass|align)* END_TAG
		heading_data*
		CLOSING_TAG H4 END_TAG -> ^(TAG H4 id* style* klass* align* heading_data*)
	;
	
h5	:	OPENING_TAG H5 (id|style|klass|align)* END_TAG
		heading_data*
		CLOSING_TAG H5 END_TAG -> ^(TAG H5 id* style* klass* align* heading_data*)
	;
	
h6	:	OPENING_TAG H6 (id|style|klass|align)* END_TAG
		heading_data*
		CLOSING_TAG H6 END_TAG -> ^(TAG H6 id* style* klass* align* heading_data*)
	;

heading_data :block
             |text
             ;
/*BLOCKS*/
paragraph
	:	OPENING_TAG P (id|style|klass|align)* END_TAG
		(text)*
		CLOSING_TAG P END_TAG -> ^(TAG P id* style* klass* align* (text)*)
	;

div	:	OPENING_TAG DIV WS* (id|style|klass|align)* END_TAG
		(body_content)*
		CLOSING_TAG DIV END_TAG -> ^(TAG DIV id* style* klass* align* (body_content)*)
	;
	
/*FONTS*/
italic: OPENING_TAG I END_TAG
		(text)+
		CLOSING_TAG I END_TAG -> ^(TAG I (text)+)
	  ;
	  
bold  : OPENING_TAG B END_TAG
		(text)+
		CLOSING_TAG B END_TAG -> ^(TAG B (text)+)
	  ;
	  
underline: OPENING_TAG U END_TAG
		   (text)+
		   CLOSING_TAG U END_TAG -> ^(TAG U (text)+)
	     ;
	     
/*TABLE*/
table
	:	OPENING_TAG TABLE (id|style|klass|align|width|height|background|bgcolor|border)* END_TAG
	  // (PCDATA)*
	 	(tr)+
	 	CLOSING_TAG TABLE END_TAG -> ^(TAG TABLE id* style* klass* align* width* height* background* bgcolor* border* (tr)+)
	;

tr	:	OPENING_TAG TR END_TAG
 		//(PCDATA)*
 		(tr_data)*
 		CLOSING_TAG TR END_TAG -> ^(TAG TR (tr_data)*)
	;
	
tr_data : td
        | th
        ;

th  :	OPENING_TAG TH (id|style|klass|align|valign|width|height|background|bgcolor|bordercolor)* END_TAG
		(body_content)*
		CLOSING_TAG TH END_TAG -> ^(TAG TH id* style* klass* align* valign* width* height* background* bgcolor* bordercolor* (body_content)*)
	;

td  :	OPENING_TAG TD (id|style|klass|align|valign|width|height|background|bgcolor|bordercolor)* END_TAG
		(body_content)*
		CLOSING_TAG TD END_TAG -> ^(TAG TD id* style* klass* align* valign* width* height* background* bgcolor* bordercolor* (body_content)*)
	;	

/*SPECIAL*/
anchor: OPENING_TAG A (id|style|klass|align|href|name|target)* END_TAG
		(text)*
		CLOSING_TAG A END_TAG -> ^(TAG A id* style* klass* align* href* name* target* (text)*)
	  ;

img: OPENING_TAG IMG (id|style|klass|align|src|alt|width|height)*
	 END_NOPAIR_TAG -> ^(TAG IMG id* style* klass* align* src* alt* width* height*)
   ;
   
br: OPENING_TAG BR 
	END_NOPAIR_TAG -> ^(TAG BR)
  ;
		

/*GENERAL PARAMETERS*/
id:WS ID attr_svalue -> ^(ID attr_svalue);
style:WS STYLE attr_svalue -> ^(STYLE attr_svalue);
klass:WS CLASS attr_svalue -> ^(CLASS attr_svalue);
	
bgcolor:WS BGCOLOR attr_svalue -> ^(BGCOLOR attr_svalue);

background: WS BACKGROUND attr_svalue -> ^(BACKGROUND attr_svalue);

align: WS ALIGN attr_svalue -> ^(ALIGN attr_svalue);

src: WS SRC attr_svalue -> ^(SRC attr_svalue);

alt: WS ALT attr_svalue -> ^(ALT attr_svalue);

width: WS WIDTH attr_svalue -> ^(WIDTH attr_svalue);

height: WS HEIGHT attr_svalue -> ^(HEIGHT attr_svalue);

bordercolor: WS BORDERCOLOR attr_svalue -> ^(BORDERCOLOR attr_svalue);

valign: WS VALIGN attr_svalue -> ^(VALIGN attr_svalue);

border: WS BORDER attr_svalue -> ^(BORDER attr_svalue);

href: WS HREF attr_svalue -> ^(HREF attr_svalue);

name: WS ANAME attr_svalue -> ^(ANAME attr_svalue);

target: WS TARGET attr_svalue -> ^(TARGET attr_svalue);
	
/*ASSIGN VALUES*/
attr_svalue: WS? ASSIGN WS? SVALUE -> ^(ASSIGN SVALUE);

/*TAGS*/
HTML: 'html';

HEAD: 'head';

TITLE: 'title';

BODY: 'body';

/*HEADINGS*/
H1: 'h1';
H2: 'h2';
H3: 'h3';
H4: 'h4';
H5: 'h5';
H6: 'h6';

P  : 'p';
DIV: 'div';

I: 'i';
B: 'b';
U: 'u';

TABLE: 'table';
TR: 'tr';
TH: 'th';
TD: 'td';

A   : 'a';
IMG : 'img';
BR  : 'br';

OPENING_TAG: '<'{ @tagMode = true } WS?;
CLOSING_TAG: '</' { @tagMode = true } WS?;
END_TAG: WS '>' WS { @tagMode = false };
END_NOPAIR_TAG: WS '/>' WS { @tagMode = false };

/*ATTRS*/
ID : 'id';
CLASS: 'class';
STYLE: 'style';
BGCOLOR: 'bgcolor';
BACKGROUND: 'background';
ALIGN: 'align';
SRC: 'src';
ALT: 'alt';
WIDTH: 'width';
HEIGHT: 'height';
BORDER: 'border';
VALIGN: 'valign';
BORDERCOLOR: 'bordercolor';
ANAME: 'name';
HREF: 'href';
TARGET: 'target';


//('left'|'right'|'center'|'justify')

SVALUE: { @tagMode }?=>
        ( '"' (~'"')* '"'
        | '\'' (~'\'')* '\''
        )
    ;

NAME: ( LETTER | '_' | ':') (NAMECHAR)*
    ;

fragment NAMECHAR
    : LETTER | DIGIT | '.' | '-' | '_' | ':'
    ;


fragment DIGIT
    :    '0'..'9'
    ;

fragment LETTER
    : 'a'..'z'
    | 'A'..'Z'
    ;

ASSIGN :{ @tagMode }?=>'=';

WS  : 
       { @tagMode }?=>(' '|'\r'|'\t'|'\u000C'|'\n')*
    ;

PCDATA :{ !@tagMode }?=>(~'<')+ ; 

