%{
#include<stdio.h>
int c = 0;
int bc = 0;
int fc = 0;
%}
%s IF ELSE OPENP CLOSEP OPENF OPENEF 
%%
\n {c++;}
"if" {ECHO; BEGIN IF;}

<IF>"(" {ECHO;BEGIN OPENP; bc++;}
<IF>")" {ECHO; BEGIN CLOSEP; bc--;}
<IF>. {ECHO;}

<OPENP>"(" {bc++;ECHO;}
<OPENP>")" {bc--;ECHO;BEGIN CLOSEP;}
<OPENP>. {ECHO;}

<CLOSEP>"{" {if(bc==0)printf("condition valid in line no. %d",c+1);else printf("Parenthesi mismatch in line %d",c+1);fc++; ECHO; BEGIN OPENF;}
<CLOSEP>"(" {bc++; ECHO; BEGIN OPENP;}
<CLOSEP>")" {bc--; ECHO;}

<CLOSEP>. {ECHO;}

<OPENF>"{" {ECHO;fc++;}
<OPENF>"}" {ECHO;fc--;if(fc == 0)printf("Brakcets matched\n"); BEGIN ELSE; }
<OPENF>. {ECHO;}

<ELSE>"else" {fc++; ECHO; BEGIN OPENEF;}
<ELSE>"else if" {ECHO; BEGIN IF; bc = 0; fc = 0;}

<OPENEF>"}" {fc--;if(fc == 0) printf("Brackets matched\n");else printf("parentheis mismatch\n"); ECHO; BEGIN 0;}
<OPENEF>"{" {fc++;if(fc!=0)printf("Else not terminated\n");ECHO;}
<OPENEF>. {ECHO;}

.|\n ;
%%
int main(){
yyin = fopen("q5.c","r");
yylex();
fclose(yyin);
}
