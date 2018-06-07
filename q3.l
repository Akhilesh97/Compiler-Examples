%{
#include<stdio.h>
int c = 0;
%}
op [-+*/]
num [0-9]+
id [a-zA-z][a-zA-Z0-9]*
exp ({id}|{num}){op}({id}|{num})
%%
\n {c++;}
^"#".+ ;
^"int main()".+ ;
^("int "|"float "|"char ").+ ;
{id}"="({exp}+";") { printf("Valid declaration at line %d",c++);ECHO;printf("\n");}
{id}"="({num}|{id}";") {printf("Valid declaration at line %d",c++);ECHO;printf("\n");}
({num}|({num}{id}))"="({exp}+";") {printf("Invalid L-value at %d",c++);ECHO;printf("\n");}
{op}{op}+ {printf(" Invalid expression in line no:%d;More than one operator can't be used in expression consequetively",c+1);ECHO;printf("\n");}
{id}"=;" {printf("Invalid. R-Value required at %d",c+1);ECHO;printf("\n");}
{id}"+""+" {printf("Increment op at %d",c+1);ECHO;printf("\n");}
{id}"+" {printf("Invalid inc at %d",c+1);ECHO;printf("\n");}
{id}"-""-" {printf("Decrement op at %d",c+1);ECHO;printf("\n");}
{id}"-" {printf("Invalid dec at %d",c+1);ECHO;printf("\n");}
{id}("<"|">"|"<="|">="|"!=")({id}|{num})";" {ECHO;printf("valid relational in line no %d \n",c+1);}
.|\n ;
%%
int main(){
yyin = fopen("q3.c","r");
yylex();
fclose(yyin);
}
