%{

#include <math.h>
%}

DIGIT    [0-9]
ID       [a-z][a-z0-9]*

%%

{DIGIT}+    		{
          printf( "Liczba całkowita: %s (%d)\n", yytext,
        atoi( yytext ) );
      }

{DIGIT}+"."{DIGIT}*	{
          printf( "Liczba zmiennoprzecinkowa: %s (%g)\n", yytext,
        atof( yytext ) );
      }

void   {
  printf("SK_VOID\n");
}

if|for|while|else|function        {
          printf( "Słowo kluczowe: %s\n", yytext );
      }

{ID}			    printf( "Identyfikator: %s\n", yytext );

"+"|"-"|"*"|"/"		    printf( "Operator: %s\n", yytext );

"{"[^}\n]*"}"		    /* zjedz jednolinijkowe komentarze */

[ \t\n]+		    /* zjedz białe spacje */

.			    printf( "Nierozpoznany znak: %s\n", yytext );

%%
