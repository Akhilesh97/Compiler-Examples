#include<stdio.h>
#include<string.h>
int main(){
	FILE *fp;
	char line[100];
	int comment = 0,open = 0,close = 0, oline = 0,cline = 0;
	int lineno = 0;
	fp = fopen("q2.txt","r");
	if(fp==NULL)
		printf("Error\n");
	while(fgets(line,sizeof(line),fp)){
		lineno++;
		if(open == 1 && close == 0)
			printf("%s\n",line);
		if(strstr(line,"//"))
			printf("line %d has single line comment\n",lineno);
		if(strstr(line,"/*") && open == 0){
			open = 1;
			close = 0;
			oline = lineno;
			printf("%s\n",line);
		}
		if(strstr(line,"*/")&& open ==1 && close == 0){
			close = 1;
			open = 0;
			cline = lineno;
			printf("COmmett opens at %d and closed at %d",oline,cline);
		}
	}
		if(open == 1 && close == 0){
			printf("Comment has been opeended at %d but not closed\n",oline);
		}
	
}
