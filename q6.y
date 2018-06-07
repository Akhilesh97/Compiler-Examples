%{
#include<stdio.h>
#include<stdlib.h>
#include "y.tab.h"
%}
%token id num
%%
s:e {printf("%d",$1);}
;
e:e'+'t {$$ = $1 + $3; printf("Plus %d\n",$$);}
|e'-'t {$$ = $1 - $3; printf("Minus %d\n",$$);}
|t {$$ = $1;}
;
t:t'*'f {$$ = $1 * $3; printf("Mul %d\n", $$);}
|t'/'f {$$ = $1 / $3; printf("Div %d\n",$$);}
|f {$$ = $1;}
;
f:'('e')' {$$ = $2; printf("() recognised\n");}
|'+''+'id {$$ = $3+1; printf("Inc %d",$$);}
|'-''-'id {$$ = $3-1; printf("Dec %d",$$);}
|id 
|num 
;
%%
int main(){
	printf("Enter a valid expression\n");
	yyparse();
}
int yyerror(){
	printf("invalid\n");
	exit(0);
}

