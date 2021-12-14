grammar Python_test;

handleArithmetic: DIGIT+ (PLUS | MINUS | DIVIDE | MULTIPLY | MOD | EXPONENT) DIGIT+;

PLUS: '+' ;
MINUS: '-';
DIVIDE: '/';
MULTIPLY: '*';
MOD: '%';
EXPONENT: '^';
DIGIT: ~[0-9];