grammar Python_test;

fileInput: (NEWLINE | statement)* EOF;

statement: simple_state | compound_state;

simple_state: (arithmetic | SKIP_ | variableDeclaration | functionCall | breakState);
compound_state: (ifState | whileLoop | forLoop | elseState);

ifState
: (IF | ELIF) OPEN_PAREN? NAME (comp_ops | arith_ops)  (DIGIT+ | EQUALTO DIGIT+ | 'i ') (EQUALTO DIGIT+)? CLOSE_PAREN? COLON;
whileLoop
: WHILE SPACES? NAME comp_ops DIGIT+ 
  (AND NAME comp_ops DIGIT)? COLON
;
elseState: ELSE COLON;

breakState: BREAK;

forLoop: ( 'for num in range(begin, end)' | 'for i in range(2, int(num/2)+2)' ) COLON;

arithmetic: (DIGIT+ ' '? (arith_ops) ' '? (DIGIT+)?)+;

variableDeclaration
: (NAME EQUAL ' '(DIGIT+ | STRING | arithmetic)SPACES?)
| (NAME MINUSEQUAL (NAME)SPACES?);

functionCall: NAME OPEN_PAREN (NAME | STRING | PLUS | strMethod)+ CLOSE_PAREN SPACES?;

strMethod: 'str'OPEN_PAREN NAME CLOSE_PAREN;

SKIP_
 : (COMMENT) -> skip
 ;

arith_ops: (PLUS | MINUS | DIVIDE | MULTIPLY | MOD | EXPONENT);

PLUS: '+';
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
IF: 'if ' | 'if';
ELSE: 'else';
ELIF: 'elif ';
FOR: 'for ';
IN: ' in ';
AND: ' and ';
BREAK: 'break'[ \r\n]*;
RANGE: 'range';


DIGIT: MINUS?[0-9];

COMMENT: SPACES?'#' ~[\r\n\f]*SPACES?;
SPACES
: [ \r\n\t]+ -> channel (HIDDEN)
;

STRING: QUOTE ( [a-zA-Z0-9 .!?":'(-]+ | SPACES | '! ' | '!! ' | '!"' )+ QUOTE;
NAME: [A-Za-z_][A-Za-z_0-9]* SPACES?;

fragment ESCAPE : '\\' ( '\'' | '\\' );