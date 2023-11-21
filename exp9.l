%{
#include <stdio.h>
int tagCount = 0;
%}

%%
<[^>]+>    { tagCount++; }
.          { /* Ignore other characters */ }
%%
int yywrap()
{
return 1;
}

int main() {
    yylex();
    printf("Total number of HTML tags: %d\n", tagCount);
    return 0;
}