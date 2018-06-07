%{
#include<stdio.h>
int c = 0;
%}
id [a-zA-Z][a-zA-Z0-9]*
num [0-9]+
op [-+*/]
expr ({id}|{num}){op}({id}|{num})
%%
{id}"="({expr}+";") {printf("Valid expression at line %d",c+1);ECHO;printf("\n");}
{id}"="({id}|{num}";") {printf("Valid expression at line %d",c+1);ECHO;printf("\n");}
{num}({num}{id})"="({expr}+";") {printf("L Value is not correct %d",c+1);printf("\n");}
{id}"=;" {printf("R value required at %d",c+1);printf("\n");}
{op}{op}+ {printf("Use of more that one operator %d",c+1);printf("\n");}
{id}"+""+" {printf("Valid inc at %d",c+1);ECHO;printf("\n");}
{id}"-""-" {printf("Valid dec at %d",c+1);ECHO;printf("\n");}
%%
int main(){
	yyin = fopen("q3.c","r");
	yylex();
	fclose(yyin);
}

