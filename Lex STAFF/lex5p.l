%{
	int count_a = 0;
	int count_b = 0;
	int count_c = 0;
%}
%%
^a*b*c*$		{
				for ( int i = 0 ; i < strlen (yytext); i++){
					if(yytext[i] == 'a'){
						count_a++;
					}
					if(yytext[i] == 'b'){
						count_b++;
					}
					if(yytext[i] == 'c'){
						count_c++;
					}
									
				}
				if(count_a == count_b && count_a == count_c){
					printf("%s OK",yytext);
					count_a = 0;
					count_b = 0;
					count_c = 0;					
				}
				else{
					printf("%s Error",yytext);
					count_a = 0;
					count_b = 0;
					count_c = 0;	
				}
				
			}
[^a+b+c+\n]+$		{
				printf("%s Error",yytext);
			}
.+			{
				printf("%s Error",yytext);
			}

