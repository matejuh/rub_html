grammar HtmlParser;

class HTMLParser extends Parser;
options {
	exportVocab=HTML;
	k = 1;
}

document
	: 	(PCDATA)? (DOCTYPE (PCDATA)?)?
		(OHTML (PCDATA)?)?
		(head)?
		(body)?
		(CHTML (PCDATA)?)?
	;

head: 	(OHEAD (PCDATA)?)?
		head_element
		(PCDATA | head_element)* 
		(CHEAD (PCDATA)?)? 
	;

head_element
	:	title	//bug need at least a title, rest optional
	;
	
title
	:	OTITLE (PCDATA)? CTITLE
	;

body: 	( OBODY (PCDATA)* )? 
		body_content_no_PCDATA
		( body_content )+ 
		( CBODY (PCDATA)* )? 
	;
	
body_content_no_PCDATA
	:	body_tag | text_tag
	;

body_tag
	: 	heading | block
	;

body_content
	: 	body_tag | text
	;	
	
heading
	:	h1 | h2 | h3 | h4 | h5 | h6
	;
	
block
	:	paragraph | div | table
	;	

font:	italic | bold | underline 
	;

special
	:	anchor | IMG | BR 
	;

text_tag
	:	font | special
	;
	
text:	PCDATA | text_tag
	;
	
/*BLOCK ELEMENTS*/

h1	:	OH1 (block | text)* CH1
	;
h2	:	OH2 (block | text)* CH2
	;
h3	:	OH3 (block | text)* CH3
	;
h4	:	OH4 (block | text)* CH4
	;
h5	:	OH5 (block | text)* CH5
	;
h6	:	OH6 (block | text)* CH6
	;
	
paragraph
	:	OPARA
		(
			options {
				generateAmbigWarnings=false;
			}
		:	text
		)*
		(CPARA)?	
	;	
	
div	:	ODIV (body_content)* CDIV		//semi-revised
	;	
	
table
	:	OTABLE (PCDATA)* (tr)+ CTABLE
	;

tr	:	O_TR (PCDATA)* (th_or_td)* (C_TR (PCDATA)*)? 
	;

th_or_td
	:	O_TH_OR_TD (body_content)* (C_TH_OR_TD (PCDATA)*)?
	;

italic
	:	OITALIC ( text )+ CITALIC
	;

bold:	OBOLD ( text )+ CBOLD
	;

anchor
	:	OANCHOR (text)* CANCHOR
	;
	
underline
	:	OUNDER ( text )+ CUNDER
	;
	
class HTMLLexer extends Lexer;
options {	
	k = 4;
	exportVocab=HTML;
	charVocabulary = '\3'..'\377';
	caseSensitive=false;
	filter=UNDEFINED_TOKEN;
}
			
DOCTYPE 
options {
ignore=WS;
}
	: "<!doctype" "html" "public" STRING '>'
	;

OHTML: "<html>";
CHTML: "</html";

OHEAD
	: 	"<head>"
	;

CHEAD
	: 	"</head>"
	;

OBODY
	:	"<body" (WS (ATTR )*)? '>' 
	;

CBODY
	:	"</body>"
	;

OTITLE
	: "<title>"
	;

CTITLE
	: "</title>"
	;
	
OANCHOR: "<a" WS (ATTR)+ '>';
CANCHOR: "</a>";

IMG: "<img" WS (ATTR)+ '>';

BR: "<br" (WS ATTR)? '>';

OPARA: "<p" (WS ATTR)? '>';
CPARA: "</p>";

ODIV: "<div>" (WS ATTR)? '>';
CDIV: "</div>";

OITALIC: "<i>";
CITALIC: "</i>";

OBOLD: "<b>";
CBOLD: "</b>";

OUNDER: "<u>";
CUNDER: "</u>";

OTABLE	
	:	"<table" (WS (ATTR)*)? '>'
	;

CTABLE
	: 	"</table>"
	;

O_TR
	:	"<tr" (WS (ATTR)*)? '>'
	;

C_TR:	"</tr>"
	;

O_TH_OR_TD
	:	("<th" | "<td") (WS (ATTR)*)? '>'
	;

C_TH_OR_TD
	:	"</th>" | "</td>"
	;
	
/* headings */

OH1	:	"<h1" (WS ATTR)? '>' 
	;

CH1	:	"</h1>" 
	;

OH2	:	"<h2" (WS ATTR)?'>' 
	;

CH2	:	"</h2>" 
	;

OH3	:	"<h3" (WS ATTR)? '>' 
	;

CH3	:	"</h3>" 
	;

