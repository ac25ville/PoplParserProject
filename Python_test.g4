grammar Python_test;

handleArithmetic: DIGIT+ (PLUS | MINUS | DIVIDE | MULTIPLY | MOD | EXPONENT) DIGIT+;

PLUS: '+' ;
MINUS: '-';
DIVIDE: '/';
MULTIPLY: '*';
MOD: '%';
EXPONENT: '^';
DIGIT: ~[0-9];

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