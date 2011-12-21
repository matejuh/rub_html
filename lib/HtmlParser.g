grammar HtmlParser;
options {output=AST;ASTLabelType = CommonTree;language=Ruby;}

@members {
  @tagMode = false
  
   def emit_error_message(message)
	 	puts @stack.pop
	    puts "Error: " + message
     end
}

//@lexer::members {
//
//	 
//	
//     
//}

document
	@init{@stack=[]}
	@after{puts @stack.pop}
	: 	{puts "in html doc"}
		OPENING_TAG ohtml=HTML {@stack << $ohtml;} END_TAG
		(head)?
		(body)?
		CLOSING_TAG HTML {puts @stack.pop} END_TAG
	;

head: 	OPENING_TAG HEAD END_TAG
		(head_element)?
		CLOSING_TAG HEAD END_TAG
	;

head_element
	:	title
	;
	
title
	:	OPENING_TAG TITLE END_TAG
		PCDATA?
		CLOSING_TAG TITLE END_TAG
	;

body:  OPENING_TAG BODY (id|style|klass|bgcolor|background)* END_TAG
	  //body_content_no_PCDATA
	  (body_content)* 
	  CLOSING_TAG BODY END_TAG
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
	
text: PCDATA 
	| text_tag
	;	
	
/*BLOCK ELEMENTS*/

/*HEADINGS*/
h1	:	OPENING_TAG H1 (id|style|klass|align)* END_TAG
		(block | text)*
		CLOSING_TAG H1 END_TAG
	;
	
h2	:	OPENING_TAG H2 (id|style|klass|align)* END_TAG
		(block | text)*
		CLOSING_TAG H2 END_TAG
	;
	
h3	:	OPENING_TAG H3 (id|style|klass|align)* END_TAG
		(block | text)*
		CLOSING_TAG H3 END_TAG
	;
	
h4	:	OPENING_TAG H4 (id|style|klass|align)* END_TAG
		(block | text)*
		CLOSING_TAG H4 END_TAG
	;
	
h5	:	OPENING_TAG H5 (id|style|klass|align)* END_TAG
		(block | text)*
		CLOSING_TAG H5 END_TAG
	;
	
h6	:	OPENING_TAG H6 (id|style|klass|align)* END_TAG
		(block | text)*
		CLOSING_TAG H6 END_TAG
	;

/*BLOCKS*/
paragraph
	:	OPENING_TAG P (id|style|klass|align)* END_TAG
		(text)*
		CLOSING_TAG P END_TAG
	;

div	:	OPENING_TAG DIV (id|style|klass|align)* END_TAG
		(body_content)*
		CLOSING_TAG DIV END_TAG
	;
	
/*FONTS*/
italic: OPENING_TAG I END_TAG
		(text)+
		CLOSING_TAG I END_TAG
	  ;
	  
bold  : OPENING_TAG B END_TAG
		(text)+
		CLOSING_TAG B END_TAG
	  ;
	  
underline: OPENING_TAG U END_TAG
		   (text)+
		   CLOSING_TAG U END_TAG
	     ;
	     
/*TABLE*/
table
	:	OPENING_TAG TABLE (id|style|klass|align|width|height|background|bgcolor|border)* END_TAG
	 	(PCDATA)*
	 	(tr)+
	 	CLOSING_TAG TABLE END_TAG
	;

tr	:	OPENING_TAG TR END_TAG
 		(PCDATA)*
 		(th | td)*
 		CLOSING_TAG TR END_TAG
	;

th  :	OPENING_TAG TH (id|style|klass|align|valign|width|height|background|bgcolor|bordercolor)* END_TAG
		(body_content)*
		CLOSING_TAG TH END_TAG
	;

td  :	OPENING_TAG TD (id|style|klass|align|valign|width|height|background|bgcolor|bordercolor)* END_TAG
		(body_content)*
		CLOSING_TAG TD END_TAG
	;	

/*SPECIAL*/
anchor: OPENING_TAG A END_TAG
		(text)*
		CLOSING_TAG A END_TAG
	  ;

img: OPENING_TAG IMG (id|style|klass|align|src|alt|width|height)*
	 END_NOPAIR_TAG
   ;
   
br: OPENING_TAG BR 
	END_NOPAIR_TAG
  ;
		

/*GENERAL PARAMETERS*/
id:WS ID attr_svalue;
style:WS STYLE attr_svalue;
klass:WS CLASS attr_svalue;
	
bgcolor:WS BGCOLOR attr_svalue;

background: WS BACKGROUND attr_svalue;

align: WS ALIGN attr_svalue;

src: WS SRC attr_svalue;

alt: WS ALT attr_svalue;

width: WS WIDTH attr_svalue;

height: WS HEIGHT attr_svalue;

bordercolor: WS BORDERCOLOR attr_svalue;

valign: WS VALIGN attr_svalue;

border: WS BORDER attr_svalue;
	
/*ASSIGN VALUES*/
attr_svalue: WS? ASSIGN WS? SVALUE;

/*TAGS*/
HTML: 'html' {puts "kkk"};

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


//('left'|'right'|'center'|'justify')

SVALUE: { @tagMode }?=>
        ( '"' (~'"')* '"'
        | '\'' (~'\'')* '\''
        )
    ;

NAME //{ @tagMode }?=>
    : 
      ( LETTER | '_' | ':') (NAMECHAR)*
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

