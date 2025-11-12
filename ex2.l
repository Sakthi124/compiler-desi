%{
#include <stdio.h>
%}

%%
"int"|"float"|"char"|"if"|"else"|"while"|"for"|"return"   { printf("Keyword: %s\n", yytext); }
[0-9]+                                                     { printf("Number: %s\n", yytext); }
[a-zA-Z_][a-zA-Z0-9_]*                                     { printf("Identifier: %s\n", yytext); }
[=+\-*/<>]                                                 { printf("Operator: %s\n", yytext); }
[\n\t ]+                                                   ;    /* Ignore spaces, tabs, newlines */
.                                                          { printf("Special Symbol: %s\n", yytext); }
%%

int main() {
    printf("Enter the C code:\n\n");
    yylex();
    return 0;
}
lex lexical_analyzer2.l
gcc lex.yy.c -o lexical_analyzer2
./lexical_analyzer2
int a = 10;
if (a > 5) a = a + 1;
Keyword: int
Identifier: a
Operator: =
Number: 10
Keyword: if
Identifier: a
Operator: >
Number: 5
Identifier: a
Operator: =
Identifier: a
Operator: +
Number: 1
Special Symbol: ;

