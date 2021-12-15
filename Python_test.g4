grammar Python_test;

handleArithmetic: DIGIT+ (PLUS | MINUS | DIVIDE | MULTIPLY | MOD | EXPONENT) DIGIT+;

handleVaribaleDeclaration: (NAME';') | (NAME '=' DIGIT+);

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

COMMENT: '#'+;
SPACES: [ \t]+;

NAME: [a-z A-Z]+;

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
