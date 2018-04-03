%{
#include<stdio.h>
void yyerror(char*);
int yylex(void);
extern char* prev;
extern char* i1;
extern char* i2;
extern FILE* yyin;
extern FILE* yyout;
%}
%token IF ELSE STMT CND WH FOR INI INC CB
%union{
	char* str;
};
%start s
%type<str> CB
%type<str> INC
%type<str> INI
%type<str> IF
%type<str> ELSE
%type<str> STMT
%type<str> CND
%type<str> WH
%type<str> FOR
%%

s:
	condStmt '$' { /*printf("return 1\n");*/{fprintf(yyout,"\n THIS IS WHILE LOOP");}return 1;}
	;
condStmt:
	
	 FOR '(' INI ';' CND ';' INC ')' '{' stmt CB { }
	;
stmt:
	STMT //{printf("stmt\n");}
	|condStmt
	;
%% 
void yyerror(char* s){
	printf("%s",s);
}
int main(){
	yyin = fopen("fw.txt","r");
	yyout = fopen("fwout.txt","w");
	yyparse();
	fclose(yyin);
	return 0;
}
