grammar Python_test;

fileInput: (NEWLINE | statement)* EOF;

statement: simple_state | compound_state;

simple_state: (arithmetic | SKIP_ | variableDeclaration | functionCall);
compound_state: (ifState | whileLoop | forLoop);

ifState: IF NAME comp_ops DIGIT+ COLON;
whileLoop
: WHILE SPACES? NAME comp_ops DIGIT+ 
  (AND NAME comp_ops DIGIT)? COLON
;
// forLoop: FOR NAME IN RANGE OPEN_PAREN ( (NAME COMMA ' ' NAME) | ('2, int(num/2)+2'))  CLOSE_PAREN;

forLoop: ( 'for num in range(begin, end)' | '2, int(num/2)+2' ) COLON;

arithmetic: DIGIT+ (PLUS | MINUS | DIVIDE | MULTIPLY | MOD | EXPONENT) DIGIT+;

variableDeclaration
: (NAME EQUAL ' '(DIGIT+ | STRING)SPACES?)
| (NAME MINUSEQUAL (NAME)SPACES?);

functionCall: NAME OPEN_PAREN (NAME | STRING | functionCall | PLUS) CLOSE_PAREN;

SKIP_
 : (COMMENT) -> skip
 ;

PLUS: '+' ;
MINUS: '-';
DIVIDE: '/';
MULTIPLY: '*';
MOD: '%';
EXPONENT: '^';

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
MINUSEQUAL: '-= ';
MODEQUAL: '%=';
EXPEQUAL: '^=';
EQUAL: '=';

//compare operators
comp_ops: (EQUALTO | LESSTHAN | LESSTHANEQUAL | NOTEQUAL | GREATERTHAN | GREATERTHANEQUAL);
EQUALTO: '== ';
LESSTHAN: '< ';
LESSTHANEQUAL: '<= ';
NOTEQUAL: '!= ';
GREATERTHAN: '> ';
GREATERTHANEQUAL: '>= ';

WHILE: 'while ';
IF: 'if ';
ELSE: 'else ';
ELIF: 'elif ';
FOR: 'for ';
IN: ' in ';
AND: ' and ';
BREAK: 'break';
RANGE: 'range';


DIGIT: [0-9];

COMMENT: SPACES?'#' ~[\r\n\f]*SPACES?;
SPACES
: [ \r\n\t]+ -> channel (HIDDEN)
;

STRING: QUOTE ( [a-zA-Z0-9 .!?"-]+ | SPACES | '! ' | '!! ' | '!"' )+ QUOTE;
NAME: [A-Za-z_][A-Za-z_0-9]+ SPACES?;

fragment ESCAPE : '\\' ( '\'' | '\\' );