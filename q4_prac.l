%{
#include<stdio.h>
int c = 0;
int end = 0;
int start = 0;
%}
%s STRUCT1 DECLARE
id [a-zA-Z][a-zA-Z0-9]*
%%
\n {c++;}
"struct{" {ECHO;BEGIN STRUCT1; start = c + 1; end++;printf("\n");}
<STRUCT1>("int "|"float ") {ECHO;BEGIN DECLARE; }
<STRUCT1>"}"{id}";" {ECHO;end--;if(end == 0) printf("structure opened at line %d and closed at line %d",start,end);printf("%d",end);BEGIN 0;}
<STRUCT1>. ;
<DECLARE>{id} {ECHO; }
<DECLARE>","{id} {ECHO;}
<DECLARE>";" {ECHO;BEGIN STRUCT1;}
. ;
%%
int main(){
	yyin = fopen("q4.c","r");
	yylex();
	if(end!=0) printf("invalid\n");
	fclose(yyin);
}
