%{
	enum yytokentype{
		ADD=259,
		SUB=269,
	};
%}
myadd	"+"
mysub	"-"
myother	.

%%
{myadd} {return ADD;}
{mysub} {return SUB;}
{myother} {printf("Mystery character\n");}
%%
int main(int argc,char **argv)
{
	int tok;
	while(tok = yylex()){
		if(tok==ADD || tok == SUB){
			printf("meet +or -\n");
		}else{
			printf("this else");
		}
	}
	return 0;
}
