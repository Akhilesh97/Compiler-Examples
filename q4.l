%{
#include<stdio.h>
int c = 0;
int start = 0;
int end = 0;
%}
%s STRUCT1 DECLARE
id [a-zA-Z][a-zA-Z0-9]*
%%
\n {c++;}
"struct{" {BEGIN STRUCT1; ECHO; start = c + 1; end++;}
<STRUCT1>("int |float ") {BEGIN DECLARE; ECHO; }
<STRUCT1>"}"{id}";" {ECHO; end--; if(end == 0) printf("Valid Structure\n");BEGIN 0;}
<STRUCT1>. ;

<DECLARE>{id} {ECHO;}
<DECLARE>","{id} {ECHO;}
<DECLARE>";" {BEGIN STRUCT1; ECHO; printf("\n");}
. ;
%%
int main(){
yyin = fopen("q4.c","r");
yylex();
if(end!=0)
printf("Invalid structure started at %d",start);
fclose(yyin);
}

