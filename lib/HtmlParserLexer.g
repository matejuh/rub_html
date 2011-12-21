lexer grammar HtmlParserLexer;

HTML: OHTML PCDATA CHTML;

PCDATA :(~'<')+ ; 

OHTML: '<html>';

CHTML: '</html>';

