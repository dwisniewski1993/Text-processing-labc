%{
	int i = 0 ;
%}
%%
\-[0-9]+	printf(yytext);
[0-9]+		{ 
		if (i == 4){
			printf("");
			i=0;
		}
		else{		
		  	i++;
		  	printf(yytext);	
		}
		}
\n     		i=0; 
