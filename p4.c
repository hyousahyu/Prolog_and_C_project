
#include<stdio.h>
#include<string.h>
#include <ctype.h>
#include<stdlib.h>



const char * token(char t){


    switch(t){
        case '(':
            return "lt_paren";
        case ')':
            return "rt_paren";
        case '+':
            return "add_op";
        case '-':
            return "sub_op";
        case '*':
            return "mul_op";
        case '/':
            return "div_op";
        case '^':
            return "pow_op";

        case 'a':
        case 'b':
        case 'c':
            return "id";
        case '0':
            return "0";
        case '1':
            return "1";
        case '2':
            return "2";
        case '3':
            return "3";
        case '4':
            return "4";
        case '5':
            return "5";
        case '6':
            return "6";
        case '7':
            return "7";
        case '8':
            return "8";
        case '9':
            return "9";

        default:
            break;



    }

}



int main() {
    char *s=malloc(1);
    int c;
    int i=0;


    printf("Enter an equation:");
///gets(instr);
    while ((c=getchar())!='\n' && c!=EOF)
    {
        s[i++]=c;
        s=realloc(s,i+1);

    }


    for (int j=0; j < sizeof(s);j++) {
            printf("%s", token(s[j]));



    }

}













