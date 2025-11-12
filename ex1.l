%{
#include <stdio.h>
#include <string.h>

int count = 0;
char symbolTable[100][30];

int isPresent(char *sym) {
    for (int i = 0; i < count; i++)
        if (strcmp(symbolTable[i], sym) == 0)
            return 1;
    return 0;
}
%}

%%
"int"|"float"|"char"|"if"|"else"|"while"|"for"|"return"   { printf("Keyword: %s\n", yytext); }
[0-9]+                                                     { printf("Number: %s\n", yytext); }
[a-zA-Z_][a-zA-Z0-9_]*                                     {
                                                            if(!isPresent(yytext)) {
                                                                strcpy(symbolTable[count++], yytext);
                                                            }
                                                            printf("Identifier: %s\n", yytext);
                                                          }
[=+\-*/<>]                                                 { printf("Operator: %s\n", yytext); }
[\n\t ]+                                                   ;    /* Ignore spaces and newlines */
.                                                          { printf("Other: %s\n", yytext); }
%%

int main() {
    printf("Enter C code:\n\n");
    yylex();

    printf("\n--- Symbol Table ---\n");
    for (int i = 0; i < count; i++)
        printf("%s\n", symbolTable[i]);
    return 0;
}
