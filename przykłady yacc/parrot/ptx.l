
%{
   #include "ptx.tab.h"
%}

%%

liczba             return NUMBER;

drukuj             return PRINT;
dla                return FOR;
do                 return TO;
r�b                return DO;
zrobione           return DONE;

[a-z]   yylval=*yytext; return ID;

[0-9]+  yylval=atoi(yytext); return INTEGER_LITERAL;

"="   return '=';
"+"   return '+';
"*"   return '*';

[ \t\n] ;

