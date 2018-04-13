%{
#include <stdlib.h>
#include <stdio.h>
#include <assert.h>
#include <iostream>

#define YY_DECL extern "C" int yylex()
#define MAX_DEPTH 72

int nesting = 0 ;
unsigned int indent_stack[MAX_DEPTH] ;
unsigned int level = 0 ;

unsigned int first = 1 ;

using namespace std;

void process_indent(char* line) ;
void skip_dots(char* line, int length);

%}

PUNCT [-+*/=<>:]*
ID  [A-Za-z_][A-Za-z0-9_]*
INT [0-9]+

%option noyywrap

%%

^[ ]*\n       {/* Blank lines out */}
^[ ]*[^ \n]+  {int last = yyleng - 1;
               process_indent(yytext) ;
               while ((last >= 0) &&
                      (yytext[last] != ' ')) {
                unput(yytext[last]);
                last-- ;}}

"("  {cout << ""; ECHO; nesting++ ; }
")"  {cout << ""; ECHO; nesting-- ; }

"ruby" {cout << "python ";}
"puts" {cout << "print ";}
"end" {}
".new" { cout << "()";}
"elsif" {cout << "elif ";}
[0-9]*\.\.([0-9]*)$ {cout << "range(";
				skip_dots(yytext, yyleng); 
				cout << ")";}
{ID}|{INT}|{PUNCT} { ECHO; cout << " ";}

[ \r] {}
\n    {}


<<EOF>>  { process_indent("") ; return 0 ; }

%%

unsigned int white_count(char* line) {
  unsigned int count = 0 ;
  while (*line == ' ')
    count++, line++ ;
  return count ;
}

void make_tabs(int lvl){
	cout << endl;
	for(int i = 0; i < lvl; i++)
	{
		cout << " ";
	}
}

void skip_dots(char* line, int length){
	int id = 0;
	for (int j = 0; j < length; j++){
		if(line[j]=='.'){
			id = j;
		}
	}
	for(int i = 0; i < length; i++){
		if(i == id-1){
			cout << ',';
		}
		else{
			if (i == (id)){
				cout << ' ';
			}
			else{
				cout << line[i];
			}
		}
	}
}

void process_indent(char* line) {

  if (nesting)
    /* Ignore indents */
    return ;

  unsigned int indent = white_count(line) ;
  
  if (indent == indent_stack[level]) {
	if(!first) cout << "";
    first = 0 ;
	make_tabs(level);
    return ;
  }

  if (indent > indent_stack[level]) {
	cout << ":";
    assert(level+1 < MAX_DEPTH) ;
    indent_stack[++level] = indent ;
	make_tabs(level);
    return ;
  }

  while (indent < indent_stack[level]) {
    --level ;
	make_tabs(level);
    cout << "" ;
  }

  assert(level >= 0) ;
}

int main(int argc, char* argv[]) {
  FILE *myfile = fopen("kod.rb", "r");
  if (!myfile){
  	cout << "Nie mozna otworzyc kod.rb" << endl;
  	return -1;
  }
  yyin = myfile;
  yylex();
  cout << "\n" ;
}
