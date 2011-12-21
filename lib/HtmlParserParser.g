parser  grammar XMLParser;

options {language=Ruby;tokenVocab=HtmlParserLexer;}

document
	: 	OPENING_TAG HTML END_TAG
		(head)?
		(body)?
		CLOSING_TAG HTML END_TAG
	;

head: 	OPENING_TAG HEAD END_TAG
		(head_element)?
		CLOSING_TAG HEAD END_TAG
	;

head_element
	:	title	//bug need at least a title, rest optional
	;
	
title
	:	OPENING_TAG TITLE END_TAG
		PCDATA?
		CLOSING_TAG TITLE END_TAG
	;

body: OPENING_TAG name=BODY (WS ID)? END_TAG
	;

