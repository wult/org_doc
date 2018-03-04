%{

#include <stdio.h>

#include <stdlib.h>

#include <string.h>


#define YYDEBUG 1 //系统保留定义的token，值0-255



// 符号表

Variable *var_list = NULL;

Variable * search_identifier(char *identifier) {

    Variable *pos;

    for (pos = var_list; pos != NULL; pos = pos->next) {

        if (!strcmp(pos->name, identifier)) {

            break;

        }

    }

    if (pos == NULL) { // 没找到, 创建它

        pos = (Variable *)malloc(sizeof(Variable));

        pos->next = var_list;

        pos->name = (char *)malloc(strlen(identifier) + 1);

        strcpy(pos->name, identifier);

        var_list = pos;

    }

    return pos;

}



%}

%union {

    char        *name;

    double       double_value;

    Variable    *_var;

}

/*%token是声明一个标记，编译后产生#define ADD 259 (0-255是系统保留的token)*/

%token <double_value>      DOUBLE_LITERAL

%token ADD SUB MUL DIV LP RP SEMICOLON PRINT IDENTIFIER ASSIGN

%type <double_value> expression term primary_expression

%type <name>  IDENTIFIER

%type <_var> identifier

%%

line_list /*多行规则*/

    : statement /*单行规则*/

    | line_list statement

    ;

statement

    : expression SEMICOLON

    | assgin_statement

    | PRINT LP expression RP SEMICOLON

     {

        printf("%lf", $3);

        printf("\n");

     }

     ;

assgin_statement

    : identifier ASSIGN expression SEMICOLON

    {

        Variable *var = $1;

        var->value   = $3;

    }

expression /*表达式规则*/

    : term /*和项*/

    | expression ADD term /*表达式 + 和项*/

    {

        $$ = $1 + $3;

    }

    | expression SUB term

    {

        $$ = $1 - $3;

    }

    ;

term /*和项规则*/

    : primary_expression /*一元表达式*/

    | term MUL primary_expression

    {

        $$ = $1 * $3;

    }

    | term DIV primary_expression

    {

        $$ = $1 / $3;

    }

    ;

primary_expression /*一元表达式规则*/

    : DOUBLE_LITERAL /*实数的字面常量*/

    | identifier

    {

        Variable *var = $1;

        $$ = var->value;

    }

    | LP expression RP /*括号*/

    {

        $$ = $2;

    }

    ;



identifier

    : IDENTIFIER

    {

        Variable *var = search_identifier($1);

        yylval._var = var;

        $$ = var;

    }

    ;

%%

int yyerror(char const *str)

{

    extern char *yytext;

    fprintf(stderr, "parser error near %s\n", yytext);

    return 0;

}



int main(int argc, char **argv)

{

    extern int yyparse(void);

    extern FILE *yyin;

    FILE *fp;



    if (argc != 2) {

        fprintf(stderr, "usage:%s filename", argv[0]);

        exit(1);

    }



    fp = fopen(argv[1], "r");



    yyin = fp;

    if (yyparse()) {

        fprintf(stderr, "Error ! Error ! Error !\n");

    }

    fclose(fp);

    return 0;

}
