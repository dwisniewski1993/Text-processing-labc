%%

for|if|while|do|goto|else|char|short|int|long|float|double|unsigned|auto	printf("Słowo kluczowe %s\n", yytext);

"{"|"}"	printf("Nawias klamrowy: %s\n", yytext);

"("|")"	printf("Nawias okrągły: %s\n", yytext);

"["|"]"	printf("Nawias kwadratowy: %s\n", yytext);

-?[0-9]+[.][0-9]+	printf("Liczba zmiennoprzecinkowa: %s\n", yytext);

-?[0-9]+	printf("Liczba całkowita: %s\n", yytext);

"'"."'"	printf("Znak: %c\n", yytext[1]);

"+"|"-"|"/"|"*"|"^"|"!"|"~"|"&"|"&&"|"|"|"||"|"<"|"<="|"<<"|">"|">="|">>"|"=="	printf("Operator: %s\n", yytext);

";"	printf("Średnik: %s\n", yytext);

.	printf("Nieznany znak: %s\n", yytext);
