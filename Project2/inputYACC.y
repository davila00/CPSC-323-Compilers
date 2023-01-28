/*Declarations*/
%{
  #include<stdio.h>
  int flag = 0;
%}

/*Tokens*/
%token DIGIT
%left '+' '-'
%left '*' '/' '%'
%left '(' ')'

/*Rules*/
%%
Expression:
E
{
  printf("\n");
  printf("Result = %d", $$);
  printf("\n");

  return 0;
}
E:E'+'E {$$ = $1 + $3;} //ADD
 |E'-'E {$$ = $1 - $3;} //SUBTRACT
 |E'*'E {$$ = $1 * $3;} //MULTIPLICATION
 |E'/'E {$$ = $1 / $3;} //DIVISION
 |E'%'E {$$ = $1 % $3;} //MODULUS
 |'('E')' {$$ = $2;}    //PRIORITY
 |DIGIT {$$ = $1;}      //DIGIT
 ;
%%

void main()
{
  printf("Enter the expression:");
  printf("\n");

  yyparse();
  if(flag == 0)
  {
    printf("\n");
    printf("The expression is VALID");
    printf("\n\n");
  }
}
void yyerror()
{
  flag = 1;
  printf("\n");
  printf("The expression is INVALID");
  printf("\n\n");
}
