%{
int chars = 0;
int words = 0;
int lines = 0;
%}
mywords [a-zA-Z]+
mylines \n
mychars .
%%
{mywords}	{words++;chars+=strlen(yytext);}
{mylines}	{chars++;lines++;}
{mychars}	{chars++;}
%%
int main(int argc,char **argv)
{
	yylex();
	printf("%8d%8d%8d\n",lines,words,chars);
	return 0;
}
