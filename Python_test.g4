grammar Python_test;

fileInput: (NEWLINE | statement)* EOF;

statement: simple_state | compound_state;

simple_state: (arithmetic | SKIP_ | variableDeclaration | functionCall);
compound_state: (ifState | whileLoop | forLoop);

ifState: IF;
whileLoop
: WHILE SPACES NAME SPACES? comp_ops DIGIT+ 
  (AND SPACES NAME SPACES? comp_ops DIGIT)? COLON
;
forLoop: FOR ;

arithmetic: DIGIT+ (PLUS | MINUS | DIVIDE | MULTIPLY | MOD | EXPONENT) DIGIT+;

variableDeclaration
: (NAME SPACES EQUAL SPACES (DIGIT | STRING)+SPACES)
| (NAME SPACES MINUSEQUAL SPACES (NAME)SPACES);

functionCall: FUNCTION_NAME OPEN_PAREN (NAME ('_HP' | '!"')?| STRING) CLOSE_PAREN?CLOSE_PAREN;

SKIP_
 : (COMMENT) -> skip
 ;

PLUS: '+' ;
MINUS: '-';
DIVIDE: '/';
MULTIPLY: '*';
MOD: '%';
EXPONENT: '^';

DIGIT: [0-9];

COMMENT: '#' ~[\r\n\f]*;
SPACES
: [ \r\n\t]+ -> channel (HIDDEN)
;

NAME: [A-Za-z_][A-Za-z_0-9]+ (SPACES);
FUNCTION_NAME: [a-z]+;
STRING:   QUOTE ( ESCAPE | ~('\'' | '\\' | '\n' | '\r') | [a-zA-Z_] | SPACES ) + QUOTE;

fragment ESCAPE : '\\' ( '\'' | '\\' );

//punctuation
OPEN_PAREN: '(';
CLOSE_PAREN: ')';
COLON: ':';
COMMA: ',';
INDENT: [ \t]+;
NEWLINE: [\n\r]+;
QUOTE: '"';
SINGLE_QUOTE: '\'';

//edit assignments
TIMESEQUAL: '*=';
DIVIDEEQUAL: '/=';
PLUSEQUAL: '+=';
MINUSEQUAL: '-=';
MODEQUAL: '%=';
EXPEQUAL: '^=';
EQUAL: '=';

//compare operators
comp_ops: (EQUALTO | LESSTHAN | LESSTHANEQUAL | NOTEQUAL | GREATERTHAN | GREATERTHANEQUAL);
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
BREAK: 'break';
