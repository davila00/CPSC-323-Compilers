%{
#include<stdio.h>
%}

letter [a-zA-Z]
digit [0-9]

%%

void |
int |
char |
include |
main |
printf |
if |
for |
break |
while {printf("\n%s \t\t Keyword",yytext);}

"+" |
"-" |
"*" |
"/" {printf("\n%s \t\t Binary Operator",yytext);}

"=" {printf("\n%s \t\t Assignment Operator",yytext);}

"==" |
"<=" |
">=" |
"<" |
">" |
"!=" {printf("\n%s \t\t Relational Operator",yytext);}

";" |
"!" |
"(" |
")" |
"{" |
"," |
"}" {printf("\n%s \t\t Punctuation",yytext);}

{digit}+ {printf("\n%s \t\t Constant",yytext);}

{letter}({letter}|{digit})* {printf("\n%s \t\t Identifier",yytext);}
%%

int main(int argc, char **argv)
{
  FILE *fop;
  fop = fopen (argv[1], "r");
  yyin = fop;

  printf("\nLexeme  \t Token\n");
  yylex();
  return 1;
}
int yywrap(){}
