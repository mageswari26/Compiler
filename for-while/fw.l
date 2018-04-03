%{
	#include<stdio.h>
	#include<stdlib.h>
	#include"y.tab.h"
	char *prev = "";
	char *i1="";
	char *i2="";
%}
IDENTIFIER [a-zA-Z][a-zA-Z0-9_]* 
CONSTANT [0-9]+
%%
"ini"   {
			//fprintf(yyout,"%s",yytext);
			i1 = strdup(yytext);
			return INI;
		}
"c"		{
			fprintf(yyout,"%s",yytext);
			//prev = strdup(yytext);
			return CND;
		}
"}"     {
            fprintf(yyout,"%s","\n");
            fprintf(yyout,"%s",i2);
			fprintf(yyout,"%s",yytext);
			//prev = strdup(yytext);
			return CB;
		}
"inc"   {
			//fprintf(yyout,"%s",yytext);
			i2 = strdup(yytext);
			return INC;
		}
"if"		{
			fprintf(yyout,"%s",yytext);
			prev = strdup(yytext);
			return IF;
		}

"for"		{
            prev = strdup(yytext);
			fprintf(yyout,"%s","while");
			return FOR;
		}

"while"     {
            fprintf(yyout,"%s",yytext);
			prev = strdup(yytext);
			return WH;
		}
		
"else"	{
			fprintf(yyout,"%s",yytext);
			prev = strdup(yytext);
			return ELSE;
		}
s[0-9]		{
			fprintf(yyout,"%s",yytext);
			prev = strdup(yytext);			
			return STMT;
		}
";" 		{
			//ECHO;			
			return *yytext;
		}

[(){]	{
			fprintf(yyout,"%s",yytext);
			prev = strdup(yytext);
			return *yytext;
		}
[ \n\t]     ;
[$]		{
			//fprintf(yyout,"%s",yytext);			
			return *yytext;
		}		
.		{ 
			printf("Invalid character!");
		}
%%
int yywrap(void){
	return 1;
}

