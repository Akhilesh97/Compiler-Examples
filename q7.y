%{
#include<stdio.h>
#include<stdlib.h>
%}
%token type id num
%%
D:T' 'L';'D {printf("D->TL;D|epsilon\n");}
|
;
T:type {printf("T-->type\n");}
;
L:L','C {printf("L->L,c\n");}
|C	{printf("L->C\n");}
;
C:C'['M']' {printf("C->C[M]\n");}
|id	{printf("C->id\n");}
;
M:num {printf("M->num\n");}
;
%%
int main(){
	printf("Enter an expression\n");
	yyparse();
	printf("Valid derivation\n");
}
int yyerror(){
	printf("Invalid\n");
}
