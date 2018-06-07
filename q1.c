#include<stdio.h>
#include<string.h>
int main(){
	int lineno = 0;
	int i;
	FILE *fp;
	char line[100];
	int str = 0, strerr = 0, chr = 0, chrerr = 0;
	int openstr = 0, closestr = 0, openchr = 0, closechr = 0;
	fp = fopen("q1.txt","r");
	if(fp == NULL)
		printf("Error\n");
	while(fgets(line, sizeof(line), fp)!= NULL){
		lineno++;
		str = 0; strerr = 0; chr = 0; chrerr = 0;
	        openstr = 0; closestr = 0; openchr = 0; closechr = 0;
		for(i = 0;i < strlen(line); i++){
			if(line[i] == '"'){
				str = 1;
				if(openstr == 1 && closestr == 0) closestr = 1;
				else if(openstr == 0 && closestr == 0) openstr = 1;
				else if(openstr == 1 && closestr == 1) closestr = 0;
			}
			else if(line[i] == '\''){
                                chr = 1;
                                if(openchr == 1 && closechr == 0) closechr = 1;
                                else if(openchr == 0 && closechr == 0) openchr = 1;
                        	else if(openchr == 1 && closechr == 1) closechr = 0;
			}  	
		}
		if(openstr == 1 && closestr == 0){
			strerr = 1;
			printf("string not closed at line %d\n",lineno);
		}
		else if(str == 1 && strerr == 0){
			printf("Valid String at %d\n",lineno);
		}
		if(openchr == 1 && closechr == 0){
			chrerr = 1;
			printf("Char not closed at line %d\n",lineno);
		}
		else if(chr == 1 && chrerr == 0){
			printf("Valid string at %d\n",lineno);
		}
	}
}
	

