%{
#include<stdio.h>
#include<ctype.h>
#include<stdlib.h>
#include "y.tab.h"
%}
%token id num
%%
s:k {printf("%d",$1);}
;
k:k'<'l {$$ = $1 < $3; printf("lesse than recgonised\n%d",$$);}
|k'>'l {$$ = $1 > $3; printf("greater than recognised\n%d",$$);}
|k'<''='l {$$ = $1 <= $4; printf("lesser than equal recognised\n%d",$$);}
|k'>''='l {$$ = $1 >= $4; printf("Greater than equal recognised\n%d",$$);}
|k'!''='l {$$ = $1 != $4; printf("Not equal \n%d",$$);}
|l
;
l:e 
;
e: e'+'t { $$ = $1+$3;printf("plus recog\n");}
|e'-'t { $$ = $1 - $3;printf("minus recog\n");}
|t {$$=$1;}
;
t:t'*'f {$$=$1*$3; printf("mult recog\n");}
|t'/'f {if($3!=0) {$$=$1/$3;printf("div recog\n");} else {printf("div by zero invalid\n");exit(0);}}
|f{$$=$1;}
;
f:'('e')' {$$=$2; printf(" () recog\n");}
|'+''+'id {$$=$3+1;printf("inc op\n");}
|'-''-'id {$$=$3-1; printf("dec recog\n");}
|id
|num
;
%%
int main(){
	printf("Enter a valid expression\n");
	yyparse();
	printf("Valid\n");
}
int yyerror(){
	printf("Invalid\n");
	}
