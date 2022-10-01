#include <stdio.h>
#include "pauta.h"

Aluno novo_aluno( ) {
    Aluno a;

    printf("Novo aluno\n");

    printf("Número (0 para cancelar): ");
    scanf("%d", &a.num);
  
      if (a.num >= 1) {
      printf("Nome   : ");
      scanf("%100[^\n]", a.nome);

      printf("Nota   : ");
      scanf("%f", &a.nota);
    } else {
      a.num = -1;
    }

    return a;
}

int main() {
    Aluno a1 = novo_aluno();

      if ( a1.num > 0 ) {
      FILE* ft = fopen( "pauta.txt", "a");
      fprintf( ft, "%d,%s,%f\n", a1.num, a1.nome, a1.nota );
      fclose(ft);
    }
}