%{
#include <stdio.h>

int macro_count = 0;
int header_count = 0;
%}

%%
#define      { macro_count++; }
#include    { header_count++; }

.|\n        ;   /* Ignore other characters */

%%

int yywrap()
{
return 1;
}

int main() {
printf("Enter the files");
    yylex();
    
    printf("Number of macros defined: %d\n", macro_count);
    printf("Number of header files included: %d\n", header_count);
    printf("The total number of macros and header files i:%d", macro_count + header_count);

    return 0;
}
