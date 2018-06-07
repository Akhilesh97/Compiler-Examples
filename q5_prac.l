%{
#include<stdio.h>
int c = 0;
int bc = 0;
int fc = 0;
int fc1 = 0;
%}
%s IF ELSE OPENP CLOSEP OPENF OPENEF
%%
\n {c++;}
"if" {ECHO; BEGIN IF; printf("\n");}
<IF>"(" {ECHO; bc++; BEGIN OPENP;}
<IF>")" {ECHO; bc--; BEGIN CLOSEP;}
<IF>. ;

<OPENP>"(" {ECHO;bc++;}
<OPENP>")" {ECHO; bc--; BEGIN CLOSEP;}
<OPENP>. ;

<CLOSEP>"{" {if(bc==0) printf("Parenthesis matched\n");else printf("Mismatch\n");fc++; ECHO; BEGIN OPENF;}
<CLOSEP>"(" {bc++; ECHO; BEGIN OPENP;}
<CLOSEP>")" {bc--;ECHO;}
<CLOSEP>. ;

<OPENF>"{" {fc++;ECHO;}
<OPENF>"}" {fc--;if(fc==0) printf("Matched curly\n"); BEGIN ELSE;}
<OPENF>. ;

<ELSE>"else" {ECHO;BEGIN OPENEF;}
<ELSE>"else if" {ECHO;BEGIN IF;bc = 0;fc = 0;}
<ELSE>. ;
<OPENEF>"{" {fc1++;ECHO;}
<OPENEF>"}" {fc1--;if(fc1==0) printf(("Brackets matched\n"));BEGIN 0;}
<OPENEF>. ;
. ;
%%
int main(){
	yyin = fopen("q5.c","r");
	yylex();
	if(fc1!=0)
		printf("MismatchedElse\n");
	fclose(yyin);
}
