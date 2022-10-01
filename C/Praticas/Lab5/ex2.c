#include <stdio.h>

int main(){
    char pnome[15],snome[15];
    int idade;
    printf("Insira Primeiro nome: ");
    scanf("%s",pnome);
    printf("Insira Segundo nome: ");
    scanf("%s",snome);
    printf("Insira Idade: ");
    scanf("%d",&idade);
    printf("%s-%s\n",pnome,snome);
    if ( pnome=="ISCTE" && snome=="IUL" ){
        printf("Nice :)");
    }

}