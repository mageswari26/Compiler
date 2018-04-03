%{
#include<stdio.h>
#include<string.h>
int fl=0,i=0,type[100],j=0,error_flag=0;
char symbol[100][100],temp[100];
%}
%start START
%token INT FLOAT C DOUBLE CHAR ID NL SE O TERM

%%
START:
     S1 NL {return 0;}
     ;
S1:
     S NL S1
     |S NL
     ;
S
     :INT L1 E
     |FLOAT L2 E
     |DOUBLE L3 E
     |CHAR L4 E
     |INT L1 E S
     |FLOAT L2 E S
     |DOUBLE L3 E S
     |CHAR L4 E S
     |O
     ;
L1:
     L1 C ID {strcpy(temp,(char *)$3);insert(0);}
     |ID {strcpy(temp,(char *)$1);insert(0);}
     ;
L2:
     L2 C ID {strcpy(temp,(char *)$3);insert(1);}
     |ID {strcpy(temp,(char *)$1);insert(1);}
     ;
L3
     :L3 C ID {strcpy(temp,(char *)$3);insert(2);}
     |ID {strcpy(temp,(char *)$1);insert(2);}
     ;
L4
     :L4 C ID {strcpy(temp,(char *)$3);insert(3);}
     |ID {strcpy(temp,(char *)$1);insert(3);}
     ;
E
     :SE
     ;
%%
void yyerror()
{ 
   printf("SYNTAX ERROR\n");
   error_flag=1;
}
int yywrap()
{
  return 1;
}
int main(void)
{
	yyparse();
	if(error_flag==0)
	{
		if(type[j]==0)
			printf(" integer- ");
		if(type[j]==1)
			printf(" float - ");
		if(type[j]==2)
			printf(" double - ");
		if(type[j]==3)
			printf(" char - ");
		printf(" %s\n",symbol[j]);
	}
}
void insert(int type1)
{
	fl=0;
	if(strcmp(temp,symbol[j])==0)
	{
		if(type[i]==type1)
			printf("!!redeclaration!!- %s\n",temp);
		else
		{
			printf("!!multiple declarations!!:%s\n",temp);
			error_flag=1;
		}
		fl=1;
	}
	if(fl==0)
	{
		strcpy(symbol[i],temp);
		type[i]=type1;
		i++;
	}
}
