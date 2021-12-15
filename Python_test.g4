grammar Python_test;

handleArithmetic: DIGIT+ (PLUS | MINUS | DIVIDE | MULTIPLY | MOD | EXPONENT) DIGIT+;

handleVaribaleDeclaration: (NAME'_'?NAME) | (NAME'_'?NAME '=' DIGIT+ | QUOTE NAME QUOTE);

handleFunctionCall: NAME OPEN_PAREN * CLOSE_PAREN;

fileInput: (NEWLINE | statement)* EOF;

SKIP_
 : ( SPACES | COMMENT ) -> skip
 ;

PLUS: '+' ;
MINUS: '-';
DIVIDE: '/';
MULTIPLY: '*';
MOD: '%';
EXPONENT: '^';

DIGIT: [0-9];

COMMENT: '#' ~[\r\n\f]*;
SPACES: ' ';

NAME: [A-Za-z_][A-Za-z_0-9][!]*;

//punctuation
OPEN_PAREN: '(';
CLOSE_PAREN: ')';
COLON: ':';
COMMA: ',';
INDENT: [ \t]+;
NEWLINE: [ \n\r]+;
QUOTE: '"';
SINGLE_QUOTE: '\'';

//edit assignments
TIMESEQUAL: '*=';
DIVIDEEQUAL: '/=';
PLUSEQUAL: '+=';
MINUSEQUAL: '-=';
MODEQUAL: '%=';
EXPEQUAL: '^=';

//compare operators
EQUALTO: '==';
LESSTHAN: '<';
LESSTHANEQUAL: '<=';
NOTEQUAL: '!=';
GREATERTHAN: '>';
GREATERTHANEQUAL: '>=';

WHILE: 'while';
IF: 'if';
ELSE: 'else';
ELIF: 'elif';
FOR: 'for';
IN: 'in';
AND: 'and';