OH4	:	"<h4" (WS ATTR)? '>' 
	;

CH4	:	"</h4>" 
	;

OH5	:	"<h5" (WS ATTR)? '>' 
	;

CH5	:	"</h5>" 
	;

OH6	:	"<h6" (WS ATTR)? '>' 
	;

CH6	:	"</h6>" 
	;
	
PCDATA
	:	(
			options {
				generateAmbigWarnings=false;
			}
		:	'\r' '\n'		{newline();}
		|	'\r'			{newline();}
		|	'\n'			{newline();}
		|	~('<'|'\n'|'\r'|'"'|'>')
		)+ 
	;

// multiple-line comments
protected
COMMENT_DATA
	:	(	options {
				generateAmbigWarnings=false;
			}
		:
			{LA(2)!='-' && LA(3)!='>'}? '-' // allow '-' if not "-->"
		|	'\r' '\n'		{newline();}
		|	'\r'			{newline();}
		|	'\n'			{newline();}
		|	~('-'|'\n'|'\r')
		)*
	;

protected
ATTR
options {
ignore=WS;
}
	:	WORD ('=' (WORD ('%')? | ('-')? INT | STRING | HEXNUM))?
	;

COMMENT
	:	"<!--" COMMENT_DATA "-->"	{ $setType(Token.SKIP); }
	;

protected
WS	:	(
			options {
				generateAmbigWarnings=false;
			}
		:	' '
		|	'\t'
		|	'\n'	{ newline(); }
		|	"\r\n"	{ newline(); }
		|	'\r'	{ newline(); }
		)+
	;

//don't need uppercase for case-insen.
//the '.' is for words like "image.gif"
protected
WORD:	(	LCLETTER
   | '.' | '/'
  // was |	'.'
		)

		(
			/*	In reality, a WORD must be followed by whitespace, '=', or
				what can follow an ATTR such as '>'.  In writing this grammar,
				however, we just list all the possibilities as optional
				elements.  This is loose, allowing the case where nothing is
				matched after a WORD and then the (ATTR)* loop means the
				grammar would allow "widthheight" as WORD WORD or WORD, hence,
				an ambiguity.  Naturally, ANTLR will consume the input as soon
				as possible, combing "widthheight" into one WORD.

				I am shutting off the ambiguity here because ANTLR does the
				right thing.  The exit path is ambiguous with ever
				alternative.  The only solution would be to write an unnatural
				grammar (lots of extra productions) that laid out the
				possibilities explicitly, preventing the bogus WORD followed
				immediately by WORD without whitespace etc...
			 */
			options {
				generateAmbigWarnings=false;
			}
		:	LCLETTER
		|	DIGIT
		|	'.'
		)+
	;

protected
STRING
	:	'"' (~'"')* '"'
	|	'\'' (~'\'')* '\''
	;

protected
WSCHARS
	:	' ' | '\t' | '\n' | '\r'
	;

protected 
SPECIAL
	:	'<' | '~'
	;
	
protected
HEXNUM
	:	'#' HEXINT
	;

protected
INT	:	(DIGIT)+
	;

protected
HEXINT
	:	(
			/*	Technically, HEXINT cannot be followed by a..f, but due to our
				loose grammar, the whitespace that normally would follow this
				rule is optional.  ANTLR reports that #4FACE could parse as
				HEXINT "#4" followed by WORD "FACE", which is clearly bogus.
				ANTLR does the right thing by consuming a much input as
				possible here.  I shut the warning off.
			 */
			 options {
				generateAmbigWarnings=false;
			}
		:	HEXDIGIT
		)+
	;

protected
DIGIT
	:	'0'..'9'
	;

protected
HEXDIGIT
	:	'0'..'9'
	|	'a'..'f'
	;

protected
LCLETTER
	:	'a'..'z'
	;	

protected
UNDEFINED_TOKEN
	:	'<' (~'>')* '>'
		(
			(	/* the usual newline hassle: \r\n can be matched in alt 1
				 * or by matching alt 2 followed by alt 3 in another iteration.
				 */
				 options {
					generateAmbigWarnings=false;
				}
			:	"\r\n" | '\r' | '\n'
			)
			{ newline();}
		)*
		{System.err.println("invalid tag: "+$getText);}
	|	( "\r\n" | '\r' | '\n' ) {newline();}
	|	.
	;

/*
	:	('<'  { System.err.print("Warning: non-standard tag <" + LA(1)); } )
		(~'>' { System.err.print(LA(1)); } )* 
		('>'  { System.err.println(" skipped."); } ) 
		{ _ttype = Token.SKIP; }
	;
*/